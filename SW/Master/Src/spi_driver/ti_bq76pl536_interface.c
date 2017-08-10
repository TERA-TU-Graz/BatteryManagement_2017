/**
 * @file ti_bq76pl536_interface.c
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
#include "ti_bq76pl536_interface_implementation.h"
#include "ti_bq76pl536_interface.h"

//######################################################################################################

uint8_t TI_BQ76PL536_ncsLineFromDevAddr[BMS_HOST_NUMBER_OF_SLAVES] = BMS_NCS_LINE_SETUP;

TI_BQ76PL536_StatusRegister ti_bq76pl536_status[BMS_HOST_NUMBER_OF_SLAVES];

//######################################################################################################

/**
 * Initialize the daisychain. In other words: give all devices their address.
 *
 * @return {int8_t} number of devices addressed or -1 on error
 */
int8_t TI_BQ76PL536_initDaisyChain(){
    uint8_t current_line = 0;
    uint8_t first_device_on_current_line = 1;
    uint8_t init_device = 1;
    uint8_t device_address = 1;
    int8_t num_devices_addressed = 0;
    //TI_BQ76PL536_wakeup(0);
    //if(TI_BQ76PL536_isDaisychainOk(NULL)){
    //  return BMS_HOST_NUMBER_OF_SLAVES; // ToDo: Why do we need this for the new hw?
    //}
    while(init_device <= BMS_HOST_NUMBER_OF_SLAVES){
        first_device_on_current_line = init_device;
        current_line = TI_BQ76PL536_ncsLineFromDevAddr[init_device];

        for(init_device = first_device_on_current_line;
            init_device <= BMS_HOST_NUMBER_OF_SLAVES && TI_BQ76PL536_ncsLineFromDevAddr[init_device] == current_line;
            init_device++){
            _TI_BQ76PL536_slaveResetDevicesOnLine(current_line);
            for(device_address = first_device_on_current_line;
              device_address <= init_device;
              device_address++){
                if(!_TI_BQ76PL536_setDeviceAddress(device_address)){
                    return -1;
                }
            }
            num_devices_addressed++;
        }
    }
    return num_devices_addressed;
}

/**
 * Initialize all devices.
 *
 * @return {bool} true on success
 */
bool TI_BQ76PL536_initDevices(uint crc_retransmit_limit, uint retry_limit){
  bool succesfull = true;
  //_resetGrp3Regs(_TI_BQ76PL536_BROADCAST_ADDRESS);
  TI_BQ76PL536_clearError(_TI_BQ76PL536_BROADCAST_ADDRESS,
          _TI_BQ76PL536_REG_ALERT_STATUS, 0x80);

  // Delete POR Error.
  TI_BQ76PL536_clearError(_TI_BQ76PL536_BROADCAST_ADDRESS,
        _TI_BQ76PL536_REG_FAULT_STATUS, 0x08);

  // Enable ADC
  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_ADC_CONTROL, _TI_BQ76PL536_REGVAL_ADC_CONTROL,
      crc_retransmit_limit, retry_limit);
  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_IO_CONTROL, _TI_BQ76PL536_REGVAL_IO_CONTROL,
      crc_retransmit_limit, retry_limit);

  // Config ADC
  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_FUNCTION_CONFIG, _TI_BQ76PL536_REGVAL_FUNCTION_CONTROL,
      crc_retransmit_limit, retry_limit);

  // Over Voltage Protection
  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_CONFIG_COV, _TI_BQ76PL536_REGVAL_OVER_VOLTAGE,
      crc_retransmit_limit, retry_limit);

  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_CONFIG_COVT, _TI_BQ76PL536_REGVAL_VOLTAGE_DELAY,
      crc_retransmit_limit, retry_limit);

  // Under Voltage Protection
  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_CONFIG_CUV, _TI_BQ76PL536_REGVAL_UNDER_VOLTAGE,
      crc_retransmit_limit, retry_limit);

  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_CONFIG_CUVT, _TI_BQ76PL536_REGVAL_VOLTAGE_DELAY,
      crc_retransmit_limit, retry_limit);

  // Temperature Protection
  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_CONFIG_OT, _TI_BQ76PL536_REGVAL_OVER_TEMP,
      crc_retransmit_limit, retry_limit);

  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_CONFIG_OTT, _TI_BQ76PL536_REGVAL_TEMP_DELAY,
      crc_retransmit_limit, retry_limit);

  // Balancing timer
  succesfull &= TI_BQ76PL536_setRegisterControlled(_TI_BQ76PL536_REG_CB_TIME, _TI_BQ76PL536_REGVAL_CB_TIME,
      crc_retransmit_limit, retry_limit);

  return succesfull;
}

bool TI_BQ76PL536_readStatusRegisters(uint crc_retransmit_limit){
  int device_idx;
  bool result = true;
  for(device_idx = 0; device_idx < BMS_HOST_NUMBER_OF_SLAVES; device_idx++){
    result &= _TI_BQ76PL536_readRegisterFromDevice(device_idx+1, _TI_BQ76PL536_REG_DEVICE_STATUS,
      (uint8_t*)&(ti_bq76pl536_status[device_idx]), crc_retransmit_limit) == SPI_TRANSMISSION_OK;
  }
  return result;
}

/*
 * Read a register from all devises and store it in the array given.
 * The array must be of size BMS_HOST_NUMBER_OF_SLAVES!
 *
 * @param {uint8_t *} storage the array where the rusult is stored. It needs to be at least of size BMS_HOST_NUMBER_OF_SLAVES
 * @param {uint8_t} reg the register address
 * @param {uint} crc_retransmit_limit how often should we retry for each slave if we encounter a crc error.
 * @return {bool} true if transmission was successfull for all slaves. false if there was an error in at least one transmission.
 */
bool TI_BQ76PL536_broadcastReadRegister(uint8_t *storage, uint8_t reg, uint crc_retransmit_limit){
  assert_param(storage != NULL);
  int device_idx;
  bool result = true;
  for(device_idx = 0; device_idx < BMS_HOST_NUMBER_OF_SLAVES; device_idx++){
    result &= _TI_BQ76PL536_readRegisterFromDevice(device_idx+1, reg,
      &(storage[device_idx]), crc_retransmit_limit) == SPI_TRANSMISSION_OK;
  }
  return result;
}

/*
 * Clear an error flag in the fault or alert register
 *
 * @param {uint8_t} device_address The address of the device in question or the broadcast address.
 * @param {uint8_t} reg the register address (Alert or Fault registers are allowed)
 * @return {bool} true if transmission was successful for all slaves. false if there was an error in at least one transmission.
 */
bool TI_BQ76PL536_clearError(uint8_t device_address, uint8_t reg, uint8_t fault_mask){
  assert_param(reg == _TI_BQ76PL536_REG_FAULT_STATUS || reg == _TI_BQ76PL536_REG_ALERT_STATUS);
  bool result = true;

  result &= _TI_BQ76PL536_writeRegisterOnDevice(device_address,
      reg, fault_mask) == SPI_TRANSMISSION_OK;
  result &= _TI_BQ76PL536_writeRegisterOnDevice(device_address,
      reg, 0x00) == SPI_TRANSMISSION_OK;

  return result;
}

bool unittest_slavecrcerror(){
  int device_idx;
  bool result = true;
  uint8_t send_buffer[TI_BQ76PL536_SEND_FRAME_SIZE+1];
  uint8_t spi_send_buffer[TI_BQ76PL536_SEND_FRAME_SIZE];

  uint8_t ti_bq76pl536_fault[BMS_HOST_NUMBER_OF_SLAVES];

  spi_send_buffer[1]= _TI_BQ76PL536_REG_ALERT_STATUS;
  spi_send_buffer[2] = 0x00;
  for(device_idx = 0; device_idx < BMS_HOST_NUMBER_OF_SLAVES; device_idx++){
    TI_BQ76PL536_broadcastReadRegister(ti_bq76pl536_fault, _TI_BQ76PL536_REG_FAULT_STATUS, 1);
    spi_send_buffer[0] = ((device_idx+1) << 1)|0x01;
    spi_send_buffer[3] = _TI_BQ76PL536_calcCRC(send_buffer, send_buffer, TI_BQ76PL536_SEND_FRAME_SIZE) ^ 0x01;
    spi_send_with_options(TI_BQ76PL536_ncsLineFromDevAddr[device_idx], spi_send_buffer, TI_BQ76PL536_SEND_FRAME_SIZE+1, false, false);
    TI_BQ76PL536_broadcastReadRegister(ti_bq76pl536_fault, _TI_BQ76PL536_REG_FAULT_STATUS, 1);
    result &= TI_BQ76PL536_slaveCrcErrorOccurred(device_idx+1, 1);
    TI_BQ76PL536_broadcastReadRegister(ti_bq76pl536_fault, _TI_BQ76PL536_REG_FAULT_STATUS, 1);
  }
  return result;
}


/*
 * Put all slaves into sleep mode.
 *
 * @param {uint} crc_retransmit_limit how often should we retry for each slave if we encounter a crc error.
 * @param {uint32_t} timeout the maximum time in milliseconds the devices are allowed to need for entering sleep mode.
 * @return {bool} true if all devices are in sleep mode, false if any error occurred.
 */
bool TI_BQ76PL536_enterSleepMode(uint crc_retransmit_limit, uint32_t timeout){
#ifdef BMS_USE_SLEEP_MODE
  //ToDo: check if fault or alert are set. (if so clear them, fault and alert lines draw current.)
  bool success = _TI_BQ76PL536_writeRegisterOnDeviceCheckCRC(
      _TI_BQ76PL536_BROADCAST_ADDRESS, _TI_BQ76PL536_REG_IO_CONTROL,
      _TI_BQ76PL536_REGVAL_IO_CONTROL_SLEEP, crc_retransmit_limit) == SPI_TRANSMISSION_OK;

  uint32_t time1 = HAL_GetTick();
  uint8_t alert_reg;
  bool all_devices_sleep;
  do{
    all_devices_sleep = true;
    int device_idx;
    for(device_idx = 0; device_idx < BMS_HOST_NUMBER_OF_SLAVES; device_idx++){
      if(_TI_BQ76PL536_readRegisterFromDevice(device_idx+1, _TI_BQ76PL536_REG_FAULT_STATUS,
            &alert_reg, crc_retransmit_limit)==SPI_TRANSMISSION_OK){
        all_devices_sleep &= _TI_BQ76PL536_IS_IN_SLEEP_MODE(alert_reg);
      }
      else{
        all_devices_sleep = false;
      }
    }
  }while(!all_devices_sleep && (HAL_GetTick() - time1) < timeout);
  success &= all_devices_sleep;
  success &= TI_BQ76PL536_clearError(_TI_BQ76PL536_BROADCAST_ADDRESS, _TI_BQ76PL536_REG_ALERT_STATUS, _TI_BQ76PL536_ALERT_MASK_SLEEP);
  return success;
#else
  return true;
#endif
}

/*
 * Wakeup all devices and wait the required time for them to stabilize.
 *
 * @param {uint} crc_retransmit_limit how often should we retry for each slave if we encounter a crc error.
 * @return {bool} true if transmission was successful.
 */
bool TI_BQ76PL536_wakeup(uint crc_retransmit_limit){
#ifdef BMS_USE_SLEEP_MODE
  int device_idx;
  bool success = true;
  for(device_idx = 0; device_idx < BMS_HOST_NUMBER_OF_SLAVES; device_idx++){
    success |= _TI_BQ76PL536_writeRegisterOnDeviceCheckCRC(
        device_idx+1, _TI_BQ76PL536_REG_IO_CONTROL,
        _TI_BQ76PL536_REGVAL_IO_CONTROL, crc_retransmit_limit) == SPI_TRANSMISSION_OK;
  }
  return success;
#else
  return true;
#endif
}

/**
 * Check if the slave device(s) in question detected a crc error in the last transmission.
 * (Assuming the crc bit has been reset befor the last transmission started.)
 *
 * If the device in question detected a CRC error, the error flag is cleared.
 * If device address is equal to the broadcast address, the error flag of all devices is cleared if any device has detected an error.
 * The clearing of the error flag is not checked. (It is assumed it worked.)
 *
 * @param {uint8_t} dev_address address of the device
 * @param {uint} crc_retransmit_limit the limit of how often we retransmit to get the fault register
 * @return {bool} returns true if no CRC error occurred. (If we have a transmission error, we assume a CRC error occurred)
 */
bool TI_BQ76PL536_slaveCrcErrorOccurred(uint8_t device_address, uint crc_retransmit_limit){
  if(!TI_BQ76PL536__FAULT_DETECTED){
    return 0;
  }
  bool crc_ok = 1;
  uint8_t fault_register;
  if(device_address != _TI_BQ76PL536_BROADCAST_ADDRESS){
    crc_ok &= _TI_BQ76PL536_readRegisterFromDevice(device_address, _TI_BQ76PL536_REG_FAULT_STATUS,
            &fault_register, crc_retransmit_limit) == SPI_TRANSMISSION_OK;
    crc_ok &= _TI_BQ76PL536_CRC_OK(fault_register);
    if(!crc_ok){
      TI_BQ76PL536_clearError(device_address, _TI_BQ76PL536_REG_FAULT_STATUS, _TI_BQ76PL536_FAULT_MASK_CRC);
    }
    return !crc_ok;
  }

  int device_idx;
  for(device_idx = 0; device_idx < BMS_HOST_NUMBER_OF_SLAVES; device_idx++){
    crc_ok &= _TI_BQ76PL536_readRegisterFromDevice(device_idx+1, _TI_BQ76PL536_REG_FAULT_STATUS,
        &fault_register, crc_retransmit_limit) == SPI_TRANSMISSION_OK;
    crc_ok &= _TI_BQ76PL536_CRC_OK(fault_register);
    if(!crc_ok){
      TI_BQ76PL536_clearError(_TI_BQ76PL536_BROADCAST_ADDRESS,
                _TI_BQ76PL536_REG_FAULT_STATUS, _TI_BQ76PL536_FAULT_MASK_CRC);
      break;
    }
  }
  return !crc_ok;
}
/**
 * Switch devices to measurement mode. (Turn on adc conversion)
 *
 * @param {uint} crc_retransmit_limit how often should we retry if any slave encounters a crc error
 * @return {bool} returns true if successful.
 */
bool TI_BQ76PL536_prepareDevicesForMeasurement(uint crc_retransmit_limit){
  bool success = 1;

  success &= _TI_BQ76PL536_writeRegisterOnDeviceCheckCRC(
      _TI_BQ76PL536_BROADCAST_ADDRESS, _TI_BQ76PL536_REG_ADC_CONV,
      0x01, crc_retransmit_limit) == SPI_TRANSMISSION_OK;

  return success;

}

/**
 * Read measurement data from a single device and store it in the datastructure provided.
 *
 * @param {uint8_t} dev_address address of the device to read
 * @param {TI_BQ76PL536_RawMeasurementData*} data valid pointer device data structure
 * @param {uint} crc_retransmit_limit how often should we retry if the slave encounters a crc error
 * @return {bool} returns true if successful.
 */
bool TI_BQ76PL536_readMeasurementData(uint8_t dev_address, TI_BQ76PL536_RawMeasurementData *data, uint crc_retransmit_limit){
  assert_param(data != NULL);
  SpiTransmissionState state;
  TI_BQ76PL536_StatusRegister status_register;
  state = _TI_BQ76PL536_readRegisterFromDevice(dev_address, _TI_BQ76PL536_REG_DEVICE_STATUS,
    (uint8_t*)(&status_register), crc_retransmit_limit);
  if(state != SPI_TRANSMISSION_OK){
    return false;
  }
  if(!status_register._drdy){
    return false;
  }
  uint8_t send_buffer[sizeof(TI_BQ76PL536_RawMeasurementData)];
  state = TI_BQ76PL536_readFromDevice(dev_address, _TI_BQ76PL536_REG_GPIO_MEASUREMENT, send_buffer,
      (uint8_t*)data, sizeof(TI_BQ76PL536_RawMeasurementData)-TI_BQ76PL536_SEND_FRAME_SIZE-1,
      crc_retransmit_limit);
  if(state != SPI_TRANSMISSION_OK){
    return false;
  }
  return true;
}

/**
 * Convert raw data of cell voltage register to voltage in mV
 *
 * @param {uint16_t*} adc_value valid pointer to adc raw data
 * @param {uint16_t*} cell_voltage valid pointer to result storage
 * @return {bool} returns true if Conversion is successful.
 */
bool TI_BQ76PL536_cellVoltageFromAdcValue(uint16_t *adc_value, uint16_t *cell_voltage){
  assert_param(adc_value != NULL);
  assert_param(cell_voltage != NULL);

  *cell_voltage = ((_TI_BQ76PL536_CONVERT_ENDIAN_16BIT(adc_value)*6250)/16383);
  return true;
}

/**
 * Convert raw data of pack voltage register to voltage in mV
 *
 * @param {uint16_t*} adc_value valid pointer to adc raw data
 * @param {uint16_t*} pack_voltage valid pointer to result storage
 * @return {bool} returns true if Conversion is successful.
 */
bool TI_BQ76PL536_packVoltageFromAdcValue(uint16_t *adc_value, uint16_t *pack_voltage){
  assert_param(adc_value != NULL);
  assert_param(pack_voltage != NULL);

  *pack_voltage = ((_TI_BQ76PL536_CONVERT_ENDIAN_16BIT(adc_value)*33333)/16383);
  return true;
}

/************************************************
 * get temperature value from adc value.
 *
 *       ⎛ K1 * Rm ⎞
 * Rth = ⎜‒‒‒‒‒‒‒‒‒⎟ - (Rs + Rm)
 *       ⎝   ADC   ⎠
 *
 *       ⎛           10                         ⎞
 *       ⎜‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒ - 10*T0⎟
 * T10 = ⎜ ⎛ 1 ⎞   ⎛ 1 ⎞      ⎛ Rth   ⎞         ⎟
 *       ⎜ ⎜‒‒‒⎟ + ⎜‒‒‒⎟ * ln ⎜‒‒‒‒‒‒‒⎟         ⎟
 *       ⎝ ⎝T25⎠   ⎝ B ⎠      ⎝ Rth25 ⎠         ⎠
 *
 ************************************************/
/**
* Convert raw data of temperature register to temperature in 1/10°C
*
* @param {uint16_t*} adc_value valid pointer to adc raw data
* @param {int16_t*} temperature valid pointer to result storage
* @return {bool} returns true if Conversion is successful.
*/
bool TI_BQ76PL536_tempertureFromAdcValue(uint16_t *adc_value, int16_t *temperature){
 assert_param(adc_value != NULL);
 assert_param(temperature != NULL);

 if(*adc_value == 0){
   // no sensor connected or communication error
   return false;
 }

 uint16_t _adc = _TI_BQ76PL536_CONVERT_ENDIAN_16BIT(adc_value);

 *temperature = ((int16_t)(10.0/((1.0/_25_CELSIUS) + (1.0/_TI_BQ76PL536_TS_NTC_B)*log(_TI_BQ76PL536_TS_Rth_over_Rth25(_adc))) - 10*_0_CELSIUS));
 return true;
}

/**
 * Set a register on all devices and verify that it has the correct value in all devices
 *
 * @param {uint8_t} reg the register to write
 * @param {uint8_t} value the value that should be written into the register
 * @param {unsigned int} crc_retransmit_limit defines the maximum number of retransmits after a crc error is detected.
 * @param {unsigned int} retry_limit defines the number of retries if the register of any device holds the wrong value
 * @param {bool} is_group3_reg tells the function if this register is protected
 * @return {bool} true on success, false if not successful
 */
bool _isGrp3Reg(uint8_t reg){
  return (reg & 0xF0) == 0x40;
}

bool TI_BQ76PL536_setRegisterControlled(uint8_t reg, uint8_t value,
    uint crc_retransmit_limit, unsigned int retry_limit){
  unsigned int num_retries = 0;
  do{
    if(_isGrp3Reg(reg)){
      if(_TI_BQ76PL536_enableGrp3Write(_TI_BQ76PL536_BROADCAST_ADDRESS) != SPI_TRANSMISSION_OK){
        continue;
      }
    }
    if(_TI_BQ76PL536_writeRegisterOnDeviceCheckCRC(_TI_BQ76PL536_BROADCAST_ADDRESS, reg, value, crc_retransmit_limit) != SPI_TRANSMISSION_OK){
      continue;
    }
    if(TI_BQ76PL536_registerEquals(reg, value, crc_retransmit_limit)){
      return true;
    }
  }while(++num_retries <= retry_limit);
  return false;
}

/**
 * Check if the register given has the expected value in all devices
 *
 * @param {uint8_t} reg the register to test
 * @param {uint8_t} value the value that is expected for the register
 * @param {unsigned int} crc_retransmit_limit defines the maximum number of retransmits after a crc error is detected.
 * @return {bool} true if all devices have the expected value in this register.
 */
bool TI_BQ76PL536_registerEquals(uint8_t reg, uint8_t expected_value, uint crc_retransmit_limit){
  uint8_t current_device;
  for(current_device = 1; current_device <= BMS_HOST_NUMBER_OF_SLAVES; current_device++){
    uint8_t register_value = 0;
    if(_TI_BQ76PL536_readRegisterFromDevice(current_device, reg, &register_value, crc_retransmit_limit) != SPI_TRANSMISSION_OK){
      return false;
    }
    if(register_value != expected_value){
      return false;
    }
  }
  return true;
}

// python generated lookup table
const uint8_t crc8_lookup_table[256] = {
  0x00, 0x07, 0x0e, 0x09, 0x1c, 0x1b, 0x12, 0x15, 0x38, 0x3f, 0x36, 0x31, 0x24, 0x23, 0x2a, 0x2d,
  0x70, 0x77, 0x7e, 0x79, 0x6c, 0x6b, 0x62, 0x65, 0x48, 0x4f, 0x46, 0x41, 0x54, 0x53, 0x5a, 0x5d,
  0xe0, 0xe7, 0xee, 0xe9, 0xfc, 0xfb, 0xf2, 0xf5, 0xd8, 0xdf, 0xd6, 0xd1, 0xc4, 0xc3, 0xca, 0xcd,
  0x90, 0x97, 0x9e, 0x99, 0x8c, 0x8b, 0x82, 0x85, 0xa8, 0xaf, 0xa6, 0xa1, 0xb4, 0xb3, 0xba, 0xbd,
  0xc7, 0xc0, 0xc9, 0xce, 0xdb, 0xdc, 0xd5, 0xd2, 0xff, 0xf8, 0xf1, 0xf6, 0xe3, 0xe4, 0xed, 0xea,
  0xb7, 0xb0, 0xb9, 0xbe, 0xab, 0xac, 0xa5, 0xa2, 0x8f, 0x88, 0x81, 0x86, 0x93, 0x94, 0x9d, 0x9a,
  0x27, 0x20, 0x29, 0x2e, 0x3b, 0x3c, 0x35, 0x32, 0x1f, 0x18, 0x11, 0x16, 0x03, 0x04, 0x0d, 0x0a,
  0x57, 0x50, 0x59, 0x5e, 0x4b, 0x4c, 0x45, 0x42, 0x6f, 0x68, 0x61, 0x66, 0x73, 0x74, 0x7d, 0x7a,
  0x89, 0x8e, 0x87, 0x80, 0x95, 0x92, 0x9b, 0x9c, 0xb1, 0xb6, 0xbf, 0xb8, 0xad, 0xaa, 0xa3, 0xa4,
  0xf9, 0xfe, 0xf7, 0xf0, 0xe5, 0xe2, 0xeb, 0xec, 0xc1, 0xc6, 0xcf, 0xc8, 0xdd, 0xda, 0xd3, 0xd4,
  0x69, 0x6e, 0x67, 0x60, 0x75, 0x72, 0x7b, 0x7c, 0x51, 0x56, 0x5f, 0x58, 0x4d, 0x4a, 0x43, 0x44,
  0x19, 0x1e, 0x17, 0x10, 0x05, 0x02, 0x0b, 0x0c, 0x21, 0x26, 0x2f, 0x28, 0x3d, 0x3a, 0x33, 0x34,
  0x4e, 0x49, 0x40, 0x47, 0x52, 0x55, 0x5c, 0x5b, 0x76, 0x71, 0x78, 0x7f, 0x6a, 0x6d, 0x64, 0x63,
  0x3e, 0x39, 0x30, 0x37, 0x22, 0x25, 0x2c, 0x2b, 0x06, 0x01, 0x08, 0x0f, 0x1a, 0x1d, 0x14, 0x13,
  0xae, 0xa9, 0xa0, 0xa7, 0xb2, 0xb5, 0xbc, 0xbb, 0x96, 0x91, 0x98, 0x9f, 0x8a, 0x8d, 0x84, 0x83,
  0xde, 0xd9, 0xd0, 0xd7, 0xc2, 0xc5, 0xcc, 0xcb, 0xe6, 0xe1, 0xe8, 0xef, 0xfa, 0xfd, 0xf4, 0xf3
};
/**
 * CRC-8 check for read packages.
 * We can not use the hardware support for read packages because
 * the ti chip creates the crc value in the following way:
 *    crc over the send header (device address field, register, length)
 *    crc over data (The answer)
 *
 * @param {uint8_t*} send_buffer a valid pointer to the buffer used for the data send to the device (address | register | length | placeholder[length+1] )
 * @param {uint8_t*} receive_buffer a valid pointer to the buffer used for the data received (placeholder[header_lenght] | data[length] | CRC value)
 * @param {uint8_t} buffer_size the size of the buffers
 * @return {uint8_t} the result of the crc calculation
 */
uint8_t _TI_BQ76PL536_calcCRC(uint8_t *send_buffer, uint8_t *receive_buffer, uint8_t buffer_size)
{
  assert_param(send_buffer != NULL);
  assert_param(receive_buffer != NULL);

  uint8_t crc = 0;
  for(uint8_t i = 0; i < buffer_size-1; i++)
  {
    uint8_t data;
    if(i < TI_BQ76PL536_SEND_FRAME_SIZE){
      data = send_buffer[i] ^ crc;
    }
    else{
      data = receive_buffer[i] ^ crc;
    }
    crc = crc8_lookup_table[data];
  }

  return crc;
}

/**
 * CRC-8 check for read packages.
 * We can not use the hardware support for read packages because
 * the ti chip creates the crc value in the following way:
 *    crc over the send header (device address field, register, length)
 *    crc over data (The answer)
 *
 * @param {uint8_t*} send_buffer a valid pointer to the buffer used for the data send to the device (address | register | length | placeholder[length+1] )
 * @param {uint8_t*} receive_buffer a valid pointer to the buffer used for the data received (placeholder[header_lenght] | data[length] | CRC value)
 * @param {uint8_t} buffer_size the size of the buffers
 * @return {bool} the result of the crc test. true if the crc calculated form the data is the same as the one received from the device.
 */
bool _TI_BQ76PL536_isCRCok(uint8_t *send_buffer, uint8_t *receive_buffer, uint8_t buffer_size)
{
  assert_param(send_buffer != NULL);
  assert_param(receive_buffer != NULL);
  return _TI_BQ76PL536_calcCRC(send_buffer, receive_buffer, buffer_size) == receive_buffer[buffer_size-1];
}

/**
 * Read a register from a ti bq76pl536
 *
 * @param {uint8_t} dev_address The address of the device we want read from
 * @param {uint8_t} reg the register to read
 * @param {uint8_t*} value valid pointer to result field
 * @param {unsigned int} crc_retransmit_limit defines the maximum number of retransmits after a crc error is detected.
 * @return {SpiTransmissionState} SPI_TRANSMISSION_OK on success, error code on failure
 */
SpiTransmissionState _TI_BQ76PL536_readRegisterFromDevice(uint8_t dev_address, uint8_t reg_address,
  uint8_t *value, uint crc_retransmit_limit){
  assert_param(value != NULL);

  uint8_t spi_send_buffer[TI_BQ76PL536_SEND_FRAME_SIZE + 2];
  spi_send_buffer[0] = (dev_address << 1);
  spi_send_buffer[1]= reg_address;
  spi_send_buffer[2] = 1;
  spi_send_buffer[3] = 0;
  spi_send_buffer[4] = 0;

  uint8_t spi_read_buffer[TI_BQ76PL536_SEND_FRAME_SIZE + 2];

  SpiTransmissionState state = TI_BQ76PL536_readFromDevice(dev_address, reg_address, spi_send_buffer, spi_read_buffer, 1, crc_retransmit_limit);
  *value = spi_read_buffer[3];
  return state;
}

/**
 * Read registers from a ti bq76pl536
 *
 * @param {uint8_t} dev_address The address of the device we want read from
 * @param {uint8_t} reg the first register to read
 * @param {uint8_t*} send_buffer valid pointer to a send buffer of the correct size
 * @param {uint8_t*} receive_buffer valid pointer to a receive buffer of the correct size
 * @param {uint8_t} len the number of registers to be read from the device (required buffer length: len + header_lenght + 1)
 * @param {unsigned int} crc_retransmit_limit defines the maximum number of retransmits after a crc error is detected.
 * @return {SpiTransmissionState} SPI_TRANSMISSION_OK on success, error code on failure
 */
SpiTransmissionState TI_BQ76PL536_readFromDevice(uint8_t dev_address, uint8_t reg_address, uint8_t *send_buffer,
    uint8_t *receive_buffer, uint8_t len, uint crc_retransmit_limit){
  assert_param(send_buffer != NULL);
  assert_param(receive_buffer != NULL);
  assert_param(_TI_BQ76PL536__IS_VALID_DEVICE_ADDRESS(dev_address));

  send_buffer[0] = (dev_address << 1);
  send_buffer[1]= reg_address;
  send_buffer[2] = len;
  int i;
  for(i = 0; i <= len; i++){
    send_buffer[i+TI_BQ76PL536_SEND_FRAME_SIZE] = 0;
  }

  unsigned int num_crc_retransmit = 0;
  do{
    SpiTransmissionState state = spi_read(TI_BQ76PL536_ncsLineFromDevAddr[dev_address-1],
        send_buffer, receive_buffer, TI_BQ76PL536_SEND_FRAME_SIZE + len + 1);
    if(state != SPI_TRANSMISSION_OK){
      return state;
    }
    if(_TI_BQ76PL536_isCRCok(send_buffer, receive_buffer, TI_BQ76PL536_SEND_FRAME_SIZE + len + 1)){
      return SPI_TRANSMISSION_OK;
    }
    num_crc_retransmit++;
  }while(num_crc_retransmit <= crc_retransmit_limit);

  return SPI_TRANSMISSION_ERROR_CRC;
}

/**
 * Write a register on one device or by giving the broadcast address write it on all devices
 * In addition to writing the register, we also check if the slave(s) detected a crc error.
 * If so we try to transmit again. (number of retries is given by crc_retransmit_limit)
 *
 * @param {uint8_t} dev_address The address of the device we want write to (broadcast address to write to all of them)
 * @param {uint8_t} reg the register to write
 * @param {uint8_t} value the value that should be written into the register
 * @param {unsigned int} crc_retransmit_limit the maximum number of retries if a CRC error occurred.
 * @return {SpiTransmissionState} SPI_TRANSMISSION_OK on success, error code on failure
 */

SpiTransmissionState _TI_BQ76PL536_writeRegisterOnDeviceCheckCRC(uint8_t dev_address, uint8_t reg_address
    , uint8_t value, uint crc_retransmit_limit){

  unsigned int num_crc_retransmit = 0;
  do{
    SpiTransmissionState state = _TI_BQ76PL536_writeRegisterOnDevice(dev_address, reg_address, value);
    if(state != SPI_TRANSMISSION_OK){
      return state;
    }
    if(!TI_BQ76PL536_slaveCrcErrorOccurred(dev_address, crc_retransmit_limit)){
      return SPI_TRANSMISSION_OK;
    }
    num_crc_retransmit++;
  }while(num_crc_retransmit <= crc_retransmit_limit);

  return SPI_TRANSMISSION_ERROR_CRC;
}

/**
 * Write a register on one device or by giving the broadcast address write it on all devices
 *
 * @param {uint8_t} dev_address The address of the device we want write to (broadcast address to write to all of them)
 * @param {uint8_t} reg the register to write
 * @param {uint8_t} value the value that should be written into the register
 * @return {SpiTransmissionState} SPI_TRANSMISSION_OK on success, error code on failure
 */
SpiTransmissionState _TI_BQ76PL536_writeRegisterOnDevice(uint8_t dev_address, uint8_t reg_address
    , uint8_t value){
  assert_param(_TI_BQ76PL536__IS_VALID_WRITE_ADDRESS(dev_address));

  uint8_t spi_send_buffer[TI_BQ76PL536_SEND_FRAME_SIZE];
  spi_send_buffer[0] = (dev_address << 1)|0x01;
  spi_send_buffer[1]= reg_address;
  spi_send_buffer[2] = value;

  if(dev_address != _TI_BQ76PL536_BROADCAST_ADDRESS){
    return spi_send(TI_BQ76PL536_ncsLineFromDevAddr[dev_address-1], spi_send_buffer, TI_BQ76PL536_SEND_FRAME_SIZE);

  }
  return _TI_BQ76PL536_writeBroadcast(spi_send_buffer);
}

/**
 * Write a register on all devices
 *
 * @param {uint8_t*} spi_send_buffer send buffer with correct values given.
 * @return {SpiTransmissionState} SPI_TRANSMISSION_OK on success, error code on failure
 */
SpiTransmissionState _TI_BQ76PL536_writeBroadcast(uint8_t *spi_send_buffer){
  uint8_t spi_line;
  SpiTransmissionState transmission_state;
  for(spi_line = 0; spi_line < BMS_HOST_NUMBER_OF_INTERFACES; spi_line++){
    transmission_state = spi_send(spi_line, spi_send_buffer, TI_BQ76PL536_SEND_FRAME_SIZE);
    if(transmission_state != SPI_TRANSMISSION_OK){
      return transmission_state;
    }
  }
  return SPI_TRANSMISSION_OK;
}

/**
 * Send the information needed to enable writing to protected registers
 *
 * @param {uint8_t} device_address the address of the device that should be unlocked (broadcast address to unlock all devices)
 * @return {SpiTransmissionState} SPI_TRANSMISSION_OK on success, error code on failure
 */
SpiTransmissionState _TI_BQ76PL536_enableGrp3Write(uint8_t device_address){
  return _TI_BQ76PL536_writeRegisterOnDevice(
      device_address,
      _TI_BQ76PL536_REG_SHDW_CTRL,
      _TI_BQ76PL536_GRP3_WRITE
      );
}

/**
 * Reset protected registers to the value given in the prom storage of the device
 *
 * @param {uint8_t} device_address the address of the device that should reset its registers (broadcast address to reset all devices)
 * @return {SpiTransmissionState} SPI_TRANSMISSION_OK on success, error code on failure
 */
SpiTransmissionState _TI_BQ76PL536_resetGrp3Regs(uint8_t device_address, uint crc_retransmit_limit){
  return _TI_BQ76PL536_writeRegisterOnDeviceCheckCRC(
      device_address,
      _TI_BQ76PL536_REG_SHDW_CTRL,
      _TI_BQ76PL536_GRP3_RESET,
      crc_retransmit_limit
      );
}

/**
 * Set device address of unaddressed device
 *
 * @param {uint8_t} device_address the new address for the unaddressed device
 * @return {bool} true on success
 */
bool _TI_BQ76PL536_setDeviceAddress(uint8_t dev_address){
  assert_param(_TI_BQ76PL536__IS_VALID_DEVICE_ADDRESS(dev_address));

  uint8_t spi_send_buffer[TI_BQ76PL536_SEND_FRAME_SIZE];
  spi_send_buffer[0] = 0x01;
  spi_send_buffer[1]= _TI_BQ76PL536_REG_ADDRESS_CONTROL;
  spi_send_buffer[2] = dev_address;

  if(spi_send_with_options(TI_BQ76PL536_ncsLineFromDevAddr[dev_address-1], spi_send_buffer, TI_BQ76PL536_SEND_FRAME_SIZE, true, false) != SPI_TRANSMISSION_OK){
    return false;
  }

  return TI_BQ76PL536_isDeviceOnBus(dev_address);
}

/**
 * Check if the device with the given address is on the bus
 *
 * @param {uint8_t} device_address the address of the device to check
 * @return {bool} true if device is on the bus
 */
bool TI_BQ76PL536_isDeviceOnBus(uint8_t dev_address){
  uint8_t addr_reg;
  if(_TI_BQ76PL536_readRegisterFromDevice(dev_address, _TI_BQ76PL536_REG_ADDRESS_CONTROL, &addr_reg, 0) != SPI_TRANSMISSION_OK){
    return false;
  }
  return (addr_reg & 0x7F) == dev_address;
}

/**
 * Check if all devices are reachable
 *
 * @param {uint32_t*} active_members a valid pointer to the field where debug information should be stored or NULL if no debug information should be generated.
 * @return {bool} true if all devices are reachable
 */
bool TI_BQ76PL536_isDaisychainOk(uint32_t *active_members){
  bool is_ok = true;
  uint32_t mask = 0x01;
  if(active_members != NULL)
    *active_members = 0;

  uint8_t dev_address;
  for(dev_address = 0x01;
      dev_address <= BMS_HOST_NUMBER_OF_SLAVES;
      dev_address++){
    if(TI_BQ76PL536_isDeviceOnBus(dev_address)){
      if(active_members != NULL)
        *active_members |= mask;
      }
    else{
      is_ok = false;
    }
    mask<<=1;
  }
  return is_ok;
}

/**
 * Reset all devices on a given spi line
 *
 * @param {uint8_t} line the spi line
 * @return {SpiTransmissionState} SPI_TRANSMISSION_OK on success, error code on failure
 */
SpiTransmissionState _TI_BQ76PL536_slaveResetDevicesOnLine(uint8_t line){
  uint8_t spi_send_buffer[TI_BQ76PL536_SEND_FRAME_SIZE];
  spi_send_buffer[0] = (_TI_BQ76PL536_BROADCAST_ADDRESS << 1)|0x01;
  spi_send_buffer[1]= _TI_BQ76PL536_REG_RESET;
  spi_send_buffer[2] = _TI_BQ76PL536_RESET_VALUE;

  return spi_send(line, spi_send_buffer, TI_BQ76PL536_SEND_FRAME_SIZE);
}
