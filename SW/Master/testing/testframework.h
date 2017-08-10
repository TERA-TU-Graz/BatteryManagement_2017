/**
 * @file testframework.h
 * @author Pöschl Rene
 *
 * Testframeowrk for unit testing
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#ifndef SRC_TESTFRAMEWORK_H_
#define SRC_TESTFRAMEWORK_H_
#ifdef UNIT_TESTING

#include <stdint.h>
#include <stdbool.h>

void userLoop();
void userInit();

bool array_equals(uint8_t *a1, uint8_t *a2, size_t len);

#endif // UNIT_TESTING
#endif /* SRC_USERPROGRAM_H_ */
