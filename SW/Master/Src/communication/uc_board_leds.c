/*
 * uc_board_leds.c
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

#include "main.h"
#include "uc_board_leds.h"
#include "stm32f4xx_hal.h"
#include <stm32f4xx_hal_gpio.h>

void ucBoardLED_signalErrorState(){
  static unsigned int counter = 0;
  static uint32_t last_change;
  uint32_t now = HAL_GetTick();

  if(last_change-now > 300){
    last_change = now;
    counter=(counter+1)%3;
    if(counter==0){
      HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_SET);
      HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_RESET);
      HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, GPIO_PIN_RESET);
    }
    if(counter==1){
      HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_RESET);
      HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_SET);
      HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, GPIO_PIN_RESET);
    }
    if(counter==2){
      HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_RESET);
      HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_RESET);
      HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, GPIO_PIN_SET);
    }
  }
}


void ucBoardLED_showState(MainFSMState main_fsm_state){
  static uint counter = 0;
  if(main_fsm_state == MAIN_FSM_STATE_ERROR){
    ucBoardLED_signalErrorState();
    return;
  }
  ucBoardLED_signalCPUalive();

  if(main_fsm_state == MAIN_FSM_STATE_OFF){
    HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_RESET);
  }
  if(main_fsm_state == MAIN_FSM_STATE_ON){
    HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, GPIO_PIN_SET);
    HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_RESET);
  }
  if(main_fsm_state == MAIN_FSM_STATE_PRECHARGE){
    HAL_GPIO_TogglePin(LED3_GPIO_Port, LED3_Pin);
    HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_RESET);
  }

  if(main_fsm_state == MAIN_FSM_STATE_INIT){
    if(counter &0x1){
      HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, GPIO_PIN_SET);
      HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_SET);
    }
    else{
      HAL_GPIO_WritePin(LED3_GPIO_Port, LED3_Pin, GPIO_PIN_RESET);
      HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_RESET);
    }
  }
  counter++;
}
void ucBoardLED_signalCPUalive(){
  static uint32_t last_change;
  uint32_t now = HAL_GetTick();

  if(now - last_change > 500){
    last_change = now;
    HAL_GPIO_TogglePin(LED1_GPIO_Port, LED1_Pin);
  }
}
