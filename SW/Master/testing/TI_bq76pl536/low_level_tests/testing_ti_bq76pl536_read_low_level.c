/**
 * @file testing_ti_bq76pl536.c
 * @author Pöschl Rene
 *
 * Unit tests for the interface functions for the ti bq76pl536 bms chip.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#ifdef UNIT_TESTING
#include "../../../Src/spi_driver/ti_bq76pl536_interface.h"
#include "../../testframework_spi_handler.h"
#include "../../test_helper.h"
#include "../../../Src/spi_driver/bms_spi_handler.h"
#include "../../../Src/spi_driver/ti_bq76pl536_interface_implementation.h"

bool test_ti_bq76pl536_readFromDevice_transmission_ok(){
  uint8_t expected_send_data[] = {0x02,0x03,0x02,0x00,0x00,0x00};
  uint8_t receive_data[] = {0x00,0x00,0x00,0x19,0x9A,0x0D};
  uint8_t send_data[6];
  SpiSimFrame transmission_ok;
  transmission_ok._data_recieved = receive_data;
  transmission_ok._data_send = send_data;
  transmission_ok._buffer_length = 6;
  transmission_ok._return_value = SPI_TRANSMISSION_OK;

  _spi_sim_data._sim_frames = &transmission_ok;
  _spi_sim_data._number_frames = 1;
  _spi_sim_data._current_frame = 0;


  uint8_t dev_address = 1;
  uint8_t reg_address = 3;
  uint8_t len = 2;
  unsigned int crc_retransmit_limit = 0;
  uint8_t send_buffer[6];
  uint8_t receive_buffer[6];

  SpiTransmissionState state = TI_BQ76PL536_readFromDevice(dev_address, reg_address, send_buffer,
      receive_buffer, len, crc_retransmit_limit);

  bool result = true;
  result &= state == SPI_TRANSMISSION_OK;
  result &= array_equals(expected_send_data, _spi_sim_data._sim_frames[0]._data_send, 6);
  result &= array_equals(receive_data, receive_buffer, 6);

  return result;

}

bool test_ti_bq76pl536_readFromDevice_transmission_internal_error(){
  uint8_t receive_data[] = {0x00,0x00,0x00,0x19,0x9A,0x0D};
  uint8_t send_data[6];
  SpiSimFrame transmission_ok;
  transmission_ok._data_recieved = receive_data;
  transmission_ok._data_send = send_data;
  transmission_ok._buffer_length = 6;
  transmission_ok._return_value = SPI_TRANSMISSION_ERROR;

  _spi_sim_data._sim_frames = &transmission_ok;
  _spi_sim_data._number_frames = 1;
  _spi_sim_data._current_frame = 0;


  uint8_t dev_address = 1;
  uint8_t reg_address = 3;
  uint8_t len = 2;
  unsigned int crc_retransmit_limit = 0;
  uint8_t send_buffer[6];
  uint8_t receive_buffer[6];

  SpiTransmissionState state = TI_BQ76PL536_readFromDevice(dev_address, reg_address, send_buffer,
      receive_buffer, len, crc_retransmit_limit);

  bool result = true;
  result &= state == SPI_TRANSMISSION_ERROR;
  return result;

}

bool test_ti_bq76pl536_readFromDevice_transmission_crc_error(){
  uint8_t expected_send_data[] = {0x02,0x03,0x02,0x00,0x00,0x00};
  uint8_t receive_data[] = {0x00,0x00,0x00,0x18,0x9A,0x0D};
  uint8_t send_data[6];
  SpiSimFrame transmission_ok;
  transmission_ok._data_recieved = receive_data;
  transmission_ok._data_send = send_data;
  transmission_ok._buffer_length = 6;
  transmission_ok._return_value = SPI_TRANSMISSION_OK;

  _spi_sim_data._sim_frames = &transmission_ok;
  _spi_sim_data._number_frames = 1;
  _spi_sim_data._current_frame = 0;


  uint8_t dev_address = 1;
  uint8_t reg_address = 3;
  uint8_t len = 2;
  unsigned int crc_retransmit_limit = 0;
  uint8_t send_buffer[6];
  uint8_t receive_buffer[6];

  SpiTransmissionState state = TI_BQ76PL536_readFromDevice(dev_address, reg_address, send_buffer,
      receive_buffer, len, crc_retransmit_limit);

  bool result = true;
  result &= (state == SPI_TRANSMISSION_ERROR_CRC);
  result &= array_equals(expected_send_data, _spi_sim_data._sim_frames[0]._data_send, 6);
  result &= array_equals(receive_data, receive_buffer, 6);

  return result;
}

bool test_ti_bq76pl536_readRegisterFromDevice_transmission_ok(){
  uint8_t expected_send_data[] = {0x2,0x2,0x1,0x0,0x0};
  uint8_t receive_data[] = {0x0,0x0,0x0,0xff,0x1c};

  uint8_t send_data[5];
  SpiSimFrame transmission_ok;
  transmission_ok._data_recieved = receive_data;
  transmission_ok._data_send = send_data;
  transmission_ok._buffer_length = 5;
  transmission_ok._return_value = SPI_TRANSMISSION_OK;

  _spi_sim_data._sim_frames = &transmission_ok;
  _spi_sim_data._number_frames = 1;
  _spi_sim_data._current_frame = 0;


  uint8_t dev_address = 1;
  uint8_t reg_address = 2;
  unsigned int crc_retransmit_limit = 0;
  uint8_t value;

  SpiTransmissionState state = _TI_BQ76PL536_readRegisterFromDevice(dev_address, reg_address, &value, crc_retransmit_limit);

  bool result = true;
  result &= (state == SPI_TRANSMISSION_OK);
  result &= array_equals(expected_send_data, _spi_sim_data._sim_frames[0]._data_send, transmission_ok._buffer_length);
  result &= value == 0xff;

  return result;
}

bool test_ti_bq76pl536_readRegisterFromDevice_transmission_internal_error(){
  uint8_t receive_data[] = {0x0,0x0,0x0,0xff,0x1c};


  uint8_t send_data[5];
  SpiSimFrame transmission_ok;
  transmission_ok._data_recieved = receive_data;
  transmission_ok._data_send = send_data;
  transmission_ok._buffer_length = 5;
  transmission_ok._return_value = SPI_TRANSMISSION_ERROR;

  _spi_sim_data._sim_frames = &transmission_ok;
  _spi_sim_data._number_frames = 1;
  _spi_sim_data._current_frame = 0;


  uint8_t dev_address = 1;
  uint8_t reg_address = 2;
  unsigned int crc_retransmit_limit = 0;
  uint8_t value;

  SpiTransmissionState state = _TI_BQ76PL536_readRegisterFromDevice(dev_address, reg_address, &value, crc_retransmit_limit);

  bool result = true;
  result &= (state == SPI_TRANSMISSION_ERROR);

  return result;
}

bool test_ti_bq76pl536_readRegisterFromDevice_transmission_crc_error(){
  uint8_t receive_data[] = {0x0,0x0,0x0,0xf0,0x1c};

  uint8_t send_data[5];
  SpiSimFrame transmission_ok;
  transmission_ok._data_recieved = receive_data;
  transmission_ok._data_send = send_data;
  transmission_ok._buffer_length = 5;
  transmission_ok._return_value = SPI_TRANSMISSION_OK;

  _spi_sim_data._sim_frames = &transmission_ok;
  _spi_sim_data._number_frames = 1;
  _spi_sim_data._current_frame = 0;


  uint8_t dev_address = 1;
  uint8_t reg_address = 2;
  unsigned int crc_retransmit_limit = 0;
  uint8_t value;

  SpiTransmissionState state = _TI_BQ76PL536_readRegisterFromDevice(dev_address, reg_address, &value, crc_retransmit_limit);

  bool result = true;
  result &= (state == SPI_TRANSMISSION_ERROR_CRC);

  return result;
}

bool run_ti_bq76pl536_read_low_level_tests(unsigned int *number_tests, unsigned int *number_tests_failed){
  *number_tests = 6;
  *number_tests_failed = 0;
  if(!test_ti_bq76pl536_readFromDevice_transmission_ok())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_readFromDevice_transmission_internal_error())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_readFromDevice_transmission_crc_error())
    (*number_tests_failed)++;

  if(!test_ti_bq76pl536_readRegisterFromDevice_transmission_ok())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_readRegisterFromDevice_transmission_internal_error())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_readRegisterFromDevice_transmission_crc_error())
    (*number_tests_failed)++;

  return *number_tests_failed == 0;
}

#endif // UNIT_TESTING
