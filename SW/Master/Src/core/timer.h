/*
 * @file timer.h
 * @author Pöschl Rene
 *
 * This file holds the timer callback functions and everything that manages cyclic functionalities.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */
#ifndef SRC_CORE_TIMER_H_
#define SRC_CORE_TIMER_H_

typedef enum{TIMER_OK, TIMER_HAL_ERROR}TimerStatus;


TimerStatus initTimers();
#endif /* SRC_CORE_TIMER_H_ */
