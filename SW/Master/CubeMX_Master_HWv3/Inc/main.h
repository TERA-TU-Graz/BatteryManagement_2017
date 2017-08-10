/**
  ******************************************************************************
  * File Name          : main.h
  * Description        : This file contains the common defines of the application
  ******************************************************************************
  *
  * COPYRIGHT(c) 2017 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H
  /* Includes ------------------------------------------------------------------*/

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private define ------------------------------------------------------------*/
#define ADC1_NUM_CHANNELS 2
#define ADC2_NUM_CHANNELS 3
#define BMS_MASTER_VERSION 3
#define TIM_6_FREQUENCY 4000
#define TIM_7_FREQUENCY 20
#define ADC_RANGE 4095

#define LEM1_Pin GPIO_PIN_0
#define LEM1_GPIO_Port GPIOC
#define LEM2_Pin GPIO_PIN_1
#define LEM2_GPIO_Port GPIOC
#define LEM3_Pin GPIO_PIN_2
#define LEM3_GPIO_Port GPIOC
#define TS3_Pin GPIO_PIN_1
#define TS3_GPIO_Port GPIOA
#define TS4_Pin GPIO_PIN_2
#define TS4_GPIO_Port GPIOA
#define Interlock_OK_Pin GPIO_PIN_3
#define Interlock_OK_GPIO_Port GPIOA
#define SPI1_CS_B0_Pin GPIO_PIN_4
#define SPI1_CS_B0_GPIO_Port GPIOA
#define BUTTON_ON_Pin GPIO_PIN_4
#define BUTTON_ON_GPIO_Port GPIOC
#define BUTTON_OFF_Pin GPIO_PIN_5
#define BUTTON_OFF_GPIO_Port GPIOC
#define SPI1_CS_Pin GPIO_PIN_0
#define SPI1_CS_GPIO_Port GPIOB
#define Main_on_Pin GPIO_PIN_1
#define Main_on_GPIO_Port GPIOB
#define Main_fault_Pin GPIO_PIN_2
#define Main_fault_GPIO_Port GPIOB
#define N_Alert_Pin GPIO_PIN_10
#define N_Alert_GPIO_Port GPIOB
#define Precharge_RM2_Pin GPIO_PIN_11
#define Precharge_RM2_GPIO_Port GPIOB
#define CAN2_RS_Pin GPIO_PIN_14
#define CAN2_RS_GPIO_Port GPIOB
#define SPI1_CS_B1_Pin GPIO_PIN_15
#define SPI1_CS_B1_GPIO_Port GPIOB
#define SPI1_CS_B2_Pin GPIO_PIN_6
#define SPI1_CS_B2_GPIO_Port GPIOC
#define N_Fault_Pin GPIO_PIN_7
#define N_Fault_GPIO_Port GPIOC
#define Precharge_fault_Pin GPIO_PIN_8
#define Precharge_fault_GPIO_Port GPIOC
#define SuperCharger_On_Pin GPIO_PIN_8
#define SuperCharger_On_GPIO_Port GPIOA
#define SuperCharger_Fault_Pin GPIO_PIN_9
#define SuperCharger_Fault_GPIO_Port GPIOA
#define CAN1_RS_Pin GPIO_PIN_10
#define CAN1_RS_GPIO_Port GPIOA
#define LED3_Pin GPIO_PIN_12
#define LED3_GPIO_Port GPIOC
#define LED2_Pin GPIO_PIN_2
#define LED2_GPIO_Port GPIOD
#define LED1_Pin GPIO_PIN_5
#define LED1_GPIO_Port GPIOB
#define Interlock_On1_Pin GPIO_PIN_6
#define Interlock_On1_GPIO_Port GPIOB
#define Interlock_On2_Pin GPIO_PIN_7
#define Interlock_On2_GPIO_Port GPIOB

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

/**
  * @}
  */ 

/**
  * @}
*/ 

#endif /* __MAIN_H */
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
