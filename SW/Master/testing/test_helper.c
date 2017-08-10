/*
 * @file test_helper.c
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

#include "test_helper.h"

bool array_equals(uint8_t *a1, uint8_t *a2, uint32_t len){
  uint32_t i;
  for(i=0; i<len;i++){
    if(a1[i] != a2[i]){
      return false;
    }
  }
  return true;
}
