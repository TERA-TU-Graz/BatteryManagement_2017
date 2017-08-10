/*
 * @file timer.c
 * @author Pöschl Rene
 *
 * This file holds the timer callback functions and everything that manages cyclic functionalities.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#include "timer.h"
#include <stm32f4xx_hal_tim.h>

#include "../external_systems/current_transducers.h"
#include "../communication/bms_terminal.h"
#include "../communication/bms_can.h"


extern TIM_HandleTypeDef htim3;
extern TIM_HandleTypeDef htim6;
extern TIM_HandleTypeDef htim7;
extern uint32_t timer_measurement;
uint32_t timer_measurement_result;

void HAL_SYSTICK_Callback(void){
  timer_measurement_result = timer_measurement;
  timer_measurement = 0;
}

TimerStatus initTimers(){
  if(HAL_TIM_Base_Start_IT(&htim6) != HAL_OK){
    return TIMER_HAL_ERROR;
  }
  if(HAL_TIM_Base_Start_IT(&htim7) != HAL_OK){
    return TIMER_HAL_ERROR;
  }
  return TIMER_OK;
}


void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim){
  if(htim->Instance == TIM6){
    ct_request_updateCurrent();
  }
  if(htim->Instance == TIM7){
    terminalUpdate();
    canManager_run();
  }
}
