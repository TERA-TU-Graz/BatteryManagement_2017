/*
 * @file test_helper.h
 * @author Poschl Rene
 *
 * Helper functions for testing
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */
#include <stdint.h>
#include <stdbool.h>

#ifndef SRC_TEST_HELPER_H_
#define SRC_TEST_HELPER_H_

bool array_equals(uint8_t *a1, uint8_t *a2, uint32_t len);

#endif //SRC_TEST_HELPER_H_
