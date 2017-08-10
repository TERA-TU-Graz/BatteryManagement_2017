/*
 * @file board_cfg.h
 * @author Pöschl Rene
 *
 * Board config file.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#ifndef __PROJECT__IBEX__TEMPERATURE_CONTROL__BOARD_CFG_H__
#define __PROJECT__IBEX__TEMPERATURE_CONTROL__BOARD_CFG_H__

#include "main.h"

#if BMS_MASTER_VERSION > 1 && BMS_MASTER_VERSION < 5
  #define INTERLOCK_ON GPIO_PIN_RESET
  #define INTERLOCK_OFF GPIO_PIN_SET
#else
  #define INTERLOCK_ON GPIO_PIN_SET
  #define INTERLOCK_OFF GPIO_PIN_RESET
#endif


#if BMS_MASTER_VERSION > 2
    #define BMS_SPI_LINE_HOST1 0
    #define BMS_SPI_LINE_HOST2 1
    #define BMS_SPI_LINE_HOST3 2
    #define BMS_SPI_LINE_HOST4 3

    #define BMS_SPI_LINE_SMART_FET_RELAY_1 5
    #define BMS_SPI_LINE_SMART_FET_RELAY_2 6
    #define BMS_SPI_LINE_SMART_FET_RELAY_3 7
#else
    #define BMS_SPI_LINE_HOST1 0
    #define BMS_SPI_LINE_HOST2 1
    #define BMS_SPI_LINE_HOST3 2

    #define BMS_SPI_LINE_SMART_FET_RELAY_1 3
    #define BMS_SPI_LINE_SMART_FET_RELAY_2 4
    #define BMS_SPI_LINE_SMART_FET_RELAY_3 5
#endif


#endif /* BOARD_CFG_H_ */
