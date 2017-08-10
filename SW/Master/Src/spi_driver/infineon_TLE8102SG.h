/*
 * infineon_TLE8102SG.h
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

#ifndef RELAIS_INTERFACE_H_
#define RELAIS_INTERFACE_H_

#include <stdint.h>
#include <stdbool.h>

#include "bms_spi_handler.h"


#define BMS_MAIN_RELAY_STATE 0x01
#define BMS_CHARGER_RELAY_STATE 0x02

typedef enum{
  INFINEON_TLE8102SG_STATE_OFF      = 0x00,
  INFINEON_TLE8102SG_STATE_CH1_ON   = 0x08,
  INFINEON_TLE8102SG_STATE_CH2_ON   = 0x10,
  INFINEON_TLE8102SG_STATE_BOTH_ON  = 0x18,
} InfineonTLE8102SGstate;

typedef enum{
  INFINEON_TLE8102SG_MASK_CH1   = 0x08,
  INFINEON_TLE8102SG_MASK_CH2   = 0x10
} InfineonTLE8102SGchannel;

typedef struct{
  uint8_t _spi_line;
  uint8_t _io_config;
  InfineonTLE8102SGstate _state;
  bool _device_asleep;
  uint32_t _last_change;
} InfineonTLE8102SG;

void infineonTLE8102SG_setup(InfineonTLE8102SG *device, uint8_t spi_line, bool use_spi_mode_or);
SpiTransmissionState infineonTLE8102SG_init(InfineonTLE8102SG *device);
SpiTransmissionState infineonTLE8102SG_changeState(InfineonTLE8102SG *device, InfineonTLE8102SGstate new_state);
SpiTransmissionState infineonTLE8102SG_channelOn(InfineonTLE8102SG *device, InfineonTLE8102SGchannel channel);
SpiTransmissionState infineonTLE8102SG_channelOff(InfineonTLE8102SG *device, InfineonTLE8102SGchannel channel);

SpiTransmissionState infineonTLE8102SG_activateSleepMode(InfineonTLE8102SG *device);
SpiTransmissionState infineonTLE8102SG_wakeup(InfineonTLE8102SG *device);

#endif /* RELAIS_INTERFACE_H_ */
