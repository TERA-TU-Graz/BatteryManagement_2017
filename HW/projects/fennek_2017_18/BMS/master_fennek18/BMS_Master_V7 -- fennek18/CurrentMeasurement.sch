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
Sheet 2 11
Title "BMS Master"
Date "2017-01-06"
Rev "6"
Comp "TERA TU Graz"
Comment1 "Rene Pöschl"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3250 2850 550  650 
U 571E9DC1
F0 "LEM2" 39
F1 "LEM.sch" 39
F2 "+5V" I L 3250 2950 40 
F3 "GND" I L 3250 3400 40 
F4 "Signal" O R 3800 3150 40 
F5 "+3V3" I L 3250 3050 40 
F6 "Standby" I L 3250 3200 40 
$EndSheet
Text HLabel 2850 2200 0    39   Input ~ 0
+5V
Text HLabel 2850 2600 0    39   Input ~ 0
GND
Text HLabel 3800 2400 2    39   Output ~ 0
LEM1_Signal
Text HLabel 3800 3150 2    39   Output ~ 0
LEM2_Signal
Text HLabel 2850 2300 0    39   Input ~ 0
+3V3
Wire Wire Line
	2850 2200 3250 2200
Wire Wire Line
	3050 2950 3250 2950
Wire Wire Line
	2850 2600 3250 2600
Wire Wire Line
	3150 3400 3250 3400
Wire Wire Line
	2850 2300 3250 2300
Wire Wire Line
	2950 3050 3250 3050
Connection ~ 3050 2200
Connection ~ 3150 2600
Connection ~ 2950 2300
Wire Wire Line
	3150 3400 3150 2600
Wire Wire Line
	3050 2950 3050 2200
Wire Wire Line
	2950 3050 2950 2300
$Sheet
S 3250 2100 550  600 
U 571E6146
F0 "LEM1" 39
F1 "LEM.sch" 39
F2 "+5V" I L 3250 2200 40 
F3 "GND" I L 3250 2600 40 
F4 "+3V3" I L 3250 2300 40 
F5 "Standby" I L 3250 2450 40 
F6 "Signal" O R 3800 2400 40 
$EndSheet
Text HLabel 2850 2450 0    39   Input ~ 0
LEM_Standby
Wire Wire Line
	2850 2450 3250 2450
Text HLabel 2850 3200 0    39   Input ~ 0
LEM_Standby
Wire Wire Line
	2850 3200 3250 3200
$Comp
L R_Small R7
U 1 1 593240A1
P 3300 4150
F 0 "R7" H 3359 4196 50  0000 L CNN
F 1 "1K" H 3359 4105 50  0000 L CNN
F 2 "tera_rlc:R_0805in" H 3300 4150 50  0001 C CNN
F 3 "" H 3300 4150 50  0000 C CNN
F 4 "11-1K00" H -450 550 50  0001 C CNN "HPN"
	1    3300 4150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 593240A9
P 3700 4450
F 0 "C7" H 3792 4496 50  0000 L CNN
F 1 "100n" H 3792 4405 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 3700 4450 50  0001 C CNN
F 3 "" H 3700 4450 50  0000 C CNN
F 4 "52-100n" H -450 550 50  0001 C CNN "HPN"
	1    3700 4450
	1    0    0    -1  
$EndComp
$Comp
L ZENER D3
U 1 1 593240B1
P 3300 4550
F 0 "D3" V 3254 4629 50  0000 L CNN
F 1 "3V3" V 3345 4629 50  0000 L CNN
F 2 "tera_diodes:DO-216AA" H 3300 4550 50  0001 C CNN
F 3 "" H 3300 4550 50  0000 C CNN
F 4 "21-9001" H -450 550 50  0001 C CNN "HPN"
	1    3300 4550
	0    1    1    0   
$EndComp
Text HLabel 3150 4850 0    39   Input ~ 0
GND
Text HLabel 4100 4300 2    39   Output ~ 0
Alegro_1_Filtered
Wire Wire Line
	3150 4850 3700 4850
Wire Wire Line
	3300 4850 3300 4750
Wire Wire Line
	3700 4850 3700 4550
Wire Wire Line
	3300 4250 3300 4350
Wire Wire Line
	3300 4300 4100 4300
Wire Wire Line
	3700 4300 3700 4350
Connection ~ 3300 4850
Connection ~ 3300 4300
Connection ~ 3700 4300
Text HLabel 3150 4050 0    39   Input ~ 0
Alegro_1
Wire Wire Line
	3150 4050 3300 4050
$Comp
L R_Small R8
U 1 1 5932492D
P 3300 5350
F 0 "R8" H 3359 5396 50  0000 L CNN
F 1 "1K" H 3359 5305 50  0000 L CNN
F 2 "tera_rlc:R_0805in" H 3300 5350 50  0001 C CNN
F 3 "" H 3300 5350 50  0000 C CNN
F 4 "11-1K00" H -450 1750 50  0001 C CNN "HPN"
	1    3300 5350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 59324934
P 3700 5650
F 0 "C8" H 3792 5696 50  0000 L CNN
F 1 "100n" H 3792 5605 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 3700 5650 50  0001 C CNN
F 3 "" H 3700 5650 50  0000 C CNN
F 4 "52-100n" H -450 1750 50  0001 C CNN "HPN"
	1    3700 5650
	1    0    0    -1  
$EndComp
$Comp
L ZENER D5
U 1 1 5932493B
P 3300 5750
F 0 "D5" V 3254 5829 50  0000 L CNN
F 1 "3V3" V 3345 5829 50  0000 L CNN
F 2 "tera_diodes:DO-216AA" H 3300 5750 50  0001 C CNN
F 3 "" H 3300 5750 50  0000 C CNN
F 4 "21-9001" H -450 1750 50  0001 C CNN "HPN"
	1    3300 5750
	0    1    1    0   
$EndComp
Text HLabel 3150 6050 0    39   Input ~ 0
GND
Text HLabel 4100 5500 2    39   Output ~ 0
Alegro_2_Filtered
Wire Wire Line
	3150 6050 3700 6050
Wire Wire Line
	3300 6050 3300 5950
Wire Wire Line
	3700 6050 3700 5750
Wire Wire Line
	3300 5450 3300 5550
Wire Wire Line
	3300 5500 4100 5500
Wire Wire Line
	3700 5500 3700 5550
Connection ~ 3300 6050
Connection ~ 3300 5500
Connection ~ 3700 5500
Text HLabel 3150 5250 0    39   Input ~ 0
Alegro_2
Wire Wire Line
	3150 5250 3300 5250
$EndSCHEMATC
