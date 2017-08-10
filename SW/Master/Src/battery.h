/*
 * battery.h
 *
 * Battery definition
 *
 * Copyright 2017 Pöschl Rene Copyright and related rights are licensed under the Solderpad Hardware License,
 * Version 0.51 (the “License”); you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at http://solderpad.org/licenses/SHL-0.51.
 * Unless required by applicable law or agreed to in writing, software,
 * hardware and materials distributed under this License is distributed on an “AS IS” BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the License.
 */


#ifndef BATTERY_H_
#define BATTERY_H_

#include "board_cfg.h"
#include "system_setup.h"

#define BMS_NUMBER_TEMP_INTERFACES_PER_SLAVE 2

/*************************************************************
 *Test Battery: 6s1p
 *************************************************************/
#ifdef BATTERY_18650B_6S_1P
  #define BATTERY_TYPE_18650B

  #define BMS_HOST_NUMBER_OF_SLAVES 1
  #define BMS_CELLS_PARALLEL 1

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 5000 //(a little less than 2*C)

  #define BMS_TEMPERATURE_SENSORS_USED {{0,0}}
  #define BMS_NUMBER_TEMPERATURE_SENSORS 0

  #define BMS_HOST_NUMBER_OF_INTERFACES 1
  #define BMS_NCS_LINE_SETUP { \
       BMS_SPI_LINE_HOST1\
    }
#endif //BATTERY_18650A_6S_1P

/*************************************************************
 *Test Battery: 12s1p
 *************************************************************/
#ifdef BATTERY_18650B_12S_1P
  #define BATTERY_TYPE_18650B

  #define BMS_HOST_NUMBER_OF_SLAVES 2
  #define BMS_CELLS_PARALLEL 1

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 5000 //(a little less than 2*C)

  #define BMS_TEMPERATURE_SENSORS_USED {{0,0},{0,0}}
  #define BMS_NUMBER_TEMPERATURE_SENSORS 0

  #define BMS_HOST_NUMBER_OF_INTERFACES 1
  #define BMS_NCS_LINE_SETUP { \
       BMS_SPI_LINE_HOST1,BMS_SPI_LINE_HOST1\
    }
#endif //BATTERY_18650B_12S_1P

/*************************************************************
 *Test Battery: 12s1p
 *************************************************************/
#ifdef BATTERY_AccuPower_12S_1P_Fennek2013
  #define BATTERY_TYPE_AccuPower2013

  #define BMS_HOST_NUMBER_OF_SLAVES 2
  #define BMS_CELLS_PARALLEL 1

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 20000 //20A fuse (This is peak current)

  #define BMS_TEMPERATURE_SENSORS_USED {{1,0},{0,1}}
  #define BMS_NUMBER_TEMPERATURE_SENSORS 2

  #define BMS_HOST_NUMBER_OF_INTERFACES 1
  #define BMS_NCS_LINE_SETUP { \
       BMS_SPI_LINE_HOST1,BMS_SPI_LINE_HOST1\
    }
#endif //BATTERY_AccuPower_12S_1P_Fennek2013

/*************************************************************
 *Test Battery: 108s1p 3 SPI Lines
 *************************************************************/
#ifdef BATTERY_18650A_108S_1P_3Lines
  #define BATTERY_TYPE_18650A

  #define BMS_HOST_NUMBER_OF_SLAVES 18
  #define BMS_CELLS_PARALLEL 1

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 5000 //(a little less than 2*C)

  // We have 6 sensors in this battery. Simply use the first devices of the lines to measure it
  #define BMS_TEMPERATURE_SENSORS_USED { \
    {1,1},{0,0},{0,0},{0,0},{0,0},{0,0},\
    {1,1},{0,0},{0,0},{0,0},{0,0},{0,0},\
    {1,1},{0,0},{0,0},{0,0},{0,0},{0,0}\
  }
  #define BMS_NUMBER_TEMPERATURE_SENSORS 6

  #define BMS_HOST_NUMBER_OF_INTERFACES 3
  #define BMS_NCS_LINE_SETUP { \
     BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1,\
     BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2,\
     BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3\
  }
#endif //BATTERY_18650A_108S_1P_3Lines

/*************************************************************
 *Test Battery: 108s1p 4 SPI Lines
 *************************************************************/
#ifdef BATTERY_18650A_108S_1P_4Lines
  #define BATTERY_TYPE_18650A

  #define BMS_HOST_NUMBER_OF_SLAVES 18
  #define BMS_CELLS_PARALLEL 1

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 5000 //(a little less than 2*C)

  // We have 6 sensors in this battery. Simply use the first devices of the first 3 lines to measure it
  #define BMS_TEMPERATURE_SENSORS_USED { \
    {1,1},{0,0},{0,0},{0,0},{0,0},\
    {1,1},{0,0},{0,0},{0,0},\
    {1,1},{0,0},{0,0},{0,0},{0,0},\
    {0,0},{0,0},{0,0},{0,0}\
  }
  #define BMS_NUMBER_TEMPERATURE_SENSORS 6

  #define BMS_HOST_NUMBER_OF_INTERFACES 4
  #define BMS_NCS_LINE_SETUP { \
     BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1,\
     BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2,\
     BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3,\
     BMS_SPI_LINE_HOST4, BMS_SPI_LINE_HOST4, BMS_SPI_LINE_HOST4, BMS_SPI_LINE_HOST4\
  };
#endif //BATTERY_18650A_108S_1P_4Lines

/*************************************************************
 *Test Battery: 36s1p
 *************************************************************/
#ifdef BATTERY_18650A_36S_1P
  #define BATTERY_TYPE_18650A

  #define BMS_HOST_NUMBER_OF_SLAVES 6
  #define BMS_CELLS_PARALLEL 1

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 5000 //(a little less than 2*C)

  #define BMS_TEMPERATURE_SENSORS_USED { \
    {1,1},{0,0},{0,0},\
    {1,1},{0,0},{0,0}\
  }
  #define BMS_NUMBER_TEMPERATURE_SENSORS 4

  #define BMS_HOST_NUMBER_OF_INTERFACES 2
  #define BMS_NCS_LINE_SETUP { \
       BMS_SPI_LINE_HOST1,BMS_SPI_LINE_HOST1,BMS_SPI_LINE_HOST1,\
       BMS_SPI_LINE_HOST2,BMS_SPI_LINE_HOST2,BMS_SPI_LINE_HOST2\
    }
#endif //BATTERY_18650A_36S_1P

/*************************************************************
 *Test Battery: 18s1p (CHARGING WITH LAB POWER SUPPLYS
 *************************************************************/
#ifdef BATTERY_18650A_18S_1P
  #define BATTERY_TYPE_18650A

  #define BMS_HOST_NUMBER_OF_SLAVES 3
  #define BMS_CELLS_PARALLEL 1

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 5000 //(a little less than 2*C)

  #define BMS_TEMPERATURE_SENSORS_USED { \
    {1,1},{0,0},{0,0}\
  }
  #define BMS_NUMBER_TEMPERATURE_SENSORS 2

  #define BMS_HOST_NUMBER_OF_INTERFACES 1
  #define BMS_NCS_LINE_SETUP { \
           BMS_SPI_LINE_HOST1,BMS_SPI_LINE_HOST1,BMS_SPI_LINE_HOST1\
        };
#endif //BATTERY_18650A_108S_1P

/*************************************************************
 *Ibex Battery 2014: 108s20p 3 SPI Lines
 *************************************************************/
#ifdef BATTERY_18650A_108S_20P_3Lines
  #define BATTERY_TYPE_18650A

  #define BMS_HOST_NUMBER_OF_SLAVES 18
  #define BMS_CELLS_PARALLEL 20

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 100000 //(100A Fuse)

  #define BMS_TEMPERATURE_SENSORS_USED { \
    {1,1},{1,1},{1,1},{1,1},{1,1},{1,1},\
    {1,1},{1,1},{1,1},{1,1},{1,1},{1,1},\
    {1,1},{1,1},{1,1},{1,1},{1,1},{1,1}\
  }
  #define BMS_NUMBER_TEMPERATURE_SENSORS (BMS_HOST_NUMBER_OF_SLAVES*2)

  #define BMS_HOST_NUMBER_OF_INTERFACES 3
  #define BMS_NCS_LINE_SETUP { \
     BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1,\
     BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2,\
     BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3\
  };
#endif //BATTERY_18650A_108S_20P_3Lines

/*************************************************************
 *Ibex Battery 2014: 108s20p 4 SPI Lines
 *************************************************************/
#ifdef BATTERY_18650A_108S_20P_4Lines
  #define BATTERY_TYPE_18650A

  #define BMS_HOST_NUMBER_OF_SLAVES 18
  #define BMS_CELLS_PARALLEL 20

  #define BMS_CELLS_PER_SLAVE 6

  #define BMS_MAX_CURRENT 100000 //(100A Fuse)

  #define BMS_TEMPERATURE_SENSORS_USED { \
    {1,1},{1,1},{1,1},{1,1},{1,1},\
    {1,1},{1,1},{1,1},{1,1},\
    {1,1},{1,1},{1,1},{1,1},{1,1},\
    {1,1},{1,1},{1,1},{1,1}\
  }
  #define BMS_NUMBER_TEMPERATURE_SENSORS (BMS_HOST_NUMBER_OF_SLAVES*2)

  #define BMS_HOST_NUMBER_OF_INTERFACES 4
  #define BMS_NCS_LINE_SETUP { \
     BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1, BMS_SPI_LINE_HOST1,\
     BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2, BMS_SPI_LINE_HOST2,\
     BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3, BMS_SPI_LINE_HOST3,\
     BMS_SPI_LINE_HOST4, BMS_SPI_LINE_HOST4, BMS_SPI_LINE_HOST4, BMS_SPI_LINE_HOST4\
  };
#endif //BATTERY_18650A_108S_20P_4Lines

/*************************************************************
 *Cell Panasonic NCR 18650A
 *
 *Voltages in mV, Current in mA, Capacity in mAh
 *************************************************************/
#ifdef BATTERY_TYPE_18650A
  #define BMS_CELL_END_OF_CHARGE_VOLTAGE 4200
  #define BMS_CELL_CUT_OFF_VOLTAGE 2750
  #define BMS_CELL_VOLTAGE_REDUCED_CURRENT 2950

  #define BMS_CELL_CAPACITY_mAh 3100

  #define BMS_CELL_R_INT_FULLY_CHARGED 33
  #define BMS_CELL_R_INT_EMPTY 33

  #define BMS_CELL_REMAINING_CAP_mAh(cell_voltage) (0)

  #define BMS_CELL_MAXTEMP 600
  #define BMS_CELL_MINTEMP -100

  #define BMS_CELL_MAXTEMP_CHARGE 600
  #define BMS_CELL_MINTEMP_CHARGE 100
#endif //BATTERY_TYPE_18650A

/*************************************************************
 *Cell Panasonic NCR 18650B
 *
 *Voltages in mV, Current in mA, Capacity in mAh
 *************************************************************/
#ifdef BATTERY_TYPE_18650B
  #define BMS_CELL_END_OF_CHARGE_VOLTAGE 4200
  #define BMS_CELL_CUT_OFF_VOLTAGE 2750
  #define BMS_CELL_VOLTAGE_REDUCED_CURRENT 2950

  #define BMS_CELL_CAPACITY_mAh 3900

  #define BMS_CELL_R_INT_FULLY_CHARGED 33
  #define BMS_CELL_R_INT_EMPTY 33


  #define BMS_CELL_REMAINING_CAP_mAh(cell_voltage) (0)

  #define BMS_CELL_MAXTEMP 600
  #define BMS_CELL_MINTEMP -100

  #define BMS_CELL_MAXTEMP_CHARGE 600
  #define BMS_CELL_MINTEMP_CHARGE 100
#endif //BATTERY_TYPE_18650B

/*************************************************************
 *Cell AccuPower 1.3Ah
 *
 *Voltages in mV, Current in mA, Capacity in mAh
 *************************************************************/
#ifdef BATTERY_TYPE_AccuPower2013
  #define BMS_CELL_END_OF_CHARGE_VOLTAGE 4200
  #define BMS_CELL_CUT_OFF_VOLTAGE 3200
  #define BMS_CELL_VOLTAGE_REDUCED_CURRENT 10000

  #define BMS_CELL_CAPACITY_mAh 1300
  //Measured with our charger. Battery Nr. 2 Mean over all 12 cells. Discharge cycle.
  #define BMS_CELL_R_INT_FULLY_CHARGED 230
  #define BMS_CELL_R_INT_EMPTY 135

  #define BMS_CELL_REMAINING_CAP_mAh(cell_voltage) ((4.635651e-06*(cell_voltage)*(cell_voltage)*(cell_voltage)\
    -5.798387e-02*(cell_voltage)*(cell_voltage)+2.428305e+02*(cell_voltage)-3.392241e+05))

  #define BMS_CELL_MAXTEMP 600
  #define BMS_CELL_MINTEMP -200

  #define BMS_CELL_MINTEMP_CHARGE 0
  #define BMS_CELL_MAXTEMP_CHARGE 450
#endif //BATTERY_TYPE_AccuPower2013

#define BMS_REDUCED_CURRENT ((BMS_MAX_CURRENT*5)/10)

#define BMS_mAh_TO_uAmS(value) ((value)*3600000000)

//Maximum Charging Current is 0,3C of Battery
#ifndef BMS_WITH_TEST_BENCH
#define BMS_MAX_CHARGING_CURRENT ((BMS_CELL_CAPACITY_mAh*BMS_CELLS_PARALLEL*3)/10)
#else
//At testbench we do not care about faster cell aging. We want to see what happens if we charge with higher currents.
#define BMS_MAX_CHARGING_CURRENT (BMS_CELL_CAPACITY_mAh*BMS_CELLS_PARALLEL + 500)
#endif

#define BMS_END_OF_CHARGE_VOLTAGE (BMS_CELL_END_OF_CHARGE_VOLTAGE*BMS_HOST_NUMBER_OF_SLAVES*BMS_CELLS_PER_SLAVE)
#endif /* BATTERY_H_ */
