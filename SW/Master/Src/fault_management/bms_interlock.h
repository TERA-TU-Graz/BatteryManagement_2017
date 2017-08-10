/*
 * bms_interlock.h
 *
 *  Created on: 10.08.2014
 *      Author: Rene
 */

#ifndef BMS_INTERLOCK_H_
#define BMS_INTERLOCK_H_

#include <stdint.h>
#include <stdbool.h>


#define BMS_INTERLOCK_TRIGGER_INTERNAL 0x01
#define BMS_INTERLOCK_TRIGGER_EXTERNAL 0x02

#define BMS_INTERLOCK_DELAY_MINUTES 0
#define BMS_INTERLOCK_DELAY_SECONDS 1

//void startInterlockTimer();
//void stoppInterlockTimer();

void quitInterlock();

bool isExternalInterlockTriggered();
bool isInternalInterlockTriggered();
bool isInterlockTriggered(uint8_t *source);
void triggerInterlock();

#endif /* BMS_INTERLOCK_H_ */
