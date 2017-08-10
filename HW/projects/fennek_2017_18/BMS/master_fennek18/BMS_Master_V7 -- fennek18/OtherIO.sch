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
LIBS:tera_logic
LIBS:tera_processors
LIBS:tera_connectors
LIBS:tera_emc_prodection
LIBS:tera_sensoric
LIBS:interlock_power
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:Altera
LIBS:analog_devices
LIBS:battery_management
LIBS:bbd
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:logo
LIBS:maxim
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:motor_drivers
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:powerint
LIBS:Power_Management
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:Worldsemi
LIBS:Xicor
LIBS:Zilog
LIBS:isolator_pwr
LIBS:BMS_Master_V7_kicad-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 11
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3100 4250 3150 4250
Wire Wire Line
	3150 4250 3150 4300
Wire Wire Line
	3150 3850 3100 3850
Wire Wire Line
	3150 3750 3150 3850
$Comp
L CONN_01X05 P3
U 1 1 5938587C
P 2900 4050
F 0 "P3" H 2900 4350 50  0000 C CNN
F 1 "ExtGPIO" V 3000 4050 50  0000 C CNN
F 2 "tera_Connectors_JST:JST_EH_B05B-EH-A_05x2.50mm_Straight" H 2900 4050 50  0001 C CNN
F 3 "" H 2900 4050 50  0000 C CNN
F 4 "02-1905" H 2900 4050 60  0001 C CNN "HPN"
	1    2900 4050
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X03 P1
U 1 1 5938588C
P 3150 1950
F 0 "P1" H 3069 1625 50  0000 C CNN
F 1 "Buttons" H 3069 1716 50  0000 C CNN
F 2 "tera_Connectors_JST:JST_EH_S03B-EH_03x2.50mm_Angled" H 3069 1717 50  0001 C CNN
F 3 "" H 3150 1950 50  0000 C CNN
F 4 "02-1003" H 3150 1950 60  0001 C CNN "HPN"
	1    3150 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3450 1750 3450 1850
Wire Wire Line
	3450 1850 3350 1850
$Comp
L R_Small R29
U 1 1 59385896
P 3800 1950
F 0 "R29" V 3850 2050 50  0000 L CNN
F 1 "1K" V 3850 1750 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 3800 1950 50  0001 C CNN
F 3 "" H 3800 1950 50  0000 C CNN
F 4 "11-1K00" H 50  -1650 50  0001 C CNN "HPN"
	1    3800 1950
	0    -1   -1   0   
$EndComp
Text HLabel 2850 3650 0    40   Input ~ 0
3V3
Text HLabel 3450 1750 1    40   Input ~ 0
5V
Text HLabel 3150 4300 3    40   Input ~ 0
GND
$Comp
L JUMPER3_NO JP6
U 1 1 59385E19
P 3150 3650
F 0 "JP6" H 3150 3851 50  0000 C CNN
F 1 "JUMPER3_NO" H 3150 3760 50  0000 C CNN
F 2 "tera_general:SOLDERJUMPER_3_1mm" H 3150 3650 50  0001 C CNN
F 3 "" H 3150 3650 50  0000 C CNN
	1    3150 3650
	1    0    0    -1  
$EndComp
Text HLabel 3450 3650 2    40   Input ~ 0
5V
Wire Wire Line
	3350 1950 3700 1950
Wire Wire Line
	3900 1950 4400 1950
Wire Wire Line
	4250 1950 4250 2200
$Comp
L R_Small R30
U 1 1 59386338
P 3800 2050
F 0 "R30" V 3850 2150 50  0000 L CNN
F 1 "1K" V 3850 1850 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 3800 2050 50  0001 C CNN
F 3 "" H 3800 2050 50  0000 C CNN
F 4 "11-1K00" H 50  -1550 50  0001 C CNN "HPN"
	1    3800 2050
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C10
U 1 1 5938633F
P 4000 2300
F 0 "C10" V 3950 2150 50  0000 L CNN
F 1 "100n" V 3950 2350 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 4000 2300 50  0001 C CNN
F 3 "" H 4000 2300 50  0000 C CNN
F 4 "52-100n" H -150 -1600 50  0001 C CNN "HPN"
	1    4000 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2050 4400 2050
Wire Wire Line
	4000 2050 4000 2200
$Comp
L C_Small C12
U 1 1 5938665B
P 4250 2300
F 0 "C12" V 4200 2150 50  0000 L CNN
F 1 "100n" V 4200 2350 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 4250 2300 50  0001 C CNN
F 3 "" H 4250 2300 50  0000 C CNN
F 4 "52-100n" H 100 -1600 50  0001 C CNN "HPN"
	1    4250 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2050 3350 2050
Text HLabel 4400 1950 2    40   Output ~ 0
Button_On
Connection ~ 4250 1950
Text HLabel 4400 2050 2    40   Output ~ 0
Button_Off
Connection ~ 4000 2050
Text HLabel 4100 2550 3    40   Input ~ 0
GND
Wire Wire Line
	4000 2400 4000 2500
Wire Wire Line
	4000 2500 4250 2500
Wire Wire Line
	4250 2500 4250 2400
Wire Wire Line
	4100 2500 4100 2550
Connection ~ 4100 2500
$Comp
L R_Small R24
U 1 1 593870B4
P 3550 3950
F 0 "R24" V 3600 4050 50  0000 L CNN
F 1 "1K" V 3600 3750 50  0000 L CNN
F 2 "tera_rlc:R_0805in" H 3550 3950 50  0001 C CNN
F 3 "" H 3550 3950 50  0000 C CNN
F 4 "11-1K00" H -200 350 50  0001 C CNN "HPN"
	1    3550 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 3950 3450 3950
Wire Wire Line
	3650 3950 4400 3950
Wire Wire Line
	4250 3950 4250 4300
$Comp
L R_Small R25
U 1 1 593870BE
P 3550 4050
F 0 "R25" V 3600 4150 50  0000 L CNN
F 1 "1K" V 3600 3850 50  0000 L CNN
F 2 "tera_rlc:R_0805in" H 3550 4050 50  0001 C CNN
F 3 "" H 3550 4050 50  0000 C CNN
F 4 "11-1K00" H -200 450 50  0001 C CNN "HPN"
	1    3550 4050
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C11
U 1 1 593870C5
P 4000 4400
F 0 "C11" V 3950 4250 50  0000 L CNN
F 1 "100n" V 3950 4450 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 4000 4400 50  0001 C CNN
F 3 "" H 4000 4400 50  0000 C CNN
F 4 "52-100n" H -150 500 50  0001 C CNN "HPN"
	1    4000 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4050 4400 4050
Wire Wire Line
	4000 4050 4000 4300
$Comp
L C_Small C13
U 1 1 593870CE
P 4250 4400
F 0 "C13" V 4200 4250 50  0000 L CNN
F 1 "100n" V 4200 4450 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 4250 4400 50  0001 C CNN
F 3 "" H 4250 4400 50  0000 C CNN
F 4 "52-100n" H 100 500 50  0001 C CNN "HPN"
	1    4250 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4050 3100 4050
Text HLabel 4400 3950 2    40   Output ~ 0
EXT_GPIO_1
Connection ~ 4250 3950
Text HLabel 4400 4050 2    40   Output ~ 0
EXT_GPIO_2
Connection ~ 4000 4050
Text HLabel 4000 4650 3    40   Input ~ 0
GND
Wire Wire Line
	4000 4500 4000 4650
Wire Wire Line
	3750 4600 4250 4600
Wire Wire Line
	4250 4600 4250 4500
$Comp
L R_Small R26
U 1 1 5938730C
P 3550 4150
F 0 "R26" V 3600 4250 50  0000 L CNN
F 1 "1K" V 3600 3950 50  0000 L CNN
F 2 "tera_rlc:R_0805in" H 3550 4150 50  0001 C CNN
F 3 "" H 3550 4150 50  0000 C CNN
F 4 "11-1K00" H -200 550 50  0001 C CNN "HPN"
	1    3550 4150
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C9
U 1 1 59387313
P 3750 4400
F 0 "C9" V 3700 4250 50  0000 L CNN
F 1 "100n" V 3700 4450 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 3750 4400 50  0001 C CNN
F 3 "" H 3750 4400 50  0000 C CNN
F 4 "52-100n" H -400 500 50  0001 C CNN "HPN"
	1    3750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4150 4400 4150
Wire Wire Line
	3750 4150 3750 4300
Wire Wire Line
	3450 4150 3100 4150
Text HLabel 4400 4150 2    40   Output ~ 0
EXT_GPIO_3
Connection ~ 3750 4150
Connection ~ 4000 4600
Wire Wire Line
	3750 4600 3750 4500
$Comp
L CONN_01X03 P7
U 1 1 593EA226
P 6200 1800
F 0 "P7" H 6200 1550 50  0000 C CNN
F 1 "WheelSpeed" V 6300 1800 50  0000 C CNN
F 2 "tera_Connectors_JST:JST_PH_S3B-PH-K_03x2.00mm_Angled" H 6200 1800 50  0001 C CNN
F 3 "" H 6200 1800 50  0000 C CNN
F 4 "02-2003" H 6200 1800 60  0001 C CNN "HPN"
	1    6200 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 1600 6500 1700
Wire Wire Line
	6500 1700 6400 1700
$Comp
L R_Small R38
U 1 1 593EA22F
P 6750 1800
F 0 "R38" V 6800 1900 50  0000 L CNN
F 1 "0R" V 6800 1600 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 6750 1800 50  0001 C CNN
F 3 "" H 6750 1800 50  0000 C CNN
F 4 "11-0R00" H 3000 -1800 50  0001 C CNN "HPN"
	1    6750 1800
	0    -1   -1   0   
$EndComp
Text HLabel 6500 1600 1    40   Input ~ 0
5V
Wire Wire Line
	6400 1800 6650 1800
Wire Wire Line
	6850 1800 7400 1800
Wire Wire Line
	7300 1800 7300 2050
$Comp
L C_Small C22
U 1 1 593EA24A
P 7300 2150
F 0 "C22" V 7250 2000 50  0000 L CNN
F 1 "100n" V 7250 2200 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 7300 2150 50  0001 C CNN
F 3 "" H 7300 2150 50  0000 C CNN
F 4 "52-100n" H 3150 -1750 50  0001 C CNN "HPN"
	1    7300 2150
	1    0    0    -1  
$EndComp
Text HLabel 7400 1800 2    40   Output ~ 0
WheelSpeed
Connection ~ 7300 1800
Text HLabel 7200 2400 3    40   Input ~ 0
GND
Wire Wire Line
	7300 2350 7300 2250
Text HLabel 6500 1950 3    40   Input ~ 0
GND
Wire Wire Line
	6500 1950 6500 1900
Wire Wire Line
	6500 1900 6400 1900
$Comp
L R_Small R39
U 1 1 593EC6DC
P 7100 2150
F 0 "R39" V 7150 2250 50  0000 L CNN
F 1 "22k" V 7150 1950 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 7100 2150 50  0001 C CNN
F 3 "" H 7100 2150 50  0000 C CNN
F 4 "11-22K0" H 3350 -1450 50  0001 C CNN "HPN"
	1    7100 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 2050 7100 1800
Connection ~ 7100 1800
Wire Wire Line
	7100 2250 7100 2350
Wire Wire Line
	7100 2350 7300 2350
Wire Wire Line
	7200 2400 7200 2350
Connection ~ 7200 2350
$EndSCHEMATC
