/*
 * adc_manager.h
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
#ifndef SRC_EXTERNAL_SYSTEMS_ADC_MANAGER_H_
#define SRC_EXTERNAL_SYSTEMS_ADC_MANAGER_H_

#include <main.h>
#include <stm32f4xx_hal_adc.h>

#define ADC_VREF_CENTI_MILLI_VOLT 330000

#define ADC_VAL_TO_CENTI_MILLI_VOLT(adc_val) (((adc_val)*ADC_VREF_CENTI_MILLI_VOLT)/ADC_RANGE)

HAL_StatusTypeDef adc_start_adc1();
HAL_StatusTypeDef adc_start_adc2();

#endif /* SRC_EXTERNAL_SYSTEMS_ADC_MANAGER_H_ */
