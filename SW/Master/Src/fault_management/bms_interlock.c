/*
 * bms_interlock.c
 *
 *  Created on: 10.08.2014
 *      Author: Rene
 */

#include "bms_interlock.h"

#include <main.h>
#include <stdbool.h>
#include <stdint.h>
#include <stm32f4xx_hal_gpio.h>
#include "../board_cfg.h"

#define _BMS_INTERLOCK_TIMEBASE_1s 2500

#define _BMS_INTERLOCK_TIMER_PERIOD (\
    (BMS_INTERLOCK_DELAY_MINUTES * 60 + BMS_INTERLOCK_DELAY_SECONDS)\
    * _BMS_INTERLOCK_TIMEBASE_1s - 1)
#define _BMS_INTERLOCK_TIMER_PRESCALER 33599

bool _timer_1_expired = true;
bool _timer_2_expired = true;
bool _interlock_now = true;


void _interlockOutputOn();
void _interlockOutputOff();

/*********************************************************
 * Internal Helper Functions
 *********************************************************/
void _interlockOutputOn(){
  HAL_GPIO_WritePin(Interlock_On1_GPIO_Port, Interlock_On1_Pin, INTERLOCK_ON);
  HAL_GPIO_WritePin(Interlock_On2_GPIO_Port, Interlock_On2_Pin, INTERLOCK_ON);

}
void _interlockOutputOff(){
  HAL_GPIO_WritePin(Interlock_On1_GPIO_Port, Interlock_On1_Pin, INTERLOCK_OFF);
  HAL_GPIO_WritePin(Interlock_On2_GPIO_Port, Interlock_On2_Pin, INTERLOCK_OFF);
}
bool isExternalInterlockTriggered(){
  //return (HAL_GPIO_ReadPin(Interlock_OK_GPIO_Port, Interlock_OK_Pin) == GPIO_PIN_RESET); I have no idea why this does not always work.
  return ((Interlock_OK_GPIO_Port->IDR & Interlock_OK_Pin) == (uint32_t)GPIO_PIN_RESET);
}

/*void startInterlockTimer(){
  _BMS_INTERLOCK_TIMER1->CNT = 0;
  _BMS_INTERLOCK_TIMER1->CR1 |= TIM_CR1_CEN;

  _BMS_INTERLOCK_TIMER2->CNT = 0;
  _BMS_INTERLOCK_TIMER2->CR1 |= TIM_CR1_CEN;
}
void stoppInterlockTimer(){
  _BMS_INTERLOCK_TIMER1->CNT = 0;
  _BMS_INTERLOCK_TIMER1->CR1 &= ~TIM_CR1_CEN;

  _BMS_INTERLOCK_TIMER2->CNT = 0;
  _BMS_INTERLOCK_TIMER2->CR1 &= ~TIM_CR1_CEN;
}*/

void quitInterlock(){
  //Todo: check if allowed
  //if(quit_value == BMS_RESET_INTLOCK_VALUE){
    //stoppInterlockTimer();
    _timer_1_expired = false;
    _timer_2_expired = false;
    _interlock_now = false;
    _interlockOutputOn();
  //}
}
bool isInternalInterlockTriggered(){
  return (_timer_1_expired || _timer_2_expired || _interlock_now);
}
bool isInterlockTriggered(uint8_t *source){
  *source = 0;
  if(isInternalInterlockTriggered())
    *source |= BMS_INTERLOCK_TRIGGER_INTERNAL;
  if(isExternalInterlockTriggered())
    *source |= BMS_INTERLOCK_TRIGGER_EXTERNAL;

  return (isExternalInterlockTriggered() || isInternalInterlockTriggered());
}

void triggerInterlock(){
  _interlock_now = true;
  _interlockOutputOff();
}

/*void BMS_HOST_ILOK_IRQn_Handler(){
  EXTI_ClearITPendingBit(BMS_HOST_ILOK_EXTI_LINE);
}

void _BMS_INTERLOCK_TIMER1_IRQ_HANDLER() {
  _BMS_INTERLOCK_TIMER1->SR = ~TIM_FLAG_Update; // clear it pending bit
  _timer_1_expired = true;
  _interlockOutputOff();
}
void _BMS_INTERLOCK_TIMER2_IRQ_HANDLER() {
  _BMS_INTERLOCK_TIMER2->SR = ~TIM_FLAG_Update; // clear it pending bit
  _timer_2_expired = true;
  _interlockOutputOff();
}*/
