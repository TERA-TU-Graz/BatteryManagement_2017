/*
 * uc_board_leds.h
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
#ifndef SRC_COMMUNICATION_UC_BOARD_LEDS_H_
#define SRC_COMMUNICATION_UC_BOARD_LEDS_H_

void ucBoardLED_signalErrorState();
void ucBoardLED_signalCPUalive();

#include "../core/statemachine.h"

void ucBoardLED_showState(MainFSMState main_fsm_state);


#endif /* SRC_COMMUNICATION_UC_BOARD_LEDS_H_ */
