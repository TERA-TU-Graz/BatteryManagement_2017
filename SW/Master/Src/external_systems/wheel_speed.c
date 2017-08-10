/*
 * wheel_speed.c
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

#include "wheel_speed.h"
#include <stm32f4xx_hal_tim.h>

int32_t _wheel_speed_filtered = 0;

extern TIM_HandleTypeDef htim2;

WheelSpeedState init_WheelSpeed(){
  if(HAL_TIM_IC_Start_IT(&htim2, TIM_CHANNEL_4) != HAL_OK){
    return WHEEL_SPEED_HALL_ERROR;
  }
  return WHEEL_SPEED_OK;
}

int32_t getWheelSpeed(){
  return _wheel_speed_filtered;
}


/*
 * Wheel Speed in rpm:
 * Timer Prescaler = 839 -> LSB counter is 10^-5 seconds
 * (With period = 3600*10*10e5 -> timer overrun after 10 hours -> no overrun during race!)
 *
 *          10^5 * 60     10^3 * 60
 * v[rpm] = ————————— = ———————————————
 *           dt *100    ccr4 - ccr4_old
 */
void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim){
  static uint32_t counter_old = 0;
  if(htim->Instance == TIM2){
    if(htim->Instance->CCR4 <= counter_old){
      // overflow (we ignore one measurement every 10 hours)
      counter_old = htim->Instance->CCR4;
      return;
    }
    _wheel_speed_filtered = 60000/(htim->Instance->CCR4 - counter_old);
    counter_old = htim->Instance->CCR4;
  }
}
