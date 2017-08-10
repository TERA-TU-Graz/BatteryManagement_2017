/*
 * adc_manager.c
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

#include "adc_manager.h"
#include "current_transducers.h"
#include <stdbool.h>
#include <stdint.h>

// DMA will put ADC1 conversion values into adc1_storage.
__attribute__ ((section (".sram")))uint16_t adc1_storage[ADC1_NUM_CHANNELS];
__attribute__ ((section (".sram")))uint16_t adc2_storage[ADC2_NUM_CHANNELS];


extern ADC_HandleTypeDef hadc1;
extern ADC_HandleTypeDef hadc2;

uint32_t error_cycle_time_adc2 = 0;

bool _adc2_worker_busy = false;

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc){
#ifdef BMS_USE_MASTER_TEMP_SENSORS
  if(hadc->Instance == ADC1){

  }
#endif
  if(hadc->Instance == ADC2){
    if(_adc2_worker_busy){
      error_cycle_time_adc2++;
    }
    _adc2_worker_busy = true;
    handle_adc_callback(adc2_storage);
    _adc2_worker_busy = false;
  }

}

HAL_StatusTypeDef adc_start_adc1(){
  return HAL_ADC_Start_DMA(&hadc1, (uint32_t*)adc1_storage, ADC1_NUM_CHANNELS);
}

HAL_StatusTypeDef adc_start_adc2(){
  return HAL_ADC_Start_DMA(&hadc2, (uint32_t*)adc2_storage, ADC2_NUM_CHANNELS);
}
