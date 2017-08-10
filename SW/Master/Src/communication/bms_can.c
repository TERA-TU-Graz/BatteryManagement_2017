/*
 * bms_can.c
 *
 * ToDo: add file description here
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#include <can_handler.h>
#include <can/can_fennek.h>
#include <can/can_defines_fennek.h>
#include <stdbool.h>
#include "bms_can.h"

#include "../core/statemachine.h"
#include "../fault_management/battery_protector.h"
#include "../external_systems/battery_measurement.h"
#include "../external_systems/current_transducers.h"
#include "../external_systems/wheel_speed.h"

extern TeraCanChannel hcan1;
extern MainFSMState main_fsm_current_state;
extern BatteryFault battery_protector_fault;
extern BatteryMeasurementData battery_measurement_data;

int8_t initBMScan(){
  bmsCan_wakeup();
  int8_t channel = CANhandler_addChannel(&hcan1);

  return CANfennek_init(channel, CAN_BOARD_BMS);
}

void bmsCan_wakeup(){
#if BMS_MASTER_VERSION >= 6
  HAL_GPIO_WritePin(CAN1_RS_GPIO_Port, CAN1_RS_Pin, GPIO_PIN_RESET);
#endif
}

void bmsCan_sleep(){

#if BMS_MASTER_VERSION >= 6
  HAL_GPIO_WritePin(CAN1_RS_GPIO_Port, CAN1_RS_Pin, GPIO_PIN_SET);
#endif

}

BMSCanManagerState _bmsCan_sendStatusMessage(){
  uint32_t legacy_state = 0;
  if(main_fsm_current_state == MAIN_FSM_STATE_ON){
    legacy_state |= (CAN_STATE_BMS_HV_OUTPUT_ENABLED || CAN_STATE_BMS_AUX_OUTPUT_ENABLED);
  }
  if(main_fsm_current_state == MAIN_FSM_STATE_PRECHARGE){
    legacy_state |= CAN_STATE_BMS_AUX_OUTPUT_ENABLED;
  }
  if(battery_protector_fault._over_current){
    legacy_state |= CAN_STATE_BMS_HV_OVERCURRENT;
  }
  if(battery_protector_fault._under_voltage){
    legacy_state |= CAN_STATE_BMS_HV_UNDERVOLTAGE;
  }
  if(battery_protector_fault._over_temperature){
    legacy_state |= CAN_STATE_BMS_HV_OVERTEMPERATURE;
  }

  if(CANfennek_sendStatusMessage(CAN_FENNEK_PRIORITY_1 ,legacy_state) != 0){
    return BMS_CAN_HAL_ERROR;
  }
  return BMS_CAN_OK;
}


BMSCanManagerState _bmsCan_sendCurrent(){
  uint8_t can_state = 0;

  int32_t hv_current = ct_getCurrent(1);
  can_state |= CANfennek_sendDataMessage(CAN_FENNEK_PRIORITY_1, CAN_MSG_BMS_HV_CURRENT, hv_current);
  can_state |= CANfennek_sendDataMessage(CAN_FENNEK_PRIORITY_2, CAN_MSG_BMS_AUX_CURRENT, ct_getCurrent(0) - hv_current);
  if(can_state != 0){
    return BMS_CAN_HAL_ERROR;
  }
  return BMS_CAN_OK;
}

BMSCanManagerState _bmsCan_sendVoltageAndSOC(){
  uint8_t can_state = 0;


  can_state |= CANfennek_sendDataMessage(CAN_FENNEK_PRIORITY_3, CAN_MSG_BMS_HV_VOLTAGE, battery_measurement_data._battery_voltage);

  can_state |= CANfennek_sendDataMessage(CAN_FENNEK_PRIORITY_7, CAN_MSG_BMS_HV_PERCENTAGE, calcSOCpercent());

  if(can_state != 0){
    return BMS_CAN_HAL_ERROR;
  }
  return BMS_CAN_OK;
}

BMSCanManagerState _bmsCan_sendTemperatures(){
  uint8_t can_state = 0;
  can_state |= CANfennek_sendDataMessage(CAN_FENNEK_PRIORITY_8, CAN_MSG_BMS_AUX_TEMPERATURE,
      battery_measurement_data._slave_meas_data[0]._temperatures[0]/10);
  can_state |= CANfennek_sendDataMessage(CAN_FENNEK_PRIORITY_7, CAN_MSG_BMS_HV_TEMPERATURE,
        battery_measurement_data._slave_meas_data[1]._temperatures[1]/10);

  if(can_state != 0){
    return BMS_CAN_HAL_ERROR;
  }
  return BMS_CAN_OK;
}

BMSCanManagerState _bmsCan_sendPower(){
  uint8_t can_state = 0;

  int32_t hv_current = ct_getCurrent(1);
  can_state |= CANfennek_sendDataMessage(CAN_FENNEK_PRIORITY_5, CAN_MSG_BMS_HV_POWER,
      (hv_current*battery_measurement_data._battery_voltage)/1000);
  can_state |= CANfennek_sendDataMessage(CAN_FENNEK_PRIORITY_6, CAN_MSG_BMS_AUX_POWER,
      ((ct_getCurrent(0)-hv_current)*battery_measurement_data._battery_voltage)/1000);
  if(can_state != 0){
    return BMS_CAN_HAL_ERROR;
  }
  return BMS_CAN_OK;
}
BMSCanManagerState _bmsCan_sendWheelSpeed(){
  // Impersonate motor controller and send wheel speed.
  uint32_t msg_id = (1 << CAN_BOARD_MOTORCONTROL)
      | (CAN_FENNEK_MSG_TYPE_DATA << CAN_FENNEK_MSG_TYPE_POS)
      | ((CAN_FENNEK_PRIORITY_1 & CAN_FENNEK_PRIORITY_MASK) << CAN_FENNEK_PRIORITY_POS);

  int16_t data = getWheelSpeed();

  uint8_t can_data[8];

  can_data[0] = CAN_BOARD_MOTORCONTROL;
  can_data[1] = CAN_MSG_MC_RPM_WHEEL;
  can_data[2] = data & 0xFF;
  can_data[3] = (data>>8) & 0xFF;
  can_data[4] = (data>>16) & 0xFF;
  can_data[5] = (data>>24) & 0xFF;
  can_data[6] = 0;
  can_data[7] = 0;

  return CANx_send(msg_id, can_data, 6, true, 0);
}
BMSCanManagerState canManager_run(){
  if(main_fsm_current_state == MAIN_FSM_STATE_OFF || main_fsm_current_state == MAIN_FSM_STATE_INIT ||
      main_fsm_current_state == MAIN_FSM_STATE_ERROR){
    bmsCan_sleep();
    return BMS_CAN_OK;
  }
  bmsCan_wakeup();

  CANfennek_status_periodHandler();

  static uint8_t counter = 0;
  _bmsCan_sendWheelSpeed();

  switch (counter++) {
    case 0:
      return _bmsCan_sendCurrent();
      break;
    case 1:
      return _bmsCan_sendVoltageAndSOC();
      break;
    case 2:
      return _bmsCan_sendTemperatures();
      break;
    case 3:
      return _bmsCan_sendPower();
      break;
    default:
      counter = 0;
      return _bmsCan_sendStatusMessage();
      break;
  }
}
