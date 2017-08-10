/*
 * statmachine.h
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
#ifndef SRC_CORE_STATEMACHINE_H_
#define SRC_CORE_STATEMACHINE_H_

#include <stdbool.h>

typedef enum{
  MAIN_FSM_STATE_INIT, MAIN_FSM_STATE_OFF, MAIN_FSM_STATE_PRECHARGE, MAIN_FSM_STATE_ON, MAIN_FSM_STATE_ERROR
}MainFSMState;

void statemachine_run();
bool isBatteryLimitViolated(MainFSMState current_state);


#endif /* SRC_CORE_STATEMACHINE_H_ */
