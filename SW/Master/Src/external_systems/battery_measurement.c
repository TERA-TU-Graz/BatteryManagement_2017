/**
 * @file battery_measurement.c
 * @author Rene Pöschl
 *
 * This file contains functions to manage the battery on a higher level.
 * It manages all measurement values.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#include "battery_measurement.h"
#include "../system_setup.h"

#include <stm32f4xx_hal.h>
#include <stdbool.h>
#include "../spi_driver/ti_bq76pl536_interface.h"

#define BMS_PACK_VOLTAGE_TOLERANCE 100

bool bms_used_temperature_sensors[BMS_HOST_NUMBER_OF_SLAVES][2] = BMS_TEMPERATURE_SENSORS_USED;

BatteryMeasurementData battery_measurement_data;

uint16_t num_err_voltage_convertion = 0;
uint16_t num_err_temp_convertion = 0;
uint16_t num_err_transmission = 0;


uint8_t calcSOCpercent(){
  int16_t soc_percent =  ((battery_measurement_data._remaining_capacity_uAms)*100)/BMS_mAh_TO_uAmS(BMS_CELL_CAPACITY_mAh);
  if(soc_percent < 0)
    return 0;
  if(soc_percent >100)
    return 100;

  return soc_percent;
}

/**
 * Initialize the data-structure for storing the battery information supplied by one slave device
 *
 * @param {SlaveMeasurementData*} slave_data valid pointer to the slave data structure
 */
void _resetSlaveMeasurentData(SlaveMeasurementData* slave_data){
  slave_data->_pack_voltage = 0;
  unsigned int i;
  for(i = 0; i < BMS_CELLS_PER_SLAVE; i++){
    slave_data->_cell_voltages[i] = 0;
  }
  slave_data->_temperatures[0] = 0;
  slave_data->_temperatures[1] = 0;
  slave_data->_min_cell_voltage = UINT16_MAX;
  slave_data->_max_cell_voltage = 0;
  slave_data->_timestamp_last_valid_update = BM_TIMESTAMP_INVALID;
}

/**
 * Initialize the data-structure for storing battery information
 */
void resetMeasuremntData(){
  unsigned int i;
  for(i = 0; i < BMS_HOST_NUMBER_OF_SLAVES; i++){
    _resetSlaveMeasurentData(&(battery_measurement_data._slave_meas_data[i]));
  }
  battery_measurement_data._average_cell_voltage = 0;
  battery_measurement_data._min_cell_voltage = UINT16_MAX;
  battery_measurement_data._max_cell_voltage = 0;
  battery_measurement_data._battery_voltage = 0;
  battery_measurement_data._average_temperature = 0;
  battery_measurement_data._min_temperature = INT16_MAX;
  battery_measurement_data._max_temperature = INT16_MIN;
  battery_measurement_data._oldest_data = BM_TIMESTAMP_INVALID;
}

bool initMeasurentData(BatteryManagerState *data_update_state){
  resetMeasuremntData();

  *data_update_state = updateMeasurentData();

  if(BM_IS_TIMESTAMP_OK(battery_measurement_data._oldest_data)){
    double init_cap = BMS_CELL_REMAINING_CAP_mAh((double)battery_measurement_data._min_cell_voltage)*3600*1000*1000;
    init_cap = init_cap < 0.0 ? 0.0 : init_cap;
    init_cap = init_cap > (double)BMS_CELL_CAPACITY_mAh*3600*1000*1000 ?
        (double)BMS_CELL_CAPACITY_mAh*3600*1000*1000 : init_cap;
    battery_measurement_data._remaining_capacity_uAms = (uint64_t)init_cap;
    return 1;
  }

  // only allowed if update measurement had an error!
  assert_param(*data_update_state != BATTERY_MANAGER_OK);
  return 0;

}

/**
 * Read the measurement data from a slave device and store it in the data structure given
 *
 * @param {SlaveMeasurementData*} slave_data valid pointer to the slave data structure
 * @return {bool} true on success
 */
BatteryManagerState updateMeasurementForSlaveDevice(uint8_t device_address){
  TI_BQ76PL536_RawMeasurementData raw_data;
  if(!TI_BQ76PL536_readMeasurementData(device_address, &raw_data, BMS_SLAVES_CRC_RETRANSMIT_LIMIT_MEASUREMENT)){
    num_err_transmission++;
    return BATTERY_MANAGER_TRANSMISSION_ERROR;
  }

  SlaveMeasurementData *slave_data = &(battery_measurement_data._slave_meas_data[device_address-1]);

  //convert voltages:
  unsigned int i;
  bool voltage_conversion_ok = true;
  uint16_t pack_voltage_from_cell_voltages = 0;
  uint16_t temp_cell_voltages[BMS_CELLS_PER_SLAVE];
  uint16_t min_cell_voltage = UINT16_MAX;
  uint16_t max_cell_voltage = 0;
  uint16_t pack_voltage;

  for(i = 0; i < BMS_CELLS_PER_SLAVE; i++){
    voltage_conversion_ok &= TI_BQ76PL536_cellVoltageFromAdcValue(&(raw_data._cell_voltages[i]), &(temp_cell_voltages[i]));
    pack_voltage_from_cell_voltages += temp_cell_voltages[i];
    if(temp_cell_voltages[i] > max_cell_voltage){
      max_cell_voltage = temp_cell_voltages[i];
    }
    if(temp_cell_voltages[i] < min_cell_voltage){
      min_cell_voltage = temp_cell_voltages[i];
    }
  }
  voltage_conversion_ok &= TI_BQ76PL536_packVoltageFromAdcValue(&(raw_data._pack_voltage), &(pack_voltage));

  if(pack_voltage < BMS_PACK_VOLTAGE_TOLERANCE || //underflow
    pack_voltage - BMS_PACK_VOLTAGE_TOLERANCE > pack_voltage_from_cell_voltages ||
    UINT16_MAX - BMS_PACK_VOLTAGE_TOLERANCE < pack_voltage || //overflow
    pack_voltage + BMS_PACK_VOLTAGE_TOLERANCE < pack_voltage_from_cell_voltages){
      voltage_conversion_ok = false;
  }
  if(voltage_conversion_ok){
    uint32_t now = HAL_GetTick();
    slave_data->_timestamp_last_valid_update = (now > (uint32_t)INT32_MAX) ? INT32_MAX : (int32_t)now;
    for(i = 0; i < BMS_CELLS_PER_SLAVE; i++){
      slave_data->_cell_voltages[i] = temp_cell_voltages[i];
    }
    slave_data->_min_cell_voltage = min_cell_voltage;
    slave_data->_max_cell_voltage = max_cell_voltage;
    slave_data->_pack_voltage = pack_voltage;
  }
  else{
    num_err_voltage_convertion++;
  }
  bool temperature_conversion_ok = true;

  for(i=0; i<BMS_NUMBER_TEMP_INTERFACES_PER_SLAVE; i++){
    if(bms_used_temperature_sensors[device_address-1][i]){
      temperature_conversion_ok &= TI_BQ76PL536_tempertureFromAdcValue(&(raw_data._temperatures[i]), &(slave_data->_temperatures[i]));
    }
  }
  if(!temperature_conversion_ok){
    num_err_temp_convertion++;
  }

  if(!voltage_conversion_ok && !temperature_conversion_ok){
    return BATTERY_MANNAGER_CONV;
  }
  if(!voltage_conversion_ok){
    return BATTERY_MANNAGER_VOLTAGE_CONV_FAULT;
  }
  if(!temperature_conversion_ok){
    return BATTERY_MANNAGER_TEMP_CONV_FAULT;
  }

  return BATTERY_MANAGER_OK;

}


BatteryManagerState updateMeasurentData(){
  if(!TI_BQ76PL536_wakeup(BMS_SLAVES_CRC_RETRANSMIT_LIMIT_MEASUREMENT)){
    num_err_transmission++;
    return BATTERY_MANAGER_TRANSMISSION_ERROR;
  }
  if(!TI_BQ76PL536_prepareDevicesForMeasurement(BMS_SLAVES_CRC_RETRANSMIT_LIMIT_MEASUREMENT)){
    num_err_transmission++;
    return BATTERY_MANAGER_TRANSMISSION_ERROR;
  }
  battery_measurement_data._min_cell_voltage = UINT16_MAX;
  battery_measurement_data._max_cell_voltage = 0;
  battery_measurement_data._min_temperature = INT16_MAX;
  battery_measurement_data._max_temperature = INT16_MIN;

  battery_measurement_data._oldest_data = INT32_MAX;

  battery_measurement_data._battery_voltage = 0;

  uint8_t device_address;

  int32_t avg_temp_calc_denom = 0;
  BatteryManagerState worst_state = BATTERY_MANAGER_OK;

  for(device_address = 1; device_address <= BMS_HOST_NUMBER_OF_SLAVES; device_address++){
    BatteryManagerState state = updateMeasurementForSlaveDevice(device_address);
    worst_state = state > worst_state ? state : worst_state;

    SlaveMeasurementData *slave_data = &(battery_measurement_data._slave_meas_data[device_address-1]);

    if(slave_data->_timestamp_last_valid_update < battery_measurement_data._oldest_data){
      battery_measurement_data._oldest_data = slave_data->_timestamp_last_valid_update;
    }

    if(slave_data->_min_cell_voltage < battery_measurement_data._min_cell_voltage){
      battery_measurement_data._min_cell_voltage = slave_data->_min_cell_voltage;
    }
    if(slave_data->_max_cell_voltage > battery_measurement_data._max_cell_voltage){
      battery_measurement_data._max_cell_voltage = slave_data->_max_cell_voltage;
    }
    battery_measurement_data._battery_voltage += slave_data->_pack_voltage;

#if BMS_NUMBER_TEMPERATURE_SENSORS > 0
    uint i;
    for(i=0; i<BMS_NUMBER_TEMP_INTERFACES_PER_SLAVE; i++){
      if(bms_used_temperature_sensors[device_address-1][i]){
        avg_temp_calc_denom += slave_data->_temperatures[i];

        if(slave_data->_temperatures[i] < battery_measurement_data._min_temperature){
          battery_measurement_data._min_temperature = slave_data->_temperatures[i];
        }
        if(slave_data->_temperatures[i] > battery_measurement_data._max_temperature){
          battery_measurement_data._max_temperature = slave_data->_temperatures[i];
        }
      }
    }
#endif
  }

#if BMS_NUMBER_TEMPERATURE_SENSORS > 0
  battery_measurement_data._average_temperature = avg_temp_calc_denom/BMS_NUMBER_TEMPERATURE_SENSORS;
#endif

  battery_measurement_data._average_cell_voltage = battery_measurement_data._battery_voltage/(BMS_HOST_NUMBER_OF_SLAVES*BMS_CELLS_PER_SLAVE);

  if(!TI_BQ76PL536_enterSleepMode(BMS_SLAVES_CRC_RETRANSMIT_LIMIT_MEASUREMENT, BMS_SLAVES_TIMEOUT_ENTER_SLEEPMODE)){
    num_err_transmission++;
    return BATTERY_MANAGER_TRANSMISSION_ERROR;
  }
  return worst_state;
}
