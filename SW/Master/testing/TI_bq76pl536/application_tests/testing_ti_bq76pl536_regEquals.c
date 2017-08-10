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


//bool TI_BQ76PL536_registerEquals(uint8_t reg, uint8_t expected_value, unsigned int crc_retransmit_limit)



bool test_ti_bq76pl536_regEquals_transmission_ok(){
  uint8_t reg = 0x31;
  uint8_t value = 0x63;


  uint8_t expected_send_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data[BMS_HOST_NUMBER_OF_SLAVES][5];

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES];
  unsigned int device;


  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    expected_send_data[device][0] = ((device+1)<<1);
    expected_send_data[device][1] = reg;
    expected_send_data[device][2] = 1;
    expected_send_data[device][3] = 0;
    expected_send_data[device][4] = 0;

    receive_data[device][0]=0;
    receive_data[device][1]=0;
    receive_data[device][2]=0;
    receive_data[device][3]=value;
    receive_data[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data[device], receive_data[device], 5);

    send_data[device][0]=0;
    send_data[device][1]=0;
    send_data[device][2]=0;
    send_data[device][3]=0;
    send_data[device][4]=0;

    transmission_sim[device]._data_recieved = receive_data[device];
    transmission_sim[device]._data_send = send_data[device];
    transmission_sim[device]._buffer_length = 5;
    transmission_sim[device]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES;
  _spi_sim_data._current_frame = 0;


  bool result = TI_BQ76PL536_registerEquals(reg, value, 0) == true;

  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    result &= TI_BQ76PL536_ncsLineFromDevAddr[device] == _spi_sim_data._sim_frames[device]._line_used;
    result &= array_equals(expected_send_data[device], _spi_sim_data._sim_frames[device]._data_send, 5);
  }

  return result;

}

bool test_ti_bq76pl536_regEquals_crc_error(){
  uint8_t reg = 0x31;
  uint8_t value = 0x63;


  uint8_t expected_send_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data[BMS_HOST_NUMBER_OF_SLAVES][5];

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES];
  unsigned int device;


  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    expected_send_data[device][0] = ((device+1)<<1);
    expected_send_data[device][1] = reg;
    expected_send_data[device][2] = 1;
    expected_send_data[device][3] = 0;
    expected_send_data[device][4] = 0;

    receive_data[device][0]=0;
    receive_data[device][1]=0;
    receive_data[device][2]=0;
    receive_data[device][3]=value;
    receive_data[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data[device], receive_data[device], 5);

    send_data[device][0]=0;
    send_data[device][1]=0;
    send_data[device][2]=0;
    send_data[device][3]=0;
    send_data[device][4]=0;

    transmission_sim[device]._data_recieved = receive_data[device];
    transmission_sim[device]._data_send = send_data[device];
    transmission_sim[device]._buffer_length = 5;
    transmission_sim[device]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES;



  bool result = true;
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    _spi_sim_data._current_frame = 0;
    _spi_sim_data._sim_frames[device]._data_recieved[4] ^= 0x01;
    result &= TI_BQ76PL536_registerEquals(reg, value, 0) == false;
    _spi_sim_data._sim_frames[device]._data_recieved[4] ^= 0x01;
  }

  return result;

}

bool test_ti_bq76pl536_regEquals_value_error(){
  uint8_t reg = 0x31;
  uint8_t value = 0x63;


  uint8_t expected_send_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t wrong_value_receive_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data[BMS_HOST_NUMBER_OF_SLAVES][5];

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES];
  unsigned int device;


  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    expected_send_data[device][0] = ((device+1)<<1);
    expected_send_data[device][1] = reg;
    expected_send_data[device][2] = 1;
    expected_send_data[device][3] = 0;
    expected_send_data[device][4] = 0;

    receive_data[device][0]=0;
    receive_data[device][1]=0;
    receive_data[device][2]=0;
    receive_data[device][3]=value;
    receive_data[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data[device], receive_data[device], 5);

    wrong_value_receive_data[device][0]=0;
    wrong_value_receive_data[device][1]=0;
    wrong_value_receive_data[device][2]=0;
    wrong_value_receive_data[device][3]=value ^ 0x1;
    wrong_value_receive_data[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data[device], wrong_value_receive_data[device], 5);

    send_data[device][0]=0;
    send_data[device][1]=0;
    send_data[device][2]=0;
    send_data[device][3]=0;
    send_data[device][4]=0;

    transmission_sim[device]._data_recieved = receive_data[device];
    transmission_sim[device]._data_send = send_data[device];
    transmission_sim[device]._buffer_length = 5;
    transmission_sim[device]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES;



  bool result = true;
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    _spi_sim_data._current_frame = 0;
    transmission_sim[device]._data_recieved = wrong_value_receive_data[device];
    result &= TI_BQ76PL536_registerEquals(reg, value, 0) == false;
    transmission_sim[device]._data_recieved = receive_data[device];
  }

  return result;

}

bool test_ti_bq76pl536_regEquals_internal_error(){
  uint8_t reg = 0x31;
  uint8_t value = 0x63;


  uint8_t expected_send_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data[BMS_HOST_NUMBER_OF_SLAVES][5];

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES];
  unsigned int device;


  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    expected_send_data[device][0] = ((device+1)<<1);
    expected_send_data[device][1] = reg;
    expected_send_data[device][2] = 1;
    expected_send_data[device][3] = 0;
    expected_send_data[device][4] = 0;

    receive_data[device][0]=0;
    receive_data[device][1]=0;
    receive_data[device][2]=0;
    receive_data[device][3]=value;
    receive_data[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data[device], receive_data[device], 5);

    send_data[device][0]=0;
    send_data[device][1]=0;
    send_data[device][2]=0;
    send_data[device][3]=0;
    send_data[device][4]=0;

    transmission_sim[device]._data_recieved = receive_data[device];
    transmission_sim[device]._data_send = send_data[device];
    transmission_sim[device]._buffer_length = 5;
    transmission_sim[device]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES;



  bool result = true;
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    _spi_sim_data._current_frame = 0;
    transmission_sim[device]._return_value = SPI_TRANSMISSION_ERROR;
    result &= TI_BQ76PL536_registerEquals(reg, value, 0) == false;
    transmission_sim[device]._return_value = SPI_TRANSMISSION_OK;
  }

  return result;

}

bool run_ti_bq76pl536_regEquals_tests(unsigned int *number_tests, unsigned int *number_tests_failed){
  *number_tests = 4;
  *number_tests_failed = 0;
  if(!test_ti_bq76pl536_regEquals_transmission_ok())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_regEquals_crc_error())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_regEquals_value_error())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_regEquals_internal_error())
    (*number_tests_failed)++;

  return *number_tests_failed == 0;
}

#endif // UNIT_TESTING
