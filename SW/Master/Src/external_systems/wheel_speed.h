/*
 * wheel_speed.h
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
#ifndef SRC_EXTERNAL_SYSTEMS_WHEEL_SPEED_H_
#define SRC_EXTERNAL_SYSTEMS_WHEEL_SPEED_H_

#include <stdint.h>

typedef enum{
  WHEEL_SPEED_OK,
  WHEEL_SPEED_HALL_ERROR
}WheelSpeedState;


WheelSpeedState init_WheelSpeed();
void updateWheelSpeed();
int32_t getWheelSpeed();


#endif /* SRC_EXTERNAL_SYSTEMS_WHEEL_SPEED_H_ */
