/*
 * relay_manager.c
 *
 * Manages relay interface for TERA ibex.
 *    Hardware v1 and v2: (eagle)
 *        Buggy hardware, not supported
 *    Hardware v3 and v4: (eagle)
 *        2 x High voltage main relays with aux contact.
 *        2 x High voltage charger relays (optional) for super charger input with aux contact.
 *        1 x Low current relay for pre-charger (optional aux contact)
 *        1 x optional output for one further relay with aux contact.
 *        All smart fets connected to interlock via HW inputs
 *    Hardware v5 and v6: (kicad)
 *        Aux contacts removed from pre-charger and optional output.
 *        Added one further 2 channel smart fet for fan output. (with pwm io)
 *
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#include "relay_manager.h"
#include "../board_cfg.h"
#include <stddef.h>
#include <main.h>

#include <stm32f4xx_hal_gpio.h>
#include <stm32f405xx.h>

#define _BMS_RELAY_SWITCH_TIME 20
#define _BMS_RELAY_CURRENT_REDUCTION_DELAY 500
#define _BMS_RELAY_HV_OFF_DELAY 100

// Todo: Ibex config
#define _BMS_NUMBER_OF_RELAYS 3
#define _BMS_NUMBER_OF_RELAY_SMART_FETS 3

typedef enum{
  RELAY_OFF,
  RELAY_SWITCHING_OFF,
  RELAY_SWITCHING_ON,
  RELAY_ON
}RelayState;

/*
 * Datastructure do describe a single relay.
 *
 * the delayed channel is intended to be used as a current reduction. (Resistor in series)
 * If the relay does not have a current reduced channel, set delay to 0. (And _delayed_channel equal to _immediate_channel)
 * If _immediate_channel is equal to NONE than this structure can be used for delayed switching.
 * If delay_off > 0 than turning of is delayed.
 *
 * Behavior:
 * Event:     ↓(1)       ↓(2)          ↓(3)       ↓(2)
 * State: Off><Switching><    ON      ><Switching>< Off
 * CH1:  _____|‾‾‾‾‾‾‾‾‾|_____________________________________
 * CH2:  _______________|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|____________
 *
 * (1) Call of relayManager_turnOnRelay(relay)
 * (2) Automatically done by relayManager_run()
 * (3) Call of relayManager_turnOffRelay(relay)
 *
 * Aux contacts:
 * Aux contacts are only used for ibex. There the two channels of a smart fets are used to control the relays in the HV + and - lines.
 * These two relays have only one combined AUX contact. This contact should only be added to the RelayInterface for the HV + line.
 * (If + is on, - should also be on. During precharcing only - is on.)
 */
typedef struct{
  InfineonTLE8102SG *_smart_fet;
  InfineonTLE8102SGchannel _immediate_channel;
  InfineonTLE8102SGchannel _delayed_channel;
  RelayState _state;
  uint32_t _time_switching_start;
  uint32_t _delay_on;
  uint32_t _delay_off;
  GPIO_TypeDef* _aux_gpio_port;
  uint16_t _aux_gpio_pin;
}RelayInterface;

RelayInterface relay_interfaces[_BMS_NUMBER_OF_RELAYS];
InfineonTLE8102SG _relayManager_smartFets[_BMS_NUMBER_OF_RELAY_SMART_FETS];
//###############################################################

//ToDo: Implement Ibex vs Fennek
RelayManagerState initRelayInterface(){
  infineonTLE8102SG_setup(&(_relayManager_smartFets[0]), BMS_SPI_LINE_SMART_FET_RELAY_1, false);
  infineonTLE8102SG_setup(&(_relayManager_smartFets[1]), BMS_SPI_LINE_SMART_FET_RELAY_2, false);
  infineonTLE8102SG_setup(&(_relayManager_smartFets[2]), BMS_SPI_LINE_SMART_FET_RELAY_3, false);
  uint8_t relay_idx;
  for(relay_idx = 0; relay_idx < _BMS_NUMBER_OF_RELAY_SMART_FETS; relay_idx++){
    SpiTransmissionState state = infineonTLE8102SG_init(&(_relayManager_smartFets[relay_idx]));
    if(state != SPI_TRANSMISSION_OK){
      return RELAY_SMART_FET_TRANSMISSION_ERROR;
    }
  }


  relay_interfaces[BMS_HV_PLUS_RELAY]._smart_fet = &(_relayManager_smartFets[0]);
  relay_interfaces[BMS_HV_PLUS_RELAY]._aux_gpio_pin = 0;
  relay_interfaces[BMS_HV_PLUS_RELAY]._aux_gpio_port = NULL;
  relay_interfaces[BMS_HV_PLUS_RELAY]._immediate_channel = INFINEON_TLE8102SG_MASK_CH1;
  relay_interfaces[BMS_HV_PLUS_RELAY]._delayed_channel = INFINEON_TLE8102SG_MASK_CH2;
  relay_interfaces[BMS_HV_PLUS_RELAY]._delay_off = _BMS_RELAY_HV_OFF_DELAY;
  relay_interfaces[BMS_HV_PLUS_RELAY]._delay_on = _BMS_RELAY_CURRENT_REDUCTION_DELAY;

  relay_interfaces[BMS_12V_PLUS_RELAY]._smart_fet = &(_relayManager_smartFets[1]);
  relay_interfaces[BMS_12V_PLUS_RELAY]._aux_gpio_pin = 0;
  relay_interfaces[BMS_12V_PLUS_RELAY]._aux_gpio_port = NULL;
  relay_interfaces[BMS_12V_PLUS_RELAY]._immediate_channel = INFINEON_TLE8102SG_MASK_CH1;
  relay_interfaces[BMS_12V_PLUS_RELAY]._delayed_channel = INFINEON_TLE8102SG_MASK_CH2;
  relay_interfaces[BMS_12V_PLUS_RELAY]._delay_off = 0;
  relay_interfaces[BMS_12V_PLUS_RELAY]._delay_on = _BMS_RELAY_CURRENT_REDUCTION_DELAY;

  relay_interfaces[BMS_PRECHARGER_HV_PLUS]._smart_fet = &(_relayManager_smartFets[2]);
  relay_interfaces[BMS_PRECHARGER_HV_PLUS]._aux_gpio_pin = 0;
  relay_interfaces[BMS_PRECHARGER_HV_PLUS]._aux_gpio_port = NULL;
  relay_interfaces[BMS_PRECHARGER_HV_PLUS]._immediate_channel = INFINEON_TLE8102SG_MASK_CH1;
  relay_interfaces[BMS_PRECHARGER_HV_PLUS]._delayed_channel = INFINEON_TLE8102SG_MASK_CH2;
  relay_interfaces[BMS_PRECHARGER_HV_PLUS]._delay_off = 0;
  relay_interfaces[BMS_PRECHARGER_HV_PLUS]._delay_on = _BMS_RELAY_CURRENT_REDUCTION_DELAY;
  /*relay_interfaces[_BMS_MAINBMS_RELAY]._aux_gpio_pin = Main_on_Pin;
  relay_interfaces[_BMS_MAINBMS_RELAY]._aux_gpio_port = Main_on_GPIO_Port;


  relay_interfaces[_BMS_CHARGERBMS_RELAY]._aux_gpio_pin = SuperCharger_On_Pin;
  relay_interfaces[_BMS_CHARGERBMS_RELAY]._aux_gpio_port = SuperCharger_On_GPIO_Port;


  relay_interfaces[_BMS_PRE_CHARGERBMS_RELAY]._aux_gpio_pin = 0;
  relay_interfaces[_BMS_PRE_CHARGERBMS_RELAY]._aux_gpio_port = NULL;*/


  return turnOffRelays();
}

AuxStatus checkAuxContact(uint8_t relay){
  if(relay_interfaces[relay]._aux_gpio_port == NULL){
    return RELAY_AUX_OK; //no aux contact: can not check
  }
  if(HAL_GetTick() < relay_interfaces[relay]._smart_fet->_last_change + _BMS_RELAY_SWITCH_TIME ){
    return RELAY_AUX_UNDEFINED;
  }

  GPIO_PinState aux_state = HAL_GPIO_ReadPin(relay_interfaces[relay]._aux_gpio_port, relay_interfaces[relay]._aux_gpio_pin);
  if(aux_state == GPIO_PIN_SET && relay_interfaces[relay]._smart_fet->_state != INFINEON_TLE8102SG_STATE_BOTH_ON){
    return RELAY_AUX_ERROR;
  }
  if(aux_state == GPIO_PIN_RESET && relay_interfaces[relay]._smart_fet->_state == INFINEON_TLE8102SG_STATE_BOTH_ON){
    return RELAY_AUX_ERROR;
  }

  return RELAY_AUX_OK;
}

RelayManagerState relayManager_turnOnRelay(uint8_t relay){
  assert_param(relay < _BMS_NUMBER_OF_RELAYS);
  if(relay_interfaces[relay]._state == RELAY_OFF){
    if(infineonTLE8102SG_channelOn(relay_interfaces[relay]._smart_fet, relay_interfaces[relay]._immediate_channel) != SPI_TRANSMISSION_OK){
      return RELAY_SMART_FET_TRANSMISSION_ERROR;
    }
    if(relay_interfaces[relay]._delayed_channel != relay_interfaces[relay]._immediate_channel){
      relay_interfaces[relay]._time_switching_start = HAL_GetTick();
      relay_interfaces[relay]._state = RELAY_SWITCHING_ON;
    }
    else{
      relay_interfaces[relay]._state = RELAY_ON;
    }
    return RELAY_MANAGER_OK;
  }
  return RELAY_CMD_ERROR;
}

RelayManagerState _relayManager_SendTurnOffCMD(uint8_t relay){
  assert_param(relay < _BMS_NUMBER_OF_RELAYS);
  uint8_t channel = relay_interfaces[relay]._delayed_channel | relay_interfaces[relay]._immediate_channel;
  //make sure both channels are off. (Important if the immediate channel is still on because of a communication error.)
  if(infineonTLE8102SG_channelOff(relay_interfaces[relay]._smart_fet, channel) != SPI_TRANSMISSION_OK){
    return RELAY_SMART_FET_TRANSMISSION_ERROR;
  }
  relay_interfaces[relay]._state = RELAY_OFF;
  return RELAY_MANAGER_OK;
}

RelayManagerState relayManager_turnOffRelay(uint8_t relay){
  assert_param(relay < _BMS_NUMBER_OF_RELAYS);
  if(relay_interfaces[relay]._state == RELAY_ON){
    if(relay_interfaces[relay]._delay_off > 0){
      relay_interfaces[relay]._time_switching_start = HAL_GetTick();
      relay_interfaces[relay]._state = RELAY_SWITCHING_OFF;
      return RELAY_MANAGER_OK;
    }
    return _relayManager_SendTurnOffCMD(relay);
  }
  else if(relay_interfaces[relay]._state == RELAY_SWITCHING_ON){
    //cancle switching on and turn off relay immediately.
    return _relayManager_SendTurnOffCMD(relay);
  }
  return RELAY_CMD_ERROR;
}

RelayManagerState _relayManager_handleStateRelaySwitchingOff(uint8_t relay_idx, uint32_t now){
  assert_param(relay_idx < _BMS_NUMBER_OF_RELAYS);
  if(now >= relay_interfaces[relay_idx]._time_switching_start &&
      now - relay_interfaces[relay_idx]._time_switching_start >= relay_interfaces[relay_idx]._delay_off){
    if(infineonTLE8102SG_changeState(relay_interfaces[relay_idx]._smart_fet, INFINEON_TLE8102SG_STATE_OFF) != SPI_TRANSMISSION_OK){
      return RELAY_SMART_FET_TRANSMISSION_ERROR;
    }
    relay_interfaces[relay_idx]._state = RELAY_OFF;
  }
  return RELAY_MANAGER_OK;
}

RelayManagerState _relayManager_handleStateRelaySwitchingOn(uint8_t relay_idx, uint32_t now){
  assert_param(relay_idx < _BMS_NUMBER_OF_RELAYS);
  if(now >= relay_interfaces[relay_idx]._time_switching_start &&
      now - relay_interfaces[relay_idx]._time_switching_start >= relay_interfaces[relay_idx]._delay_on){
    if(infineonTLE8102SG_changeState(relay_interfaces[relay_idx]._smart_fet, INFINEON_TLE8102SG_STATE_CH2_ON) != SPI_TRANSMISSION_OK){
      return RELAY_SMART_FET_TRANSMISSION_ERROR;
    }
    relay_interfaces[relay_idx]._state = RELAY_ON;
  }
  return RELAY_MANAGER_OK;
}

RelayManagerState _relayManager_handleSwitchingDoneStates(uint8_t relay_idx){
  assert_param(relay_idx < _BMS_NUMBER_OF_RELAYS);
  if(checkAuxContact(relay_idx) == RELAY_AUX_ERROR){
    return RELAY_MANAGER_AUX_ERROR;
  }
  return RELAY_MANAGER_OK;
}

RelayManagerState relayManager_run(){
  int relay_idx;
  uint32_t now = HAL_GetTick();
  RelayManagerState worst_state = RELAY_MANAGER_OK;
  for(relay_idx=0; relay_idx<_BMS_NUMBER_OF_RELAYS; relay_idx++){
    switch(relay_interfaces[relay_idx]._state){
      case RELAY_SWITCHING_OFF: worst_state |= _relayManager_handleStateRelaySwitchingOff(relay_idx, now); break;
      case RELAY_SWITCHING_ON: worst_state |= _relayManager_handleStateRelaySwitchingOn(relay_idx, now); break;
      default: worst_state |= _relayManager_handleSwitchingDoneStates(relay_idx);
    }
  }
  return worst_state;
}

void testRelayInterface(){
  static uint8_t testing_state = 0;
  static uint32_t last_state_change;
  uint32_t now = HAL_GetTick();
  switch (testing_state) {
    case 0:
      turnOffRelays();
      last_state_change = now;
      testing_state = 1;
      break;
    case 1:
      if(now - last_state_change > 1000){
        testing_state = 2;
        last_state_change = now;
      }
      break;
    case 2:
      relayManager_turnOnRelay(BMS_HV_PLUS_RELAY);
      relayManager_turnOnRelay(BMS_12V_PLUS_RELAY);
      last_state_change = now;
      testing_state = 3;
      break;
    case 3:
      if(now - last_state_change > 1000){
        testing_state = 4;
        last_state_change = now;
      }
      break;
    case 4:
      relayManager_turnOnRelay(BMS_PRECHARGER_HV_PLUS);
      last_state_change = now;
      testing_state = 5;
      break;
    case 5:
      if(now - last_state_change > 1000){
        testing_state = 6;
        last_state_change = now;
      }
      break;
    case 6:
      relayManager_turnOffRelay(BMS_PRECHARGER_HV_PLUS);
      relayManager_turnOffRelay(BMS_HV_PLUS_RELAY);
      relayManager_turnOffRelay(BMS_12V_PLUS_RELAY);
      last_state_change = now;
      testing_state = 7;
      break;
    case 7:
      if(now - last_state_change > 1000){
        testing_state = 8;
        last_state_change = now;
      }
      break;
    default:
      testing_state = 0;
      break;
  }

  relayManager_run();
}
/*
 * Immediately turn off all relays.
 */
RelayManagerState turnOffRelays(){
  int relay_idx;
  RelayManagerState worst_state = RELAY_MANAGER_OK;
  for(relay_idx=0; relay_idx<_BMS_NUMBER_OF_RELAYS; relay_idx++){
    worst_state |= _relayManager_SendTurnOffCMD(relay_idx);
  }
  return worst_state;
}

RelayManagerState activateSleepModeForAllRelays(){
  int relay_idx;
  SpiTransmissionState worst_state = SPI_TRANSMISSION_OK;
  for(relay_idx=0; relay_idx<_BMS_NUMBER_OF_RELAYS; relay_idx++){
    SpiTransmissionState state = infineonTLE8102SG_activateSleepMode(relay_interfaces[relay_idx]._smart_fet);
    relay_interfaces[relay_idx]._state = RELAY_OFF;
    if(state > worst_state){
      worst_state = state;
    }
  }
  return worst_state;
}
