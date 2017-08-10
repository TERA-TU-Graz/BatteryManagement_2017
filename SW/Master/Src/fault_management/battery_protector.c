/*
 * battery_protector.c
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

#include "../battery.h"
#include "../system_setup.h"
#include "../external_systems/battery_measurement.h"
#include "../external_systems/current_transducers.h"
#include "battery_protector.h"

extern BatteryMeasurementData battery_measurement_data;

BatteryFault battery_protector_fault = {0,0,0,0,0,0,0,0};

uint32_t error_counter_over_voltage = 0;
uint32_t error_counter_under_voltage = 0;
uint32_t error_counter_over_temperature = 0;
uint32_t error_counter_under_temperature = 0;
uint32_t error_counter_over_current = 0;


void _batteryProtector_checkSlaveMeasurements(uint32_t now){
  if(now - battery_measurement_data._oldest_data > BMS_MAXIMUM_AGE_MEASUREMENT_DATA){
    battery_protector_fault._data_old = true;
    if(now - battery_measurement_data._oldest_data > BMS_MAXIMUM_AGE_MEASUREMENT_DATA_OFF_STATE){
      battery_protector_fault._data_old_off_state = true;
    }
    return; // We can not trust the measurements anymore.
  }
  int32_t current = ct_getCurrent(0);
  if(battery_measurement_data._max_cell_voltage - (current*BMS_CELL_R_INT_FULLY_CHARGED)/1000 > BMS_CELL_END_OF_CHARGE_VOLTAGE){
    error_counter_over_voltage++;
  }
  else{
    error_counter_over_voltage = 0;
  }
  if(error_counter_over_voltage > BMS_ERROR_COUNTER_LIMIT){
    battery_protector_fault._over_voltage = true;
  }

  if(battery_measurement_data._min_cell_voltage + (current*BMS_CELL_R_INT_EMPTY)/1000 < BMS_CELL_CUT_OFF_VOLTAGE){
    error_counter_over_voltage++;
  }
  else{
    error_counter_over_voltage = 0;
  }
  if(error_counter_under_voltage > BMS_ERROR_COUNTER_LIMIT){
     battery_protector_fault._under_voltage = true;
  }

  /*if(battery_measurement_data._max_temperature > BMS_CELL_MAXTEMP){
    error_counter_over_temperature++;
  }*/
  if(battery_measurement_data._slave_meas_data[0]._temperatures[0] > BMS_CELL_MAXTEMP
        && battery_measurement_data._slave_meas_data[1]._temperatures[1] > BMS_CELL_MAXTEMP){
    error_counter_over_temperature++;
  }
  else{
    error_counter_over_temperature = 0;
  }
  if(error_counter_over_temperature > BMS_ERROR_COUNTER_LIMIT){
    battery_protector_fault._over_temperature= true;
  }

  /*
  if(battery_measurement_data._min_temperature < BMS_CELL_MINTEMP){
    error_counter_under_temperature++;
  }*/
  if(battery_measurement_data._slave_meas_data[0]._temperatures[0] < BMS_CELL_MINTEMP
      && battery_measurement_data._slave_meas_data[1]._temperatures[1] < BMS_CELL_MINTEMP){
    error_counter_under_temperature++;
  }
  else{
    error_counter_under_temperature = 0;
  }
  if(error_counter_under_temperature > BMS_ERROR_COUNTER_LIMIT){
    battery_protector_fault._under_temperature= true;
  }
}

void _batteryProtector_checkCurrent(uint32_t now){
  if(ct_getCurrent(0) > BMS_MAX_CURRENT){
    error_counter_over_current++;
  }
  else{
    error_counter_over_current = 0;
  }
  if(error_counter_over_current > BMS_ERROR_COUNTER_LIMIT){
    //battery_protector_fault._over_current= true;
  }
}

void batteryProtector_clearFaults(){
  error_counter_over_voltage = 0;
  error_counter_under_voltage = 0;
  error_counter_over_temperature = 0;
  error_counter_under_temperature = 0;
  error_counter_over_current = 0;

  battery_protector_fault._data_old = 0;
  battery_protector_fault._data_old_off_state = 0;

  battery_protector_fault._over_voltage = 0;
  battery_protector_fault._under_voltage = 0;
  battery_protector_fault._over_current = 0;
  battery_protector_fault._over_temperature = 0;
  battery_protector_fault._under_temperature = 0;
  battery_protector_fault._future_use1 = 0;
}

void batteryProtector_run(){
  uint32_t now = HAL_GetTick();

  _batteryProtector_checkSlaveMeasurements(now);
  _batteryProtector_checkCurrent(now);
}
