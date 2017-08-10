/*
 * current_transducers.c
 *
 * This file implements the interface for the current transducers used.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#include "current_transducers.h"
#include "adc_manager.h"
#include "battery_measurement.h"

#include <stm32f4xx_hal.h>

bool _ct_compensateOffsetRequest = false;
bool _ct_compensateOffsetDone = false;
int32_t _ct_offset[BMS_NUMBER_CURRENT_TRANSDUCERS];

int32_t _current_values[BMS_NUMBER_CURRENT_TRANSDUCERS][BMS_CURRENT_VALUE_FILTER_SIZE];
int32_t filtered_current[BMS_NUMBER_CURRENT_TRANSDUCERS];
int32_t _ct_filter_sum[BMS_NUMBER_CURRENT_TRANSDUCERS];

uint32_t timer_measurement = 0;

extern BatteryMeasurementData battery_measurement_data;

bool ct_request_updateCurrent(){
  return adc_start_adc2() == HAL_OK;
}
CTstate ct_request_compensateOffsetVoltage(uint32_t timeout){
#ifdef BMS_CURRENT_TRANSDUCERS_USE_OFFSET_COMPARISON
  static uint32_t time1;
  if(_ct_compensateOffsetRequest){
    if(_ct_compensateOffsetDone){
      _ct_compensateOffsetRequest = false;
      return CT_OK;
    }
    if(time1 - HAL_GetTick() > timeout){
      _ct_compensateOffsetRequest = false;
      return CT_TIMEOUT;
    }
    return CT_BUSY;
  }

  uint i;
  for(i = 0; i < BMS_NUMBER_CURRENT_TRANSDUCERS; i++){
    _ct_offset[i] = 0;
  }
  _ct_compensateOffsetRequest = true;
  _ct_compensateOffsetDone = false;
  if(adc_start_adc2() != HAL_OK){
    _ct_compensateOffsetRequest = false;
    return CT_HAL_ERROR;
  }
  time1 = HAL_GetTick();
  return CT_BUSY;
#else
  uint i;
  for(i = 0; i < BMS_NUMBER_CURRENT_TRANSDUCERS; i++){
    _ct_offset[i] = 0;
  }
  return CT_OK;
#endif
}

int32_t ct_getCurrent(uint transducer_idx){
  return filtered_current[transducer_idx];
}

int32_t _ct_filterOffset(uint transducer_idx){
  uint i;
  int32_t offset = 0;
  for(i=0; i< BMS_CURRENT_VALUE_FILTER_SIZE; i++){
    offset += _current_values[transducer_idx][i];
    _current_values[transducer_idx][i] = 0;
  }
  return offset/BMS_CURRENT_VALUE_FILTER_SIZE;
}

void handle_adc_callback(uint16_t* adc_values){
  uint transducer_idx;
  static uint measurement_idx = 0;

  if(_ct_compensateOffsetRequest){
    for(transducer_idx = 0; transducer_idx < BMS_NUMBER_CURRENT_TRANSDUCERS; transducer_idx++){
      _current_values[transducer_idx][measurement_idx] = CURRENT_TRANSDUCER_CALCULATE_OFFSET_CENTI_MILLI_VOLT(adc_values[transducer_idx]);
      if(measurement_idx == BMS_CURRENT_VALUE_FILTER_SIZE - 1){
        _ct_offset[transducer_idx] = _ct_filterOffset(transducer_idx);
      }
    }
    if(measurement_idx == BMS_CURRENT_VALUE_FILTER_SIZE-1){
      _ct_compensateOffsetDone = true;
      measurement_idx = 0;
      return;
    }
    measurement_idx = (measurement_idx+1)%BMS_CURRENT_VALUE_FILTER_SIZE;
    adc_start_adc2();
  }
  else{
    timer_measurement++;
    for(transducer_idx = 0; transducer_idx < BMS_NUMBER_CURRENT_TRANSDUCERS; transducer_idx++){
      _current_values[transducer_idx][measurement_idx] = CURRENT_FROM_ADC_VALUE_uA(adc_values[transducer_idx],_ct_offset[transducer_idx]);
      _ct_filter_sum[transducer_idx] += _current_values[transducer_idx][measurement_idx]/1000;
      if(measurement_idx == BMS_CURRENT_VALUE_FILTER_SIZE - 1){
        filtered_current[transducer_idx] = _ct_filter_sum[transducer_idx]/BMS_CURRENT_VALUE_FILTER_SIZE;
        _ct_filter_sum[transducer_idx] = 0;
      }
    }
    battery_measurement_data._remaining_capacity_uAms -= _current_values[0][measurement_idx]/(TIM_6_FREQUENCY/1000);
    measurement_idx = (measurement_idx+1)%BMS_CURRENT_VALUE_FILTER_SIZE;
  }
}
