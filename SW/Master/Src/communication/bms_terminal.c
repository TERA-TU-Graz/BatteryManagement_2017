/*
 * bms_terminal.c
 *
 * ToDo: add file description here
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

#include <stm32f4xx_hal.h>
#include <stdio.h>
#include <uart.h>
#include "../external_systems/battery_measurement.h"
#include "../external_systems/current_transducers.h"
#include "../external_systems/wheel_speed.h"
#include "../core/statemachine.h"

extern UART_HandleTypeDef huart4;


#define PRINT_BUFFER_SIZE 1024
#define TERMINAL_HORIZONTAL_LINE1 "##################################################\r\n"
#define TERMINAL_HORIZONTAL_LINE2 "--------------------------------------------------\r\n"

uint8_t print_buffer[PRINT_BUFFER_SIZE];
uint8_t livecounter = 0;

extern uint32_t max_time_per_loop;
extern BatteryMeasurementData battery_measurement_data;

extern MainFSMState main_fsm_current_state;
char *state_strings[] = {
    "INIT     ",
    "OFF      ",
    "PRECHARGE",
    "ON       ",
    "ERROR    "};

// Print something. Note that for standard 'printf' the sbrk call needs to be implemented
// printf("\033[%d;%dH%s\n", x, x, text);
//int ret = snprintf((char*)print_buffer, PRINT_BUFFER_SIZE-1, "\033[%d;%dH%s %d\r\n", 0, 0, "Hello there", HAL_GetTick());
//ret = ret > PRINT_BUFFER_SIZE-1 ? PRINT_BUFFER_SIZE-1 : ret;
//TERA_UART_write(&huart4, print_buffer, ret);
//DeleteScreen:\033[2J\033[H
void _terminalDrawHeader(){
  int chars_to_send;
  chars_to_send = snprintf((char*)print_buffer, PRINT_BUFFER_SIZE-1,
      "\033[0;0H%s%s State: %s\r\nSystick = %-10lu Oldest Data = %-10lu\r\nTmax loop = %-10lu\r\n%s",
      TERMINAL_HORIZONTAL_LINE1, "BMS TERA TU Graz ", state_strings[main_fsm_current_state],
      HAL_GetTick(), battery_measurement_data._oldest_data,
      max_time_per_loop,
      TERMINAL_HORIZONTAL_LINE1);
  if(chars_to_send <= 0){
    return;
  }
  chars_to_send = chars_to_send > PRINT_BUFFER_SIZE-1 ? PRINT_BUFFER_SIZE-1 : chars_to_send;
  TERA_UART_write(&huart4, print_buffer, chars_to_send);
  livecounter++;
}

void _terminalDrawMainBatteryInfo(){
  int chars_to_send;
  chars_to_send = snprintf((char*)print_buffer, PRINT_BUFFER_SIZE-1,
      "\033[12;0HVbatt = %3lu.%-2luV\r\nVmax = %4umV Vmin = %4umV Vavg = %4umV\r\nTmax = %+3d.%01d°C Tmin = %+3d.%01d°C Tavg = %+3d.%01d°C\r\n%s",
      battery_measurement_data._battery_voltage/1000,
      battery_measurement_data._battery_voltage%1000,
      battery_measurement_data._max_cell_voltage,
      battery_measurement_data._min_cell_voltage,
      battery_measurement_data._average_cell_voltage,
      battery_measurement_data._max_temperature/10,
      (unsigned)battery_measurement_data._max_temperature%10,
      battery_measurement_data._min_temperature/10,
      (unsigned)battery_measurement_data._min_temperature%10,
      battery_measurement_data._average_temperature/10,
      (unsigned)battery_measurement_data._average_temperature%10,
      TERMINAL_HORIZONTAL_LINE2);


  if(chars_to_send <= 0){
    return;
  }
  chars_to_send = chars_to_send > PRINT_BUFFER_SIZE-1 ? PRINT_BUFFER_SIZE-1 : chars_to_send;
  TERA_UART_write(&huart4, print_buffer, chars_to_send);
}

void _terminalDrawTempDetails(){
  int chars_to_send = 0;
  int chars_written = 0;
  int remaining_buffer_size = PRINT_BUFFER_SIZE - 1;
  unsigned int device_idx, channel;
  unsigned int sensor_idx = 1;
  uint8_t *buffer_ptr = print_buffer;

  chars_written = snprintf((char*)buffer_ptr, remaining_buffer_size, "\033[16;0H");
  if(chars_written < 0){
    return;
  }
  if(chars_written > remaining_buffer_size){
    remaining_buffer_size =  0;
  }
  else{
    remaining_buffer_size -= chars_written;
    buffer_ptr += chars_written;
  }

  for(device_idx = 0; device_idx < BMS_HOST_NUMBER_OF_SLAVES && remaining_buffer_size > 0; device_idx++){
    for(channel = 0; channel < BMS_NUMBER_TEMPERATURE_SENSORS && remaining_buffer_size > 0; channel++){
      chars_written = snprintf((char*)buffer_ptr, remaining_buffer_size, "T%-2d = %+3d.%01d°C%s",
          sensor_idx,
          battery_measurement_data._slave_meas_data[device_idx]._temperatures[channel]/10,
          (unsigned)battery_measurement_data._slave_meas_data[device_idx]._temperatures[channel]%10,
          (channel == (BMS_NUMBER_TEMPERATURE_SENSORS - 1) && device_idx % 2 == 1) ?"\r\n":" ");
      if(chars_written < 0){
        return;
      }
      if(chars_written > remaining_buffer_size){
        remaining_buffer_size =  0;
      }
      else{
        remaining_buffer_size -= chars_written;
        buffer_ptr += chars_written;
      }
      sensor_idx++;
    }
  }

  chars_to_send = PRINT_BUFFER_SIZE - 1 - remaining_buffer_size;
  TERA_UART_write(&huart4, print_buffer, chars_to_send);
}

void _terminalDrawCellVoltageDetails(){
  int chars_to_send = 0;
  int chars_written = 0;
  int remaining_buffer_size = PRINT_BUFFER_SIZE - 1;
  unsigned int device_idx, channel;
  unsigned int cell_idx = 1;
  uint8_t *buffer_ptr = print_buffer;

  chars_written = snprintf((char*)buffer_ptr, remaining_buffer_size, "\033[17;0H");
  if(chars_written < 0){
    return;
  }
  if(chars_written > remaining_buffer_size){
    remaining_buffer_size =  0;
  }
  else{
    remaining_buffer_size -= chars_written;
    buffer_ptr += chars_written;
  }

  for(device_idx = 0; device_idx < BMS_HOST_NUMBER_OF_SLAVES && remaining_buffer_size > 0; device_idx++){
    for(channel = 0; channel < BMS_CELLS_PER_SLAVE && remaining_buffer_size > 0; channel++){
      chars_written = snprintf((char*)buffer_ptr, remaining_buffer_size, "Vc%-2d = %4dmV%s",
          cell_idx,
          battery_measurement_data._slave_meas_data[device_idx]._cell_voltages[channel],
          (channel == (BMS_CELLS_PER_SLAVE - 1)) ?"\r\n":" ");
      if(chars_written < 0){
        return;
      }
      if(chars_written > remaining_buffer_size){
        remaining_buffer_size =  0;
      }
      else{
        remaining_buffer_size -= chars_written;
        buffer_ptr += chars_written;
      }
      cell_idx++;
    }

  }

  chars_to_send = PRINT_BUFFER_SIZE - 1 - remaining_buffer_size;
  TERA_UART_write(&huart4, print_buffer, chars_to_send);
}

extern uint32_t timer_measurement_result;
void _terminalDrawCurrent(){
  int chars_to_send;
  chars_to_send = snprintf((char*)print_buffer, PRINT_BUFFER_SIZE-1,
     "\033[8;0HIbat = %10ldmA Imcu = %10ldmA\r\nCb = %12lumAh  tc = %10lu\r\nCb = %12luuAh  Cb = %3u%%\r\n%s",
     ct_getCurrent(0),ct_getCurrent(1),
     (uint32_t)(battery_measurement_data._remaining_capacity_uAms/3600000000), timer_measurement_result,
     (uint32_t)(battery_measurement_data._remaining_capacity_uAms/3600000), calcSOCpercent(),
     TERMINAL_HORIZONTAL_LINE2);


  if(chars_to_send <= 0){
   return;
  }
  chars_to_send = chars_to_send > PRINT_BUFFER_SIZE-1 ? PRINT_BUFFER_SIZE-1 : chars_to_send;
  TERA_UART_write(&huart4, print_buffer, chars_to_send);
}

void _terminalDrawSpeed(){
  int chars_to_send;
  chars_to_send = snprintf((char*)print_buffer, PRINT_BUFFER_SIZE-1,
     "\033[6;0HSpeed = %5ldrpm \r\n%s",
     getWheelSpeed(),
     TERMINAL_HORIZONTAL_LINE2);


  if(chars_to_send <= 0){
   return;
  }
  chars_to_send = chars_to_send > PRINT_BUFFER_SIZE-1 ? PRINT_BUFFER_SIZE-1 : chars_to_send;
  TERA_UART_write(&huart4, print_buffer, chars_to_send);
}

void terminalUpdate(){
  static uint8_t terminal_draw_index;
  terminal_draw_index = (terminal_draw_index + 1)%5;
  _terminalDrawSpeed();
  switch(terminal_draw_index){
    case 0: _terminalDrawHeader(); break;
    case 1: _terminalDrawCurrent(); break;
    case 2: _terminalDrawMainBatteryInfo(); break;
    case 3: _terminalDrawTempDetails(); break;
    case 4: _terminalDrawCellVoltageDetails(); break;
  }
}

