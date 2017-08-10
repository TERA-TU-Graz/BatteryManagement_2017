/*
 * battery_protector.h
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
#ifndef SRC_FAULT_MANAGEMENT_BATTERY_PROTECTOR_H_
#define SRC_FAULT_MANAGEMENT_BATTERY_PROTECTOR_H_

typedef struct
{
  uint8_t _data_old           :1;
  uint8_t _data_old_off_state :1;
  uint8_t _over_voltage       :1;
  uint8_t _under_voltage      :1;
  uint8_t _over_current       :1;
  uint8_t _over_temperature   :1;
  uint8_t _under_temperature  :1;
  uint8_t _future_use1        :1;
}__attribute__ ((packed)) BatteryFault;


void batteryProtector_run();
void batteryProtector_clearFaults();


#endif /* SRC_FAULT_MANAGEMENT_BATTERY_PROTECTOR_H_ */
