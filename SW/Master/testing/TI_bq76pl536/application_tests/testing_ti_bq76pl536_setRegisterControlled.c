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

/*bool TI_BQ76PL536_setRegisterControlled(uint8_t reg, uint8_t value,
    unsigned int crc_retransmit_limit, unsigned int retry_limit);*/

bool test_ti_bq76pl536_setRegisterControlled_normalReg_transmission_ok(){
  uint8_t reg = 0x31;
  uint8_t value = 0x63;

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES+BMS_HOST_NUMBER_OF_INTERFACES];

  uint8_t expected_send_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t receive_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t send_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][4];

  unsigned int frame_index, device, line;
  
  // write to register
  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line;
    receive_data_writeReg[line][0]=0;
    receive_data_writeReg[line][1]=0;
    receive_data_writeReg[line][2]=0;

    send_data_writeReg[line][0]=0;
    send_data_writeReg[line][1]=0;
    send_data_writeReg[line][2]=0;
    send_data_writeReg[line][3]=0;

    expected_send_data_writeReg[line][0] = (_TI_BQ76PL536_BROADCAST_ADDRESS<<1)|0x01;
    expected_send_data_writeReg[line][1] = reg;
    expected_send_data_writeReg[line][2] = value;

    transmission_sim[frame_index]._data_recieved = receive_data_writeReg[line];
    transmission_sim[frame_index]._data_send = send_data_writeReg[line];
    transmission_sim[frame_index]._buffer_length = 3;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  uint8_t expected_send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  // register equals
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + BMS_HOST_NUMBER_OF_INTERFACES;
    expected_send_data_chkReg[device][0] = ((device+1)<<1);
    expected_send_data_chkReg[device][1] = reg;
    expected_send_data_chkReg[device][2] = 1;
    expected_send_data_chkReg[device][3] = 0;
    expected_send_data_chkReg[device][4] = 0;

    receive_data_chkReg[device][0]=0;
    receive_data_chkReg[device][1]=0;
    receive_data_chkReg[device][2]=0;
    receive_data_chkReg[device][3]=value;
    receive_data_chkReg[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data_chkReg[device], receive_data_chkReg[device], 5);

    send_data_chkReg[device][0]=0;
    send_data_chkReg[device][1]=0;
    send_data_chkReg[device][2]=0;
    send_data_chkReg[device][3]=0;
    send_data_chkReg[device][4]=0;

    transmission_sim[frame_index]._data_recieved = receive_data_chkReg[device];
    transmission_sim[frame_index]._data_send = send_data_chkReg[device];
    transmission_sim[frame_index]._buffer_length = 5;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES + BMS_HOST_NUMBER_OF_INTERFACES;

  _spi_sim_data._current_frame = 0;
  bool result = TI_BQ76PL536_setRegisterControlled(reg, value, 0, 0) == true;

  for(line = 0 ; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line;
    result &= frame_index == _spi_sim_data._sim_frames[frame_index]._line_used;
    result &= array_equals(expected_send_data_writeReg[line], _spi_sim_data._sim_frames[frame_index]._data_send, 3);
  }
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + BMS_HOST_NUMBER_OF_INTERFACES;
    result &= TI_BQ76PL536_ncsLineFromDevAddr[device] == _spi_sim_data._sim_frames[frame_index]._line_used;
    result &= array_equals(expected_send_data_chkReg[device], _spi_sim_data._sim_frames[frame_index]._data_send, 5);
  }

  return result;

}

bool test_ti_bq76pl536_setRegisterControlled_normalReg_crcError(){
  uint8_t reg = 0x31;
  uint8_t value = 0x63;

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES+BMS_HOST_NUMBER_OF_INTERFACES];

  uint8_t receive_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t send_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][4];

  unsigned int frame_index, device, line;

  // write to register
  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line;
    receive_data_writeReg[line][0]=0;
    receive_data_writeReg[line][1]=0;
    receive_data_writeReg[line][2]=0;

    send_data_writeReg[line][0]=0;
    send_data_writeReg[line][1]=0;
    send_data_writeReg[line][2]=0;
    send_data_writeReg[line][3]=0;

    transmission_sim[frame_index]._data_recieved = receive_data_writeReg[line];
    transmission_sim[frame_index]._data_send = send_data_writeReg[line];
    transmission_sim[frame_index]._buffer_length = 3;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  uint8_t expected_send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  // register equals
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + BMS_HOST_NUMBER_OF_INTERFACES;
    expected_send_data_chkReg[device][0] = ((device+1)<<1);
    expected_send_data_chkReg[device][1] = reg;
    expected_send_data_chkReg[device][2] = 1;
    expected_send_data_chkReg[device][3] = 0;
    expected_send_data_chkReg[device][4] = 0;

    receive_data_chkReg[device][0]=0;
    receive_data_chkReg[device][1]=0;
    receive_data_chkReg[device][2]=0;
    receive_data_chkReg[device][3]=value;
    receive_data_chkReg[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data_chkReg[device], receive_data_chkReg[device], 5);

    send_data_chkReg[device][0]=0;
    send_data_chkReg[device][1]=0;
    send_data_chkReg[device][2]=0;
    send_data_chkReg[device][3]=0;
    send_data_chkReg[device][4]=0;

    transmission_sim[frame_index]._data_recieved = receive_data_chkReg[device];
    transmission_sim[frame_index]._data_send = send_data_chkReg[device];
    transmission_sim[frame_index]._buffer_length = 5;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES + BMS_HOST_NUMBER_OF_INTERFACES;
  _spi_sim_data._current_frame = 0;


  bool result = true;

  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + BMS_HOST_NUMBER_OF_INTERFACES;
    _spi_sim_data._sim_frames[frame_index]._data_recieved[4] ^= 0x01;
    _spi_sim_data._current_frame = 0;
    result &= TI_BQ76PL536_setRegisterControlled(reg, value, 0, 0) == false;
    _spi_sim_data._sim_frames[frame_index]._data_recieved[4] ^= 0x01;
  }

  return result;

}

bool test_ti_bq76pl536_setRegisterControlled_normalReg_valueError(){
  uint8_t reg = 0x31;
  uint8_t value = 0x63;

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES+BMS_HOST_NUMBER_OF_INTERFACES];


  uint8_t receive_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t send_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][4];

  unsigned int frame_index, device, line;

  // write to register
  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line;
    receive_data_writeReg[line][0]=0;
    receive_data_writeReg[line][1]=0;
    receive_data_writeReg[line][2]=0;

    send_data_writeReg[line][0]=0;
    send_data_writeReg[line][1]=0;
    send_data_writeReg[line][2]=0;
    send_data_writeReg[line][3]=0;

    transmission_sim[frame_index]._data_recieved = receive_data_writeReg[line];
    transmission_sim[frame_index]._data_send = send_data_writeReg[line];
    transmission_sim[frame_index]._buffer_length = 3;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  uint8_t expected_send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t wrong_value_receive_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  // register equals
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + BMS_HOST_NUMBER_OF_INTERFACES;
    expected_send_data_chkReg[device][0] = ((device+1)<<1);
    expected_send_data_chkReg[device][1] = reg;
    expected_send_data_chkReg[device][2] = 1;
    expected_send_data_chkReg[device][3] = 0;
    expected_send_data_chkReg[device][4] = 0;

    receive_data_chkReg[device][0]=0;
    receive_data_chkReg[device][1]=0;
    receive_data_chkReg[device][2]=0;
    receive_data_chkReg[device][3]=value;
    receive_data_chkReg[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data_chkReg[device], receive_data_chkReg[device], 5);

    wrong_value_receive_data_chkReg[device][0]=0;
    wrong_value_receive_data_chkReg[device][1]=0;
    wrong_value_receive_data_chkReg[device][2]=0;
    wrong_value_receive_data_chkReg[device][3]=value ^ 0x1;
    wrong_value_receive_data_chkReg[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data_chkReg[device], wrong_value_receive_data_chkReg[device], 5);

    send_data_chkReg[device][0]=0;
    send_data_chkReg[device][1]=0;
    send_data_chkReg[device][2]=0;
    send_data_chkReg[device][3]=0;
    send_data_chkReg[device][4]=0;

    transmission_sim[frame_index]._data_recieved = receive_data_chkReg[device];
    transmission_sim[frame_index]._data_send = send_data_chkReg[device];
    transmission_sim[frame_index]._buffer_length = 5;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES + BMS_HOST_NUMBER_OF_INTERFACES;
  _spi_sim_data._current_frame = 0;


  bool result = true;

  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + BMS_HOST_NUMBER_OF_INTERFACES;
    transmission_sim[frame_index]._data_recieved = wrong_value_receive_data_chkReg[device];
    _spi_sim_data._current_frame = 0;
    result &= TI_BQ76PL536_setRegisterControlled(reg, value, 0, 0) == false;
    transmission_sim[frame_index]._data_recieved = receive_data_chkReg[device];
  }

  return result;

}

bool test_ti_bq76pl536_setRegisterControlled_normalReg_internalFault(){
  uint8_t reg = 0x31;
  uint8_t value = 0x63;

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES+BMS_HOST_NUMBER_OF_INTERFACES];

  uint8_t receive_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t send_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][4];

  unsigned int frame_index, device, line;

  // write to register
  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line;
    receive_data_writeReg[line][0]=0;
    receive_data_writeReg[line][1]=0;
    receive_data_writeReg[line][2]=0;

    send_data_writeReg[line][0]=0;
    send_data_writeReg[line][1]=0;
    send_data_writeReg[line][2]=0;
    send_data_writeReg[line][3]=0;

    transmission_sim[frame_index]._data_recieved = receive_data_writeReg[line];
    transmission_sim[frame_index]._data_send = send_data_writeReg[line];
    transmission_sim[frame_index]._buffer_length = 3;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  uint8_t expected_send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  // register equals
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + BMS_HOST_NUMBER_OF_INTERFACES;
    expected_send_data_chkReg[device][0] = ((device+1)<<1);
    expected_send_data_chkReg[device][1] = reg;
    expected_send_data_chkReg[device][2] = 1;
    expected_send_data_chkReg[device][3] = 0;
    expected_send_data_chkReg[device][4] = 0;

    receive_data_chkReg[device][0]=0;
    receive_data_chkReg[device][1]=0;
    receive_data_chkReg[device][2]=0;
    receive_data_chkReg[device][3]=value;
    receive_data_chkReg[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data_chkReg[device], receive_data_chkReg[device], 5);

    send_data_chkReg[device][0]=0;
    send_data_chkReg[device][1]=0;
    send_data_chkReg[device][2]=0;
    send_data_chkReg[device][3]=0;
    send_data_chkReg[device][4]=0;

    transmission_sim[frame_index]._data_recieved = receive_data_chkReg[device];
    transmission_sim[frame_index]._data_send = send_data_chkReg[device];
    transmission_sim[frame_index]._buffer_length = 5;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES + BMS_HOST_NUMBER_OF_INTERFACES;
  _spi_sim_data._current_frame = 0;


  bool result = true;

  for(line = 0 ; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line;
    _spi_sim_data._sim_frames[frame_index]._return_value = SPI_TRANSMISSION_ERROR;
    _spi_sim_data._current_frame = 0;
    result &= TI_BQ76PL536_setRegisterControlled(reg, value, 0, 0) == false;
    _spi_sim_data._sim_frames[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + BMS_HOST_NUMBER_OF_INTERFACES;
    _spi_sim_data._sim_frames[frame_index]._return_value = SPI_TRANSMISSION_ERROR;
    _spi_sim_data._current_frame = 0;
    result &= TI_BQ76PL536_setRegisterControlled(reg, value, 0, 0) == false;
    _spi_sim_data._sim_frames[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  return result;

}


bool test_ti_bq76pl536_setRegisterControlled_grp3Reg_transmission_ok(){
  uint8_t reg = 0x40;
  uint8_t value = 0x50;

  SpiSimFrame transmission_sim[BMS_HOST_NUMBER_OF_SLAVES+2*BMS_HOST_NUMBER_OF_INTERFACES];

  uint8_t expected_send_data_en_grp3_wrt[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t receive_data_en_grp3_wrt[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t send_data_en_grp3_wrt[BMS_HOST_NUMBER_OF_INTERFACES][4];

  unsigned int frame_index, device, line;

  // write to register
  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line;
    receive_data_en_grp3_wrt[line][0]=0;
    receive_data_en_grp3_wrt[line][1]=0;
    receive_data_en_grp3_wrt[line][2]=0;

    send_data_en_grp3_wrt[line][0]=0;
    send_data_en_grp3_wrt[line][1]=0;
    send_data_en_grp3_wrt[line][2]=0;
    send_data_en_grp3_wrt[line][3]=0;

    expected_send_data_en_grp3_wrt[line][0] = (_TI_BQ76PL536_BROADCAST_ADDRESS<<1)|0x01;
    expected_send_data_en_grp3_wrt[line][1] = 0x3a;
    expected_send_data_en_grp3_wrt[line][2] = 0x35;

    transmission_sim[frame_index]._data_recieved = receive_data_en_grp3_wrt[line];
    transmission_sim[frame_index]._data_send = send_data_en_grp3_wrt[line];
    transmission_sim[frame_index]._buffer_length = 3;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  uint8_t expected_send_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t receive_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][3];
  uint8_t send_data_writeReg[BMS_HOST_NUMBER_OF_INTERFACES][4];

  // write to register
  for(line = 0; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line + BMS_HOST_NUMBER_OF_INTERFACES;
    receive_data_writeReg[line][0]=0;
    receive_data_writeReg[line][1]=0;
    receive_data_writeReg[line][2]=0;

    send_data_writeReg[line][0]=0;
    send_data_writeReg[line][1]=0;
    send_data_writeReg[line][2]=0;
    send_data_writeReg[line][3]=0;

    expected_send_data_writeReg[line][0] = (_TI_BQ76PL536_BROADCAST_ADDRESS<<1)|0x01;
    expected_send_data_writeReg[line][1] = reg;
    expected_send_data_writeReg[line][2] = value;

    transmission_sim[frame_index]._data_recieved = receive_data_writeReg[line];
    transmission_sim[frame_index]._data_send = send_data_writeReg[line];
    transmission_sim[frame_index]._buffer_length = 3;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  uint8_t expected_send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t receive_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  uint8_t send_data_chkReg[BMS_HOST_NUMBER_OF_SLAVES][5];
  // register equals
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + 2*BMS_HOST_NUMBER_OF_INTERFACES;
    expected_send_data_chkReg[device][0] = ((device+1)<<1);
    expected_send_data_chkReg[device][1] = reg;
    expected_send_data_chkReg[device][2] = 1;
    expected_send_data_chkReg[device][3] = 0;
    expected_send_data_chkReg[device][4] = 0;

    receive_data_chkReg[device][0]=0;
    receive_data_chkReg[device][1]=0;
    receive_data_chkReg[device][2]=0;
    receive_data_chkReg[device][3]=value;
    receive_data_chkReg[device][4]=_TI_BQ76PL536_calcCRC(expected_send_data_chkReg[device], receive_data_chkReg[device], 5);

    send_data_chkReg[device][0]=0;
    send_data_chkReg[device][1]=0;
    send_data_chkReg[device][2]=0;
    send_data_chkReg[device][3]=0;
    send_data_chkReg[device][4]=0;

    transmission_sim[frame_index]._data_recieved = receive_data_chkReg[device];
    transmission_sim[frame_index]._data_send = send_data_chkReg[device];
    transmission_sim[frame_index]._buffer_length = 5;
    transmission_sim[frame_index]._return_value = SPI_TRANSMISSION_OK;
  }

  _spi_sim_data._sim_frames = transmission_sim;
  _spi_sim_data._number_frames = BMS_HOST_NUMBER_OF_SLAVES + 2*BMS_HOST_NUMBER_OF_INTERFACES;

  _spi_sim_data._current_frame = 0;
  bool result = TI_BQ76PL536_setRegisterControlled(reg, value, 0, 0) == true;

  for(line = 0 ; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line;
    result &= line == _spi_sim_data._sim_frames[frame_index]._line_used;
    result &= array_equals(expected_send_data_en_grp3_wrt[line], _spi_sim_data._sim_frames[frame_index]._data_send, 3);
  }

  for(line = 0 ; line < BMS_HOST_NUMBER_OF_INTERFACES; line++){
    frame_index = line + BMS_HOST_NUMBER_OF_INTERFACES;
    result &= line == _spi_sim_data._sim_frames[frame_index]._line_used;
    result &= array_equals(expected_send_data_writeReg[line], _spi_sim_data._sim_frames[frame_index]._data_send, 3);
  }
  for(device = 0; device < BMS_HOST_NUMBER_OF_SLAVES; device++){
    frame_index = device + 2*BMS_HOST_NUMBER_OF_INTERFACES;
    result &= TI_BQ76PL536_ncsLineFromDevAddr[device] == _spi_sim_data._sim_frames[frame_index]._line_used;
    result &= array_equals(expected_send_data_chkReg[device], _spi_sim_data._sim_frames[frame_index]._data_send, 5);
  }

  return result;

}

bool run_ti_bq76pl536_setRegisterControlled_tests(unsigned int *number_tests, unsigned int *number_tests_failed){
  *number_tests = 5;
  *number_tests_failed = 0;
  if(!test_ti_bq76pl536_setRegisterControlled_normalReg_transmission_ok())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_setRegisterControlled_normalReg_crcError())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_setRegisterControlled_normalReg_valueError())
    (*number_tests_failed)++;
  if(!test_ti_bq76pl536_setRegisterControlled_normalReg_internalFault())
    (*number_tests_failed)++;

  if(!test_ti_bq76pl536_setRegisterControlled_grp3Reg_transmission_ok())
    (*number_tests_failed)++;
  return *number_tests_failed == 0;
}

#endif // UNIT_TESTING
