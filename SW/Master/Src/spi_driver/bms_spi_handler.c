/*
 * @file bms_spi_handler.c
 * @author Pöschl Rene
 *
 * General SPI handler for TERA BMS Master
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */
#ifndef UNIT_TESTING

#include "bms_spi_handler.h"

#include <main.h>
#include <stm32f4xx_hal_gpio.h>
#include <stm32f4xx_hal_spi.h>
#include <stm32f4xx_hal.h>
#include <stddef.h>
#include <stm32f4xx_hal_conf.h>


#define _BMS_SPI_TIMEOUT 10000
#define _BMS_MAX_NUM_TRANSMISSION_ERRORS 10
#define _BMS_SPI_NCS_DELAY 2

void setSPILine(uint8_t line);
void spiSetNCS();
void spiResetNCS();

extern SPI_HandleTypeDef hspi1;

void setSPILine(uint8_t line)
{
  /*if(line == bms_spi_active_line){
    return;
  }*/

  if(line & 0x01){
    HAL_GPIO_WritePin(SPI1_CS_B0_GPIO_Port, SPI1_CS_B0_Pin, GPIO_PIN_SET);
  }
  else{
    HAL_GPIO_WritePin(SPI1_CS_B0_GPIO_Port, SPI1_CS_B0_Pin, GPIO_PIN_RESET);
  }

  if(line & 0x02){
    HAL_GPIO_WritePin(SPI1_CS_B1_GPIO_Port, SPI1_CS_B1_Pin, GPIO_PIN_SET);
  }
  else{
    HAL_GPIO_WritePin(SPI1_CS_B1_GPIO_Port, SPI1_CS_B1_Pin, GPIO_PIN_RESET);
  }

  if(line & 0x04){
    HAL_GPIO_WritePin(SPI1_CS_B2_GPIO_Port, SPI1_CS_B2_Pin, GPIO_PIN_SET);
  }
  else{
    HAL_GPIO_WritePin(SPI1_CS_B2_GPIO_Port, SPI1_CS_B2_Pin, GPIO_PIN_RESET);
  }
  //bms_spi_active_line = line;
}

void spiSetNCS(){
   HAL_GPIO_WritePin(SPI1_CS_GPIO_Port, SPI1_CS_Pin, GPIO_PIN_SET);
}

void spiResetNCS(){
  HAL_GPIO_WritePin(SPI1_CS_GPIO_Port, SPI1_CS_Pin, GPIO_PIN_RESET);
}

HAL_StatusTypeDef select_crc_calculation(SPI_HandleTypeDef *hspi, uint32_t CRCCalculation){
  assert_param(hspi != NULL);
  __HAL_LOCK(hspi);
  hspi1.Init.CRCCalculation = CRCCalculation;
  __HAL_UNLOCK(hspi);

  return HAL_OK;

}

SpiTransmissionState spi_send_with_options(uint8_t spi_line, uint8_t *data, uint16_t size,
    bool use_crc, bool wait_after_ncs){
  assert_param(data != NULL);
  if(use_crc){
    if(select_crc_calculation(&hspi1, SPI_CRCCALCULATION_ENABLE) != HAL_OK){
      return SPI_TRANSMISSION_ERROR;
    }
  }
  else{
    if(select_crc_calculation(&hspi1, SPI_CRCCALCULATION_DISABLE) != HAL_OK){
      return SPI_TRANSMISSION_ERROR;
    }
  }

  setSPILine(spi_line);
  HAL_StatusTypeDef status;
  uint8_t error_counter = 0;
  do{
    spiSetNCS();
    if(wait_after_ncs){
      HAL_Delay(_BMS_SPI_NCS_DELAY);
    }
    status = HAL_SPI_Transmit(&hspi1, data, size, _BMS_SPI_TIMEOUT);
    if(wait_after_ncs){
      HAL_Delay(_BMS_SPI_NCS_DELAY);
    }
    spiResetNCS();

    if(error_counter >= _BMS_MAX_NUM_TRANSMISSION_ERRORS){
      return SPI_TRANSMISSION_ERROR;
    }
    error_counter++;
  }while(status != HAL_OK);

  return SPI_TRANSMISSION_OK;
}

SpiTransmissionState spi_send(uint8_t spi_line, uint8_t *data, uint16_t size){
  assert_param(data != NULL);
  return spi_send_with_options(spi_line, data, size, true, false);
}

SpiTransmissionState spi_read_with_options(uint8_t spi_line, uint8_t *send_data, uint8_t *receive_data, uint16_t size,
    bool use_crc, bool wait_after_ncs){
  assert_param(send_data != NULL);
  assert_param(receive_data != NULL);

  if(use_crc){
    if(select_crc_calculation(&hspi1, SPI_CRCCALCULATION_ENABLE) != HAL_OK){
      return SPI_TRANSMISSION_ERROR;
    }
  }
  else{
    if(select_crc_calculation(&hspi1, SPI_CRCCALCULATION_DISABLE) != HAL_OK){
      return SPI_TRANSMISSION_ERROR;
    }
  }

  setSPILine(spi_line);
  HAL_StatusTypeDef status;
  uint8_t error_counter = 0;
  do{
    spiSetNCS();
    if(wait_after_ncs){
      HAL_Delay(_BMS_SPI_NCS_DELAY);
    }
    status = HAL_SPI_TransmitReceive(&hspi1, send_data, receive_data, size, _BMS_SPI_TIMEOUT);
    if(wait_after_ncs){
      HAL_Delay(_BMS_SPI_NCS_DELAY);
    }
    spiResetNCS();

    if(error_counter >= _BMS_MAX_NUM_TRANSMISSION_ERRORS){
      return SPI_TRANSMISSION_ERROR;
    }
    error_counter++;
  }while(status != HAL_OK);

  return SPI_TRANSMISSION_OK;
}

SpiTransmissionState spi_read(uint8_t spi_line, uint8_t *send_data, uint8_t *receive_data, uint16_t size){
  assert_param(send_data != NULL);
  assert_param(receive_data != NULL);

  return spi_read_with_options(spi_line, send_data, receive_data, size, false, false);
}

#endif //UNIT_TESTING
