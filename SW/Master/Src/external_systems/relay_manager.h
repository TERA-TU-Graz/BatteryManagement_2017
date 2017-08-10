/*
 * relay_manager.h
 *
 * Manages relay interface for TERA ibex.
 *
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#ifndef SRC_EXTERNAL_SYSTEMS_RELAY_MANAGER_H_
#define SRC_EXTERNAL_SYSTEMS_RELAY_MANAGER_H_

#define BMS_HV_PLUS_RELAY 0
#define BMS_12V_PLUS_RELAY 1
#define BMS_PRECHARGER_HV_PLUS 2

#include "../spi_driver/infineon_TLE8102SG.h"

typedef enum{RELAY_AUX_OK, RELAY_AUX_UNDEFINED, RELAY_AUX_ERROR} AuxStatus;
typedef enum{RELAY_MANAGER_OK = 0x00, RELAY_CMD_ERROR = 0x10, RELAY_MANAGER_AUX_ERROR = 0x11, RELAY_SMART_FET_TRANSMISSION_ERROR = 0x13} RelayManagerState;

RelayManagerState turnOffRelays();
RelayManagerState activateSleepModeForAllRelays();
RelayManagerState relayManager_turnOffRelay(uint8_t relay);
RelayManagerState relayManager_turnOnRelay(uint8_t relay);
RelayManagerState relayManager_run();

AuxStatus checkAuxContact(uint8_t relay);

void testRelayInterface();

RelayManagerState initRelayInterface();


#endif /* SRC_EXTERNAL_SYSTEMS_RELAY_MANAGER_H_ */
