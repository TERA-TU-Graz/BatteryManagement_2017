/*
 * system_setup.h
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
#ifndef SRC_SYSTEM_SETUP_H_
#define SRC_SYSTEM_SETUP_H_

/****************************************************************
 * BMS Measurement slaves
 ****************************************************************/

#define BMS_SLAVES_CRC_RETRANSMIT_LIMIT_INIT 10
#define BMS_SLAVES_CRC_RETRANSMIT_LIMIT_OTHER 4
#define BMS_SLAVES_CRC_RETRANSMIT_LIMIT_MEASUREMENT 2
#define BMS_SLAVES_INIT_RETRY_PER_REGISTER 2
#define BMS_SLAVES_TIMEOUT_ENTER_SLEEPMODE 10

//#define BMS_USE_SLEEP_MODE


/****************************************************************
 * What battery type is used?
 ****************************************************************/
//#define BATTERY_18650A_108S_1P_3Lines
//#define BATTERY_18650A_108S_1P_4Lines
//#define BATTERY_18650A_36S_1P
//#define BATTERY_18650A_18S_1P
//#define BATTERY_18650A_108S_20P_3Lines
//#define BATTERY_18650A_108S_20P_4Lines
//#define  BATTERY_18650B_12S_1P
//#define BATTERY_18650B_6S_1P
#define BATTERY_AccuPower_12S_1P_Fennek2013


/****************************************************************
 * Current sensor is used?
 ****************************************************************/
//#define CURRENT_TRANSDUCER_LEM_HASS_100_S
#define CURRENT_TRANSDUCER_ALLEGRO_ACS722_BIPOLAR_20A
//#define CURRENT_TRANSDUCER_ALLEGRO_ACS722_UNIPOLAR_20A


#define BMS_NUMBER_CURRENT_TRANSDUCERS 2
#define BMS_CURRENT_TRANSDUCERS_USE_OFFSET_COMPARISON

#define BMS_CURRENT_VALUE_FILTER_SIZE 10

/****************************************************************
 * Main statemachine
 ****************************************************************/

#define BMS_PRECHARGE_TIME 2000
#define BMS_QUIT_ERROR_TIME 2500
#define BMS_UPDATE_PERIODE_OFF_STATE 2500

#define BMS_MAXIMUM_AGE_MEASUREMENT_DATA 5000
#define BMS_MAXIMUM_AGE_MEASUREMENT_DATA_OFF_STATE 10000
#define BMS_ERROR_COUNTER_LIMIT 10

#endif /* SRC_SYSTEM_SETUP_H_ */
