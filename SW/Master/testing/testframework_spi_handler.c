/**
 * @file testframework_spi_handler.c
 * @author Pöschl Rene
 *
 * Testframework for simulating spi communications.
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
#include "testframework_spi_handler.h"
#include <stddef.h>
#include <stm32f4xx_hal_conf.h>

SpiSimData _spi_sim_data;

void _copy_data(uint8_t * src, uint8_t *dst, uint16_t size){
  assert_param(src != NULL);
  assert_param(dst != NULL);

  uint16_t i;
  for(i = 0; i < size; i++){
    dst[i] = src[i];
  }
}

SpiTransmissionState spi_send_with_options(uint8_t spi_line, uint8_t *data, uint16_t size,
    bool use_crc, bool wait_after_ncs){
  assert_param(data != NULL);
  if(_spi_sim_data._sim_frames == NULL){
    return SPI_TRANSMISSION_ERROR;
  }
  if(_spi_sim_data._current_frame >= _spi_sim_data._number_frames){
    return SPI_TRANSMISSION_ERROR;
  }
  unsigned int current_frame = _spi_sim_data._current_frame;
  if(_spi_sim_data._sim_frames[current_frame]._data_send == NULL){
    return SPI_TRANSMISSION_ERROR;
  }
  _spi_sim_data._sim_frames[current_frame]._line_used = spi_line;

  if(size > _spi_sim_data._sim_frames[current_frame]._buffer_length){
    return SPI_TRANSMISSION_ERROR;
  }
  _copy_data(data, _spi_sim_data._sim_frames[current_frame]._data_send, size);
  _spi_sim_data._current_frame++;

  return _spi_sim_data._sim_frames[current_frame]._return_value;
}

SpiTransmissionState spi_send(uint8_t spi_line, uint8_t *data, uint16_t size){
  assert_param(data != NULL);
  return spi_send_with_options(spi_line, data, size, true, false);
}

SpiTransmissionState spi_read_with_options(uint8_t spi_line, uint8_t *send_data, uint8_t *receive_data, uint16_t size,
    bool use_crc, bool wait_after_ncs){
  assert_param(send_data != NULL);
  assert_param(receive_data != NULL);

  if(_spi_sim_data._sim_frames == NULL){
    return SPI_TRANSMISSION_ERROR;
  }
  if(_spi_sim_data._current_frame >= _spi_sim_data._number_frames){
    return SPI_TRANSMISSION_ERROR;
  }
  unsigned int current_frame = _spi_sim_data._current_frame;
  if(_spi_sim_data._sim_frames[current_frame]._data_send == NULL){
    return SPI_TRANSMISSION_ERROR;
  }
  if(_spi_sim_data._sim_frames[current_frame]._data_recieved == NULL){
    return SPI_TRANSMISSION_ERROR;
  }
  _spi_sim_data._sim_frames[current_frame]._line_used = spi_line;

  if(size > _spi_sim_data._sim_frames[current_frame]._buffer_length){
    return SPI_TRANSMISSION_ERROR;
  }
  _copy_data(send_data, _spi_sim_data._sim_frames[current_frame]._data_send, size);
  _copy_data(_spi_sim_data._sim_frames[current_frame]._data_recieved, receive_data, size);
  _spi_sim_data._current_frame++;
  return _spi_sim_data._sim_frames[current_frame]._return_value;
}

SpiTransmissionState spi_read(uint8_t spi_line, uint8_t *send_data, uint8_t *receive_data, uint16_t size){
  assert_param(send_data != NULL);
  assert_param(receive_data != NULL);

  return spi_read_with_options(spi_line, send_data, receive_data, size, true, false);
}
#endif //UNIT_TESTING
