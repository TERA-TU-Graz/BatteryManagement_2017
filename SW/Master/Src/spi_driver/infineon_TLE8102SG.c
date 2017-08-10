/*
 * infineon_TLE8102SG.c
 *
 * spi driver for infineon TLE8102SG two channel low side smart fet.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#include "infineon_TLE8102SG.h"
#include "../board_cfg.h"

#include <stddef.h>
#include <stdlib.h>

#include <stm32f4xx_hal_conf.h>

/**************************************************************
 * I/O Config
 *
 * [011][DIA][BOL][SENS]
 * DIA:
 *   0: Diagnosis with ST1 and ST2
 *   1: Diagnosis with Fault or Current Sense and SPI
 *
 * BOL: (2Bit) Output Channel Control (In .. HW input, SPI)
 *   00: only In (default)
 *   01: In OR SPI
 *   10: In AND SPI
 *   11: only SPI
 *
 * SENS: (2Bit) Function of Fault/ Current Sens Pin
 *   00: General Fault
 *   01: Current Sens CH1
 *   10: Current Sens CH2
 *   11: Current Sens CH1 + CH2
 *
 * Chosen: for Main and Charger Relays
 *  DIA=1, BOL=10, SENS=00
 *  0111 1000 = 0x78
 * Chosen: for Pre Charger
 *  DIA=1, BOL=01, SENS=00
 *  0111 0100 = 0x74
 **************************************************************/
#define _INFINEON_TLE81102SG_CMD_IO_CONFIGURATION_AND 0x78
#define _INFINEON_TLE81102SG_CMD_IO_CONFIGURATION_OR 0x74


/**************************************************************
 * Change SPI channel control bits
 *
 * [111][CTRL2][CTRL1][XXX]
 *
 * Off:     1110 0000 = 0xE0
 * CH1 on:  1110 1000 = 0xE8
 * CH2 on:  1111 0000 = 0xF0
 * both on: 1111 1000 = 0xF8
 **************************************************************/
#define _INFINEON_TLE81102SG_CMD_CHANGE_STATE 0xE0;

/**************************************************************
 * Activate Sleep mode
 *
 * [101][XXXXX] => 1010 0000 = 0xA0
 **************************************************************/
#define _INFINEON_TLE81102SG_CMD_SLEEP 0xA0;

/**************************************************************
 * Wakeup
 *
 * [110][XXXXX] => 1100 0000 = 0xC0
 **************************************************************/
#define _INFINEON_TLE81102SG_CMD_WAKEUP 0xC0;



//###############################################################

void infineonTLE8102SG_setup(InfineonTLE8102SG *device, uint8_t spi_line, bool use_spi_mode_or){
  assert_param(device != NULL);

  device->_spi_line = spi_line;
  device->_device_asleep = false;
  if(use_spi_mode_or){
    device->_io_config = _INFINEON_TLE81102SG_CMD_IO_CONFIGURATION_OR;
  }
  else{
    device->_io_config = _INFINEON_TLE81102SG_CMD_IO_CONFIGURATION_AND;
  }
}

SpiTransmissionState infineonTLE8102SG_init(InfineonTLE8102SG *device){
  SpiTransmissionState state = infineonTLE8102SG_changeState(device, INFINEON_TLE8102SG_STATE_OFF);
  if(state != SPI_TRANSMISSION_OK){
    return state;
  }
  return spi_send_with_options(device->_spi_line, &(device->_io_config), 1, false, true);
}

SpiTransmissionState infineonTLE8102SG_changeState(InfineonTLE8102SG *device, InfineonTLE8102SGstate new_state){
  SpiTransmissionState state;
  if(device->_device_asleep){
    if(new_state != INFINEON_TLE8102SG_STATE_OFF){
      state = infineonTLE8102SG_wakeup(device);
      HAL_Delay(1);
      if(state != SPI_TRANSMISSION_OK){
        return state;
      }
    }
    else{
      return SPI_TRANSMISSION_OK; //if device is asleep and we want to turn off the device we don't need to wake it up.
    }
  }
  uint8_t command = new_state | _INFINEON_TLE81102SG_CMD_CHANGE_STATE;
  state = spi_send_with_options(device->_spi_line, &command, 1, false, true);
  if(state != SPI_TRANSMISSION_OK){
    return state;
  }
  if(new_state != device->_state){
    device->_last_change = HAL_GetTick();
    device->_state = new_state;
  }

  return SPI_TRANSMISSION_OK;
}

SpiTransmissionState infineonTLE8102SG_channelOn(InfineonTLE8102SG *device, InfineonTLE8102SGchannel channel){
  InfineonTLE8102SGstate new_state = device->_state | channel;
  return infineonTLE8102SG_changeState(device, new_state);
}
SpiTransmissionState infineonTLE8102SG_channelOff(InfineonTLE8102SG *device, InfineonTLE8102SGchannel channel){
  InfineonTLE8102SGstate new_state = device->_state & (~channel);
  return infineonTLE8102SG_changeState(device, new_state);
}

SpiTransmissionState infineonTLE8102SG_activateSleepMode(InfineonTLE8102SG *device){
  if(device->_device_asleep && device->_state == INFINEON_TLE8102SG_STATE_OFF){
    return SPI_TRANSMISSION_OK; //device already in sleep mode.
  }
  SpiTransmissionState state = infineonTLE8102SG_changeState(device, INFINEON_TLE8102SG_STATE_OFF);
  if(state != SPI_TRANSMISSION_OK){
    return state;
  }
  uint8_t command = _INFINEON_TLE81102SG_CMD_SLEEP;
  state = spi_send_with_options(device->_spi_line, &command, 1, false, true);
  if(state != SPI_TRANSMISSION_OK){
    return state;
  }
  device->_device_asleep = true;
  return SPI_TRANSMISSION_OK;
}

SpiTransmissionState infineonTLE8102SG_wakeup(InfineonTLE8102SG *device){
  uint8_t command = _INFINEON_TLE81102SG_CMD_WAKEUP;
  SpiTransmissionState state = spi_send_with_options(device->_spi_line, &command, 1, false, true);
  if(state != SPI_TRANSMISSION_OK){
    return state;
  }
  device->_device_asleep = false;
  return SPI_TRANSMISSION_OK;
}


