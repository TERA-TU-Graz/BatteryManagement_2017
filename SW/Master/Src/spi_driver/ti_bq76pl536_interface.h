/*
 * @file ti_bq76pl536_interface.h
 * @author Pöschl Rene
 *
 * Interface definition for texas instruments 76bq536 battery measurement and balancing chip.
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

#include <main.h>
#include <stm32f4xx_hal_gpio.h>

#include "../spi_driver/bms_spi_handler.h"
#include "../battery.h"

#ifndef SRC_TI_BQ76PL536_INTERFACE_H_
#define SRC_TI_BQ76PL536_INTERFACE_H_

#define TI_BQ76PL536_SEND_FRAME_SIZE 3

#define TI_BQ76PL536__FAULT_DETECTED (HAL_GPIO_ReadPin(N_Fault_GPIO_Port, N_Fault_Pin) == GPIO_PIN_RESET)
#define TI_BQ76PL536__ALERT_DETECTED (HAL_GPIO_ReadPin(N_Alert_GPIO_Port, N_Alert_Pin) == GPIO_PIN_RESET)

typedef struct{
  uint8_t _placeholder[TI_BQ76PL536_SEND_FRAME_SIZE]; //will be filled with 0
  uint16_t _pack_voltage;
  uint16_t _cell_voltages[6];  // use all 6 registers. If not all cells are used, the rest of the memory is filled with whatever is in the device.
  uint16_t _temperatures[2];
  uint8_t _crc;
}__attribute__ ((packed)) TI_BQ76PL536_RawMeasurementData;

typedef struct
{
  uint8_t _drdy     :1; // data ready for read
  uint8_t _cbt      :1; // cell balance timer running
  uint8_t _uvlo     :1; // voltage to low, device function not ensured
  uint8_t _ecc_cor  :1; // EPROM one bit error found and corrected
  uint8_t _reserved :1; // not used
  uint8_t _alert    :1; // alert active
  uint8_t _fault    :1; // fault active
  uint8_t _ar_ok    :1; // address assigned
}__attribute__ ((packed)) TI_BQ76PL536_StatusRegister;

bool TI_BQ76PL536_prepareDevicesForMeasurement(uint crc_retransmit_limit);
bool TI_BQ76PL536_readMeasurementData(uint8_t dev_address, TI_BQ76PL536_RawMeasurementData *data, uint crc_retransmit_limit);

bool TI_BQ76PL536_tempertureFromAdcValue(uint16_t *adc_value, int16_t *temperature);
bool TI_BQ76PL536_packVoltageFromAdcValue(uint16_t *adc_value, uint16_t *pack_voltage);
bool TI_BQ76PL536_cellVoltageFromAdcValue(uint16_t *adc_value, uint16_t *cell_voltage);

int8_t TI_BQ76PL536_initDaisyChain();
bool TI_BQ76PL536_isDaisychainOk(uint32_t *active_members);
bool TI_BQ76PL536_isDeviceOnBus(uint8_t dev_address);
bool TI_BQ76PL536_initDevices();

bool TI_BQ76PL536_registerEquals(uint8_t reg, uint8_t expected_value, uint crc_retransmit_limit);
bool TI_BQ76PL536_setRegisterControlled(uint8_t reg, uint8_t value,
    uint crc_retransmit_limit, unsigned int retry_limit);
SpiTransmissionState TI_BQ76PL536_readFromDevice(uint8_t dev_address, uint8_t reg_address, uint8_t *send_buffer,
    uint8_t *receive_buffer, uint8_t len, uint crc_retransmit_limit);

bool TI_BQ76PL536_readStatusRegisters(uint crc_retransmit_limit);
bool TI_BQ76PL536_broadcastReadRegister(uint8_t *storage, uint8_t reg, uint crc_retransmit_limit);
bool TI_BQ76PL536_slaveCrcErrorOccurred(uint8_t device_address, uint crc_retransmit_limit);
bool unittest_slavecrcerror();
bool TI_BQ76PL536_clearError(uint8_t device_address, uint8_t reg, uint8_t fault_mask);

bool TI_BQ76PL536_wakeup(uint crc_retransmit_limit);
bool TI_BQ76PL536_enterSleepMode(uint crc_retransmit_limit, uint32_t timeout);


#endif /* SRC_TI_BQ76PL536_INTERFACE_H_ */
