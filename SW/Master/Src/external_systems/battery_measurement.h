/**
 * @file battery_measurement.h
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

#include <stdbool.h>
#include <stdint.h>
#include "../battery.h"

#ifndef SRC_BATTERY_MEASUREMENT_H_
#define SRC_BATTERY_MEASUREMENT_H_

#define BM_TIMESTAMP_INVALID INT32_MIN
#define BM_IS_TIMESTAMP_OK(timestamp) ((timestamp) >= 0)

typedef struct{
  uint16_t _pack_voltage;
  uint16_t _cell_voltages[BMS_CELLS_PER_SLAVE];
  int16_t _temperatures[2];
  uint16_t _min_cell_voltage;
  uint16_t _max_cell_voltage;
  int32_t _timestamp_last_valid_update;
}SlaveMeasurementData;

typedef struct{
  SlaveMeasurementData _slave_meas_data[BMS_HOST_NUMBER_OF_SLAVES];
  uint16_t _average_cell_voltage;
  uint16_t _min_cell_voltage;
  uint16_t _max_cell_voltage;
  uint32_t _battery_voltage;
  int16_t _average_temperature;
  int16_t _min_temperature;
  int16_t _max_temperature;
  int32_t _oldest_data;
  uint64_t _remaining_capacity_uAms;
}BatteryMeasurementData;

typedef enum{BATTERY_MANAGER_OK = 0x00,
  BATTERY_MANNAGER_TEMP_CONV_FAULT = 0x10,
  BATTERY_MANNAGER_VOLTAGE_CONV_FAULT = 0x21,
  BATTERY_MANNAGER_CONV = 0x22,
  BATTERY_MANAGER_TRANSMISSION_ERROR = 0xFF
  }BatteryManagerState;


void resetMeasurentData();
BatteryManagerState updateMeasurentData();
bool initMeasurentData(BatteryManagerState* state_data_update);

uint8_t calcSOCpercent();

#endif /* SRC_BATTERY_MEASUREMENT_H_ */
