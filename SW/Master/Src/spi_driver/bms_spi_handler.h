/*
 * @file bms_spi_handler.h
 * @author Pöschl Rene
 *
 * General SPI handler for TERA BMS Master
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */
#ifndef UNIT_TESTING
#include <stdint.h>
#include <stdbool.h>

#ifndef SRC_SPI_SLAVES_BMS_SPI_HANDLER_H_
#define SRC_SPI_SLAVES_BMS_SPI_HANDLER_H_

typedef enum{SPI_TRANSMISSION_OK = 0x0, SPI_TRANSMISSION_ERROR = 0x10, SPI_TRANSMISSION_ERROR_CRC = 0x11} SpiTransmissionState;

SpiTransmissionState spi_send_with_options(uint8_t spi_line, uint8_t *data, uint16_t size,
    bool use_crc, bool wait_after_ncs);

SpiTransmissionState spi_send(uint8_t spi_line, uint8_t *data, uint16_t size);

SpiTransmissionState spi_read_with_options(uint8_t spi_line, uint8_t *send_data, uint8_t *receive_data, uint16_t size,
    bool use_crc, bool wait_after_ncs);
SpiTransmissionState spi_read(uint8_t spi_line, uint8_t *send_data, uint8_t *receive_data, uint16_t size);

#endif /* SRC_SPI_SLAVES_BMS_SPI_HANDLER_H_ */
#else
#include "../../testing/testframework_spi_handler.h"
#endif //UNIT_TESTING
