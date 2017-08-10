EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ft232rl
LIBS:relais
LIBS:Supply
LIBS:tera_general
LIBS:tera_switches
LIBS:BMS_Master_V5_kicad-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 16
Title ""
Date ""
Rev ""
Comp "TERA TU Graz"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5600 1400 850  1300
U 56F600A4
F0 "CAN1" 60
F1 "CAN.sch" 60
F2 "CAN_supply" I L 5600 1500 60 
F3 "Rs(Mode)" I L 5600 2400 60 
F4 "CAN_RX" O L 5600 1700 60 
F5 "CAN_TX" I L 5600 1850 60 
F6 "GND" I L 5600 2600 60 
F7 "CAN+" B L 5600 2050 60 
F8 "CAN-" B L 5600 2200 60 
$EndSheet
$Sheet
S 5600 3200 850  1100
U 56F5B634
F0 "CAN2" 60
F1 "CAN.sch" 60
F2 "CAN_supply" I L 5600 3300 60 
F3 "Rs(Mode)" I L 5600 3900 60 
F4 "CAN_RX" O L 5600 3500 60 
F5 "CAN_TX" I L 5600 3650 60 
F6 "GND" I L 5600 4150 60 
F7 "CAN+" B R 6450 3500 60 
F8 "CAN-" B R 6450 3650 60 
$EndSheet
$Comp
L Jumper_NO_Small JP5
U 1 1 56F5DB08
P 5350 2050
F 0 "JP5" H 5350 2100 39  0000 C CNN
F 1 "Jumper_NO_Small" H 5360 1990 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2" H 5350 2050 50  0001 C CNN
F 3 "" H 5350 2050 50  0000 C CNN
	1    5350 2050
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP6
U 1 1 56F5DBBC
P 5350 2200
F 0 "JP6" H 5350 2250 39  0000 C CNN
F 1 "Jumper_NO_Small" H 5360 2140 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2" H 5350 2200 50  0001 C CNN
F 3 "" H 5350 2200 50  0000 C CNN
	1    5350 2200
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP4
U 1 1 56F5DC2C
P 5350 1500
F 0 "JP4" H 5350 1550 50  0000 C CNN
F 1 "Jumper_NO_Small" H 5360 1440 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2" H 5350 1500 50  0001 C CNN
F 3 "" H 5350 1500 50  0000 C CNN
	1    5350 1500
	1    0    0    -1  
$EndComp
Text HLabel 5600 1700 0    60   Output ~ 0
CAN1_RX
Text HLabel 5600 1850 0    60   Input ~ 0
CAN1_TX
Text HLabel 5250 2050 0    60   BiDi ~ 0
CAN1+
Text HLabel 5250 2200 0    60   BiDi ~ 0
CAN1-
Wire Wire Line
	5450 2050 5600 2050
Wire Wire Line
	5450 2200 5600 2200
Text HLabel 5600 2400 0    60   Input ~ 0
CAN1_RS(Mode)
Text HLabel 5600 3500 0    60   Output ~ 0
CAN2_RX
Text HLabel 5600 3650 0    60   Input ~ 0
CAN2_TX
Text HLabel 5600 3900 0    60   Input ~ 0
CAN2_RS(Mode)
Wire Wire Line
	3550 1500 5250 1500
Wire Wire Line
	5450 1500 5600 1500
Wire Wire Line
	4100 3300 5600 3300
NoConn ~ 6450 3500
NoConn ~ 6450 3650
Text HLabel 3550 1500 0    60   Input ~ 0
CAN_supply
Wire Wire Line
	4100 3300 4100 1500
Connection ~ 4100 1500
Text HLabel 3350 2600 0    60   Input ~ 0
GND
Wire Wire Line
	3350 2600 5600 2600
Wire Wire Line
	5600 4150 3750 4150
Wire Wire Line
	3750 4150 3750 2600
Connection ~ 3750 2600
Text Notes 2950 1800 0    39   ~ 0
Supply Voltage depends on\nused CAN Transceiver\n(usally 3V3)
Text Notes 4750 1450 0    39   ~ 0
Jumper connected if\nNO transceiver on\nProcessor pcb
Text Notes 4200 2200 0    39   ~ 0
Jumper connected if\ntransceiver on\nprocessor pcb
Wire Notes Line
	5550 1950 5550 2300
Wire Notes Line
	5550 2300 4150 2300
Wire Notes Line
	4150 2300 4150 1950
Wire Notes Line
	4150 1950 5550 1950
Text Notes 6550 3600 0    39   ~ 0
There is no tranceiver\nfor CAN 2 on the processor pcb
$EndSCHEMATC
