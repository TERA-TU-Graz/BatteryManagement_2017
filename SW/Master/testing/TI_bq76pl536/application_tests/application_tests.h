/*
 * application_tests.h
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
#ifndef TESTING_TI_BQ76PL536_APPLICATION_TESTS_APPLICATION_TESTS_H_
#define TESTING_TI_BQ76PL536_APPLICATION_TESTS_APPLICATION_TESTS_H_

bool run_ti_bq76pl536_regEquals_tests(unsigned int *number_tests, unsigned int *number_tests_failed);

bool run_ti_bq76pl536_setRegisterControlled_tests(unsigned int *number_tests, unsigned int *number_tests_failed);


#endif /* TESTING_TI_BQ76PL536_APPLICATION_TESTS_APPLICATION_TESTS_H_ */
