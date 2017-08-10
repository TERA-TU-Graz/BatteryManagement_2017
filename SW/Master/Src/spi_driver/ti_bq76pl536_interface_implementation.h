/*
 * ti_bq76pl536_interface_implementation.h
 *
 * Implementation details for interface to texas instruments 76bq536 battery measurement and balancing chip.
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */

 #include "ti_bq76pl536_interface.h"

 #include "../battery.h"
 #include <stddef.h>
 #include <math.h>
 #include <stm32f4xx_hal_conf.h>

#ifndef SRC_TI_BQ76PL536_INTERFACE_IMPLEMENTATION_H_
#define SRC_TI_BQ76PL536_INTERFACE_IMPLEMENTATION_H_

#define TIMEOUT_ENTER_SLEEP_MODE 10

/*******************************************************
 * Slave Register
 *******************************************************/
#define _TI_BQ76PL536_REG_DEVICE_STATUS 0x00
#define _TI_BQ76PL536_REG_GPIO_MEASUREMENT 0x01
#define _TI_BQ76PL536_REG_VOLTAGE_MEASURMENT 0x03
#define _TI_BQ76PL536_REG_TEMP_1 0x0f
#define _TI_BQ76PL536_REG_TEMP_2 0x11
#define _TI_BQ76PL536_REG_ALERT_STATUS 0x20
#define _TI_BQ76PL536_REG_FAULT_STATUS 0x21
#define _TI_BQ76PL536_REG_COV_FAULT 0x22
#define _TI_BQ76PL536_REG_CUV_FAULT 0x23
#define _TI_BQ76PL536_REG_ADC_CONTROL 0x30
#define _TI_BQ76PL536_REG_IO_CONTROL 0x31
#define _TI_BQ76PL536_REG_CB_CRTL 0x32
#define _TI_BQ76PL536_REG_CB_TIME 0x33
#define _TI_BQ76PL536_REG_ADC_CONV 0x34
#define _TI_BQ76PL536_REG_SHDW_CTRL 0x3a
#define _TI_BQ76PL536_REG_ADDRESS_CONTROL 0x3b
#define _TI_BQ76PL536_REG_RESET 0x3c
#define _TI_BQ76PL536_REG_FUNCTION_CONFIG 0x40
#define _TI_BQ76PL536_REG_IO_CONFIG 0x41
#define _TI_BQ76PL536_REG_CONFIG_COV 0x42
#define _TI_BQ76PL536_REG_CONFIG_COVT 0x43
#define _TI_BQ76PL536_REG_CONFIG_CUV 0x44
#define _TI_BQ76PL536_REG_CONFIG_CUVT 0x45
#define _TI_BQ76PL536_REG_CONFIG_OT 0x46
#define _TI_BQ76PL536_REG_CONFIG_OTT 0x47

#define _TI_BQ76PL536_GRP3_WRITE 0x35
#define _TI_BQ76PL536_GRP3_RESET 0x27

#define _TI_BQ76PL536_BROADCAST_ADDRESS 0x3f
#define _TI_BQ76PL536_INIT_ADDRESS 0x00

#define _TI_BQ76PL536_RESET_VALUE 0xa5

/*******************************
 * Value = ((Umax + 200mV) - 2000mV)/50mV (2V <= Umax <= 5V)
 *******************************/
#define _TI_BQ76PL536_REGVAL_OVER_VOLTAGE ((BMS_CELL_END_OF_CHARGE_VOLTAGE-1700)/50)

/*******************************
 * Value = (Umin - 700mV)/100mV (0,7V <= Umin <= 3,3V)
 *******************************/
#define _TI_BQ76PL536_REGVAL_UNDER_VOLTAGE ((BMS_CELL_CUT_OFF_VOLTAGE-700)/100)

/*******************************
 * (Unit: 0x80 = ms; 0x00 = us)
 * Value = (delay/100)|Unit  (0ms <= delay <= 3100ms)
 *       = (2000ms/100ms)|0x80 = 148
 *******************************/
#define _TI_BQ76PL536_REGVAL_VOLTAGE_DELAY 148

/*******************************
 * | OT2[4] | OT1[4] |
 * Datasheet page 21,22 (table 2)
 *
 * Value = 0: Disabled
 * Value = (Tnom - 40°C)/5°C + 1 (40°C <= Tnom <= 90°C)
 * Reg = Value<<4 + Value
 *******************************/
#define _TI_BQ76PL536_REGVAL_OTVal ((BMS_CELL_MAXTEMP-400)/50+1)
#define _TI_BQ76PL536_REGVAL_OVER_TEMP ((_TI_BQ76PL536_REGVAL_OTVal<<4) + _TI_BQ76PL536_REGVAL_OTVal)

/*******************************
 * Value = (delay/10)  (0ms <= delay <= 2550ms)
 *       = (2000ms/10ms) = 200
 *******************************/
#define _TI_BQ76PL536_REGVAL_TEMP_DELAY 200

/*******************************
 * | 0 |ADC_ON||TS2|TS1|GPAI|Cells(3)|
 * Chosen: ADC Auto Mode: ADC_ON = 0
 *         TS1 and TS2 = 1
 *         GPAI = 1
 *         6 Cells: #Cells -1
 *
 *         (0011 1000 | (#Cells-1))
 *******************************/
//#define _TI_BQ76PL536_REGVAL_ADC_CONTROL (0x38 | (BMS_CELLS_PER_SLAVE-1))
#define _TI_BQ76PL536_REGVAL_ADC_CONTROL (0x78 | (BMS_CELLS_PER_SLAVE-1))


/*******************************
 * |AUX|OUT|IN|0|0|SLEEP|TS2|TS1|
 * Chosen: all 0
 *         except TS2 and TS1 = 1
 *
 *         0000 0011
 *******************************/
#define _TI_BQ76PL536_REGVAL_IO_CONTROL 0x03
#define _TI_BQ76PL536_REGVAL_IO_CONTROL_SLEEP 0x04

/*******************************
 * |ADCT(2)|GPAI_REF|GPAI_SRC|CN(2)|0|0|
 * ADCT: Conversion Time [us]
 *       0=3; 1=6(Recommended); 2=12;3=24
 * GPAI_REF: Internal Band Gap(0), Vreg50(1)
 * GPAI_SRC: GPIO(0), VBat(1)
 * CN: 6-CN cells
 *
 * Chosen: ADCT: 1(6us)
 *         GPAI_REF: 0(Ignored)
 *         GPAI_SRC: 1(VBat)
 *         CN: 0(6 cells)
 *
 *         0101 0000
 *******************************/
#define _TI_BQ76PL536_REGVAL_FUNCTION_CONTROL 0x50

/*******************************
 * |sec/min|0|Time(5)|
 *
 * chosen: seconds (0)
 * time: 30sec.
 * value: 30
 *******************************/
#define _TI_BQ76PL536_REGVAL_CB_TIME 30



#define _TI_BQ76PL536_CONVERT_ENDIAN_16BIT(x) ((((uint8_t*)x)[0]<<8) + ((uint8_t*)x)[1])
#define _TI_BQ76PL536__IS_VALID_WRITE_ADDRESS(address) ((address > 0 && address <= BMS_HOST_NUMBER_OF_SLAVES) || address == _TI_BQ76PL536_BROADCAST_ADDRESS)
#define _TI_BQ76PL536__IS_VALID_DEVICE_ADDRESS(address) (address > 0 && address <= BMS_HOST_NUMBER_OF_SLAVES)

/*******************************************************
 * Temperature Sensor
 *
 * K1=33104; B=3380;
 * Rth25=10k; Rs=1,47k; Rm=1,82k;
 * T25=298,15; T0=273,15
 *******************************************************/
#define _TI_BQ76PL536_TS_NTC_B (3984.0)
#define _TI_BQ76PL536_TS_K1 (33104.0)
#define _TI_BQ76PL536_TS_NTC_Rth25 (10e3)
#define _TI_BQ76PL536_TS_Rs (1.47e3)
#define _TI_BQ76PL536_TS_Rm (1.82e3)
#define _0_CELSIUS (273.15)
#define _25_CELSIUS (298.15)

#define _TI_BQ76PL536_TS_K1xRm (_TI_BQ76PL536_TS_K1*_TI_BQ76PL536_TS_Rm)
#define _TI_BQ76PL536_TS_Rs_p_Rm (_TI_BQ76PL536_TS_Rs+_TI_BQ76PL536_TS_Rm)
#define _TI_BQ76PL536_TS_Rth(adc_value) (((_TI_BQ76PL536_TS_K1xRm)/adc_value) - _TI_BQ76PL536_TS_Rs_p_Rm)
#define _TI_BQ76PL536_TS_Rth_over_Rth25(adc_value) (_TI_BQ76PL536_TS_Rth(adc_value)/_TI_BQ76PL536_TS_NTC_Rth25)

//######################################################################################################

#define _TI_BQ76PL536_FAULT_MASK_OVER_VOLTAGE 0x01
#define _TI_BQ76PL536_FAULT_MASK_UNDER_VOLTAGE 0x02

#define _TI_BQ76PL536_CELL_VOLTAGE_FAULT(fault_reg) \
  (fault_reg & (_TI_BQ76PL536_FAULT_MASK_OVER_VOLTAGE | _TI_BQ76PL536_FAULT_MASK_UNDER_VOLTAGE) != 0x00)

#define _TI_BQ76PL536_FAULT_MASK_CRC 0x04
#define _TI_BQ76PL536_CRC_OK(fault_reg) ((fault_reg & _TI_BQ76PL536_FAULT_MASK_CRC) == 0x00)

#define _TI_BQ76PL536_FAULT_MASK_POR 0x08
#define _TI_BQ76PL536_FAULT_MASK_FORCE_FAULT 0x10
#define _TI_BQ76PL536_FAULT_MASK_INTERNAL_FAULT 0x20

//######################################################################################################

#define _TI_BQ76PL536_ALERT_MASK_OVER_TEMP1 0x01
#define _TI_BQ76PL536_ALERT_MASK_OVER_TEMP2 0x02

#define _TI_BQ76PL536_OVER_TEMP(alert_reg) \
  (alert_reg & (_TI_BQ76PL536_ALERT_MASK_OVER_TEMP1 | _TI_BQ76PL536_ALERT_MASK_OVER_TEMP2) != 0x00)

#define _TI_BQ76PL536_ALERT_MASK_SLEEP 0x04
#define _TI_BQ76PL536_IS_IN_SLEEP_MODE(alert_reg) ((alert_reg & _TI_BQ76PL536_ALERT_MASK_SLEEP) == _TI_BQ76PL536_ALERT_MASK_SLEEP)

#define _TI_BQ76PL536_ALERT_MASK_THERMAL_SHUTDOWN 0x08


#define _TI_BQ76PL536_ALERT_MASK_FORCE_ALERT 0x10

#define _TI_BQ76PL536_ALERT_MASK_EPROM_ERROR 0x20
#define _TI_BQ76PL536_ALERT_MASK_GRP3_INVALID 0x40
#define _TI_BQ76PL536_ALERT_MASK_ADDRESS_INVALID 0x80

//######################################################################################################

SpiTransmissionState _TI_BQ76PL536_enableGrp3Write(uint8_t device_address);
SpiTransmissionState _TI_BQ76PL536_resetGrp3Regs(uint8_t device_address, uint crc_retransmit_limit);

SpiTransmissionState _TI_BQ76PL536_writeRegisterOnDeviceCheckCRC(uint8_t dev_address, uint8_t reg_address
    , uint8_t value, uint crc_retransmit_limit);
SpiTransmissionState _TI_BQ76PL536_writeRegisterOnDevice(uint8_t dev_address, uint8_t reg_address
    , uint8_t value);
SpiTransmissionState _TI_BQ76PL536_writeBroadcast(uint8_t *spi_send_buffer);
SpiTransmissionState _TI_BQ76PL536_slaveResetDevicesOnLine(uint8_t line);

SpiTransmissionState _TI_BQ76PL536_readRegisterFromDevice(uint8_t dev_address, uint8_t reg_address, uint8_t *value,
    uint crc_retransmit_limit);
bool _TI_BQ76PL536_setDeviceAddress(uint8_t dev_address);
SpiTransmissionState _TI_BQ76PL536_slaveResetDevicesOnLine(uint8_t line);

bool _TI_BQ76PL536_isCRCok(uint8_t *send_buffer, uint8_t *receive_buffer, uint8_t buffer_size);
uint8_t _TI_BQ76PL536_calcCRC(uint8_t *send_buffer, uint8_t *receive_buffer, uint8_t buffer_size);

extern uint8_t TI_BQ76PL536_ncsLineFromDevAddr[BMS_HOST_NUMBER_OF_SLAVES];

#endif /* SRC_TI_BQ76PL536_INTERFACE_IMPLEMENTATION_H_ */
