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

//SpiTransmissionState _writeRegisterOnDevice(uint8_t dev_address, uint8_t reg_address, uint8_t value);

bool test_ti_bq76pl536_writeRegOnDev_transmission_ok(){
  uint8_t expected_send_data[] = {0x03,0x03,0x02};
  uint8_t receive_data[] = {0x00,0x00,0x00};
  uint8_t send_data[4] = {0x00,0x00,0x00,0x00};
  SpiSimFrame transmission_ok;
  transmission_ok._data_recieved = receive_data;
  transmission_ok._data_send = send_data;
  transmission_ok._buffer_length = 3;
  transmission_ok._return_value = SPI_TRANSMISSION_OK;

  _spi_sim_data._sim_frames = &transmission_ok;
  _spi_sim_data._number_frames = 1;
  _spi_sim_data._current_frame = 0;


  uint8_t dev_address = 1;
  uint8_t reg_address = 3;
  uint8_t value = 2;

  SpiTransmissionState state = _TI_BQ76PL536_writeRegisterOnDevice(dev_address, reg_address, value);

  bool result = true;
  result &= state == SPI_TRANSMISSION_OK;
  result &= array_equals(expected_send_data, _spi_sim_data._sim_frames[0]._data_send, 3);

  return result;

}

bool test_ti_bq76pl536_writeRegOnDev_internal_failure(){
  uint8_t receive_data[] = {0x00,0x00,0x00};
  uint8_t send_data[4] = {0x00,0x00,0x00,0x00};
  SpiSimFrame transmission_nok;
  transmission_nok._data_recieved = receive_data;
  transmission_nok._data_send = send_data;
  transmission_nok._buffer_length = 3;
  transmission_nok._return_value = SPI_TRANSMISSION_ERROR;

  _spi_sim_data._sim_frames = &transmission_nok;
  _spi_sim_data._number_frames = 1;
  _spi_sim_data._current_frame = 0;


  uint8_t dev_address = 1;
  uint8_t reg_address = 3;
  uint8_t value = 2;

  SpiTransmissionState state = _TI_BQ76PL536_writeRegisterOnDevice(dev_address, reg_address, value);

  bool result = true;
  result &= state == SPI_TRANSMISSION_ERROR;

  return result;

}

bool test_ti_bq76pl536_writeRegOnDev_broadcast_transmission_ok(){
  uint8_t expected_send_data[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t receive_data[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t send_data[BMS_HOST_NUMBER_OF_INTERFACES][4];

  SpiSimFrame transmission_ok[BMS_HOST_NUMBER_OF_INTERFACES];
  unsigned int line;

  uint8_t dev_address = _TI_BQ76PL536_BROADCAST_ADDRESS;
  uint8_t reg_address = 3;
  uint8_t value = 2;

  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    receive_data[line][0]=0;
    receive_data[line][1]=0;
    receive_data[line][2]=0;

    send_data[line][0]=0;
    send_data[line][1]=0;
    send_data[line][2]=0;
    send_data[line][3]=0;

    expected_send_data[line][0] = (_TI_BQ76PL536_BROADCAST_ADDRESS<<1)|0x01;
    expected_send_data[line][1] = reg_address;
    expected_send_data[line][2] = value;

    transmission_ok[line]._data_recieved = receive_data[line];
    transmission_ok[line]._data_send = send_data[line];
    transmission_ok[line]._buffer_length = 3;
    transmission_ok[line]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_ok;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_INTERFACES;
  _spi_sim_data._current_frame = 0;


  SpiTransmissionState state = _TI_BQ76PL536_writeRegisterOnDevice(dev_address, reg_address, value);

  bool result = true;
  result &= state == SPI_TRANSMISSION_OK;
  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    result &= line == _spi_sim_data._sim_frames[line]._line_used;
    result &= array_equals(expected_send_data[line], _spi_sim_data._sim_frames[line]._data_send, 3);
  }

  return result;

}

bool test_ti_bq76pl536_writeRegOnDev_broadcast_internal_failure(){
  uint8_t receive_data[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t send_data[BMS_HOST_NUMBER_OF_INTERFACES][4];

  SpiSimFrame transmission_nok[BMS_HOST_NUMBER_OF_INTERFACES];
  unsigned int line;

  uint8_t dev_address = _TI_BQ76PL536_BROADCAST_ADDRESS;
  uint8_t reg_address = 3;
  uint8_t value = 2;

  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    receive_data[line][0]=0;
    receive_data[line][1]=0;
    receive_data[line][2]=0;

    send_data[line][0]=0;
    send_data[line][1]=0;
    send_data[line][2]=0;
    send_data[line][3]=0;

    transmission_nok[line]._data_recieved = receive_data[line];
    transmission_nok[line]._data_send = send_data[line];
    transmission_nok[line]._buffer_length = 3;
    transmission_nok[line]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_nok;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_INTERFACES;
  _spi_sim_data._current_frame = 0;
  bool result = true;

  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    _spi_sim_data._sim_frames[line]._return_value = SPI_TRANSMISSION_ERROR;
    _spi_sim_data._current_frame = 0;
    SpiTransmissionState state = _TI_BQ76PL536_writeRegisterOnDevice(dev_address, reg_address, value);
    _spi_sim_data._sim_frames[line]._return_value = SPI_TRANSMISSION_OK;
    result &= state == SPI_TRANSMISSION_ERROR;
  }

  return result;

}

bool run_ti_bq76pl536_write_low_level_tests(unsigned int *number_tests, unsigned int *number_tests_failed){
  *number_tests = 4;
  *number_tests_failed = 0;
  if(!test_ti_bq76pl536_writeRegOnDev_transmission_ok())
    (*number_tests_failed)++;

  if(!test_ti_bq76pl536_writeRegOnDev_internal_failure())
    (*number_tests_failed)++;

  if(!test_ti_bq76pl536_writeRegOnDev_broadcast_transmission_ok())
    (*number_tests_failed)++;

  if(!test_ti_bq76pl536_writeRegOnDev_broadcast_internal_failure())
    (*number_tests_failed)++;

  return *number_tests_failed == 0;
}

#endif // UNIT_TESTING
