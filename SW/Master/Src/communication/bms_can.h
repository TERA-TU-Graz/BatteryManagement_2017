/*
 * bms_can.h
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
#ifndef SRC_COMMUNICATION_BMS_CAN_H_
#define SRC_COMMUNICATION_BMS_CAN_H_

typedef enum {BMS_CAN_OK, BMS_CAN_HAL_ERROR} BMSCanManagerState;

int8_t initBMScan();


BMSCanManagerState canManager_run();
void bmsCan_wakeup();
void bmsCan_sleep();



#endif /* SRC_COMMUNICATION_BMS_CAN_H_ */
