/*
 * statemachine.c
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


#include "statemachine.h"

#include "../system_setup.h"
#include "../battery.h"

#include "../external_systems/battery_measurement.h"
#include "../external_systems/relay_manager.h"
#include "../external_systems/current_transducers.h"
#include "../external_systems/wheel_speed.h"

#include "../spi_driver/ti_bq76pl536_interface.h"
#include "../fault_management/bms_interlock.h"

#include "../communication/bms_terminal.h"
#include "../communication/uc_board_leds.h"

#include "../fault_management/battery_protector.h"

#include "timer.h"

#include <stm32f4xx_hal_gpio.h>
#include <stm32f4xx_hal.h>
#include <stdbool.h>

MainFSMState main_fsm_current_state = MAIN_FSM_STATE_INIT;

typedef enum{
  INIT_FSM_STARTUP_INTERLOCK,
  INIT_FSM_ADDRESS_SLAVES,
  INIT_FSM_SETUP_SLAVES,
  INIT_FSM_GET_INITIAL_CAP,
  INIT_FSM_CALIBRATE_CURRENT_SENSORS,
  INIT_FSM_START_CYCLIC_APPLICATION
}InitFSMState;

extern BatteryFault battery_protector_fault;

bool isBatteryLimitViolated(MainFSMState current_state){
  if(current_state == MAIN_FSM_STATE_ERROR || current_state == MAIN_FSM_STATE_INIT){
    return false; //we do not need to enter the error state if we are already in error state.
  }
  batteryProtector_run();

  if((current_state == MAIN_FSM_STATE_OFF && battery_protector_fault._data_old_off_state) ||
      (current_state != MAIN_FSM_STATE_OFF && battery_protector_fault._data_old)){
    return true;
  }

  if(battery_protector_fault._over_voltage || battery_protector_fault._under_voltage ||
      battery_protector_fault._over_current ||
      battery_protector_fault._over_temperature || battery_protector_fault._under_temperature){
    return true;
  }
  return false;
}

MainFSMState _statemachine_handleInitState(){
  static InitFSMState init_state = INIT_FSM_STARTUP_INTERLOCK;
  BatteryManagerState bm_state;
  CTstate ct_cal_state;
  if(init_state != INIT_FSM_STARTUP_INTERLOCK && isExternalInterlockTriggered()){
    init_state = INIT_FSM_STARTUP_INTERLOCK;
    return MAIN_FSM_STATE_ERROR;
  }
  switch (init_state) {
    case INIT_FSM_STARTUP_INTERLOCK:
      initRelayInterface();
      quitInterlock();
      HAL_Delay(5);
      if(isExternalInterlockTriggered()){
        init_state = INIT_FSM_STARTUP_INTERLOCK;
        return MAIN_FSM_STATE_ERROR;
      }
      init_state = INIT_FSM_ADDRESS_SLAVES;
      break;
    case INIT_FSM_ADDRESS_SLAVES:
      if(TI_BQ76PL536_initDaisyChain() == BMS_HOST_NUMBER_OF_SLAVES)
        init_state = INIT_FSM_SETUP_SLAVES;
      break;
    case INIT_FSM_SETUP_SLAVES:
      TI_BQ76PL536_initDevices();
      init_state = INIT_FSM_GET_INITIAL_CAP;
      break;
    case INIT_FSM_GET_INITIAL_CAP:
      if(initMeasurentData(&bm_state)){
        init_state = INIT_FSM_CALIBRATE_CURRENT_SENSORS;
      }
      break;
    case INIT_FSM_CALIBRATE_CURRENT_SENSORS:
      ct_cal_state = ct_request_compensateOffsetVoltage(100);
      if(ct_cal_state == CT_TIMEOUT || ct_cal_state == CT_HAL_ERROR){
        return MAIN_FSM_STATE_ERROR;
      }
      if(ct_cal_state == CT_OK)
        init_state = INIT_FSM_START_CYCLIC_APPLICATION;
      break;
    case INIT_FSM_START_CYCLIC_APPLICATION:
      if(initTimers() == TIMER_HAL_ERROR){
        return MAIN_FSM_STATE_ERROR;
      }
      if(init_WheelSpeed() == WHEEL_SPEED_HALL_ERROR){
        return MAIN_FSM_STATE_ERROR;
      }
      init_state = INIT_FSM_STARTUP_INTERLOCK;
      return MAIN_FSM_STATE_OFF;
      break;
    default:
      init_state = INIT_FSM_STARTUP_INTERLOCK;
      break;
  }
  return MAIN_FSM_STATE_INIT;
}

MainFSMState _statemachine_handleOffState(){
  static uint32_t last_measurement_update = 0;
  activateSleepModeForAllRelays();

  if(isExternalInterlockTriggered()){
    return MAIN_FSM_STATE_ERROR;
  }

  uint32_t now = HAL_GetTick();

  if(now - last_measurement_update >= BMS_UPDATE_PERIODE_OFF_STATE){
    BatteryManagerState state = updateMeasurentData();
    last_measurement_update = now;
  }

  if(HAL_GPIO_ReadPin(BUTTON_ON_GPIO_Port, BUTTON_ON_Pin) == GPIO_PIN_SET &&
      HAL_GPIO_ReadPin(BUTTON_OFF_GPIO_Port, BUTTON_OFF_Pin) == GPIO_PIN_SET){
    return MAIN_FSM_STATE_PRECHARGE;
  }
  return MAIN_FSM_STATE_OFF;
}

MainFSMState _statemachine_handlePreChargeState(){
  static uint32_t state_entry_time;
  static bool fresh_entry = true;

  uint32_t now = HAL_GetTick();
  if(fresh_entry){
    state_entry_time = now;
    relayManager_turnOnRelay(BMS_HV_PLUS_RELAY);
    relayManager_turnOnRelay(BMS_12V_PLUS_RELAY);
  }
  BatteryManagerState state = updateMeasurentData();


  fresh_entry = true;

  if(isExternalInterlockTriggered()){
    return MAIN_FSM_STATE_ERROR;
  }
  //ToDo: error Handling

  if(HAL_GPIO_ReadPin(BUTTON_OFF_GPIO_Port, BUTTON_OFF_Pin) != GPIO_PIN_SET){
    return MAIN_FSM_STATE_OFF;
  }
  if(now - state_entry_time > BMS_PRECHARGE_TIME){
    return MAIN_FSM_STATE_ON;
  }

  fresh_entry = false;
  return MAIN_FSM_STATE_PRECHARGE;
}

MainFSMState _statemachine_handleOnState(){

  relayManager_turnOnRelay(BMS_PRECHARGER_HV_PLUS);

  BatteryManagerState state = updateMeasurentData();

  if(isExternalInterlockTriggered()){
    return MAIN_FSM_STATE_ERROR;
  }

  //ToDo: error Handling

  if(HAL_GPIO_ReadPin(BUTTON_OFF_GPIO_Port, BUTTON_OFF_Pin) != GPIO_PIN_SET){
    return MAIN_FSM_STATE_OFF;
  }
  return MAIN_FSM_STATE_ON;
}

MainFSMState _statemachine_handleErrorState(){
  static bool button_off_pressed = false;
  static uint32_t time_button_pressed;

  triggerInterlock();
  uint32_t now = HAL_GetTick();
  if(HAL_GPIO_ReadPin(BUTTON_OFF_GPIO_Port, BUTTON_OFF_Pin) != GPIO_PIN_SET){
    if(button_off_pressed){
      if(now - time_button_pressed > BMS_QUIT_ERROR_TIME){
        batteryProtector_clearFaults();
        return MAIN_FSM_STATE_INIT;
      }
    }
    else{
      time_button_pressed = now;
      button_off_pressed = true;
    }
  }
  else{
    button_off_pressed = false;
  }
  return MAIN_FSM_STATE_ERROR;
}

void statemachine_run(){
  ucBoardLED_showState(main_fsm_current_state);
  if(isBatteryLimitViolated(main_fsm_current_state)){
    main_fsm_current_state = MAIN_FSM_STATE_ERROR;
  }
  switch (main_fsm_current_state) {
    case MAIN_FSM_STATE_OFF:
      main_fsm_current_state = _statemachine_handleOffState();
      break;
    case MAIN_FSM_STATE_PRECHARGE:
      main_fsm_current_state = _statemachine_handlePreChargeState();
      break;
    case MAIN_FSM_STATE_ON:
      main_fsm_current_state = _statemachine_handleOnState();
      break;
    case MAIN_FSM_STATE_ERROR:
      main_fsm_current_state = _statemachine_handleErrorState();
      break;
    default:
      main_fsm_current_state = _statemachine_handleInitState();
      break;
  }
}
