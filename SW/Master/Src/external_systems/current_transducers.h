/*
 * current_transducers.h
 *
 * Interface definition for current transducer handlers.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */
#ifndef SRC_EXTERNAL_SYSTEMS_CURRENT_TRANSDUCERS_H_
#define SRC_EXTERNAL_SYSTEMS_CURRENT_TRANSDUCERS_H_


#include <stdbool.h>
#include <stdint.h>
#include "../system_setup.h"
#include <stm32f4xx_hal.h>

typedef enum{CT_OK, CT_BUSY, CT_TIMEOUT, CT_HAL_ERROR}CTstate;

CTstate ct_request_compensateOffsetVoltage();
bool ct_request_updateCurrent();

void handle_adc_callback(uint16_t* adc_values);

int32_t ct_getCurrent(uint transducer_idx);


/*************************************************************
 *LEM HASS 100-s
 *************************************************************/
#ifdef CURRENT_TRANSDUCER_LEM_HASS_100_S
#define CURRENT_TRANSDUCER_SENSITIVITY 1600
#define CURRENT_TRANSDUCER_V_ZERO_CMV 180000
#define CURRENT_FROM_ADC_VALUE_uA(adc_value, offset) ((ADC_VAL_TO_CENTI_MILLI_VOLT(adc_value)-offset-CURRENT_TRANSDUCER_V_ZERO_CMV)*\
    CURRENT_TRANSDUCER_SENSITIVITY)
#endif

#ifdef CURRENT_TRANSDUCER_ALLEGRO_ACS722_UNIPOLAR_20A
#define CURRENT_TRANSDUCER_SENSITIVITY_M 2500
#define CURRENT_TRANSDUCER_SENSITIVITY_D 33
#define CURRENT_TRANSDUCER_V_ZERO_CMV 33000
#define CURRENT_FROM_ADC_VALUE_uA(adc_value, offset) (((ADC_VAL_TO_CENTI_MILLI_VOLT(adc_value)-offset-CURRENT_TRANSDUCER_V_ZERO_CMV)*\
    CURRENT_TRANSDUCER_SENSITIVITY_M)/CURRENT_TRANSDUCER_SENSITIVITY_D)

#endif

#ifdef CURRENT_TRANSDUCER_ALLEGRO_ACS722_BIPOLAR_20A
#define CURRENT_TRANSDUCER_SENSITIVITY_M 5000
#define CURRENT_TRANSDUCER_SENSITIVITY_D 33
#define CURRENT_TRANSDUCER_V_ZERO_CMV 160000
#define CURRENT_FROM_ADC_VALUE_uA(adc_value, offset) (((ADC_VAL_TO_CENTI_MILLI_VOLT(adc_value)-offset-CURRENT_TRANSDUCER_V_ZERO_CMV)*\
    CURRENT_TRANSDUCER_SENSITIVITY_M)/CURRENT_TRANSDUCER_SENSITIVITY_D)

#endif

#define CURRENT_TRANSDUCER_CALCULATE_OFFSET_CENTI_MILLI_VOLT(adc_value) (ADC_VAL_TO_CENTI_MILLI_VOLT(adc_value)-CURRENT_TRANSDUCER_V_ZERO_CMV)

#endif /* SRC_EXTERNAL_SYSTEMS_CURRENT_TRANSDUCERS_H_ */
