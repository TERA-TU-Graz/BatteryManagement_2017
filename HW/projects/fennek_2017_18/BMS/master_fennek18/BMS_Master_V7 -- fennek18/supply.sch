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
Sheet 7 11
Title "BMS Master"
Date "2017-01-06"
Rev "6"
Comp "TERA TU Graz"
Comment1 "Rene Pöschl"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L DCDC_Stepdown_v6 PS1
U 1 1 56F5D54A
P 4150 2600
AR Path="/56F5D54A" Ref="PS1"  Part="1" 
AR Path="/56F5D14B/56F5D54A" Ref="PS1"  Part="1" 
F 0 "PS1" H 4150 2865 50  0000 C CNN
F 1 "Stepdown_v6-3V3" H 4150 2774 50  0000 C CNN
F 2 "Boards_Tera:DCDC_Stepdown_v6" H 4150 2800 60  0001 C CNN
F 3 "" V 4100 2700 60  0000 C CNN
F 4 "99-0025" H 0   0   50  0001 C CNN "HPN"
	1    4150 2600
	1    0    0    -1  
$EndComp
$Comp
L DCDC_Stepdown_v6 PS2
U 1 1 56F5D766
P 4150 5250
AR Path="/56F5D766" Ref="PS2"  Part="1" 
AR Path="/56F5D14B/56F5D766" Ref="PS2"  Part="1" 
F 0 "PS2" H 4150 5515 50  0000 C CNN
F 1 "Stepdown_v6-5V" H 4150 5424 50  0000 C CNN
F 2 "Boards_Tera:DCDC_Stepdown_v6" H 4150 5450 60  0001 C CNN
F 3 "" V 4100 5350 60  0000 C CNN
F 4 "99-0026" H 0   1100 50  0001 C CNN "HPN"
	1    4150 5250
	1    0    0    -1  
$EndComp
$Comp
L LED D23
U 1 1 56F5F9F1
P 5400 3200
F 0 "D23" V 5446 3092 50  0000 R CNN
F 1 "3V3_OK" V 5355 3092 50  0000 R CNN
F 2 "tera_diodes:LED_0805" H 5400 3200 50  0001 C CNN
F 3 "" H 5400 3200 50  0000 C CNN
F 4 "21-0002" H 0   0   50  0001 C CNN "HPN"
	1    5400 3200
	0    -1   -1   0   
$EndComp
$Comp
L R R32
U 1 1 56F5F9F7
P 5400 2800
F 0 "R32" H 5470 2846 50  0000 L CNN
F 1 "2k2" H 5470 2755 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 5330 2800 50  0001 C CNN
F 3 "" H 5400 2800 50  0000 C CNN
F 4 "11-2K20" H 0   0   50  0001 C CNN "HPN"
	1    5400 2800
	1    0    0    -1  
$EndComp
$Comp
L LED D22
U 1 1 56F5FC4A
P 5300 5850
F 0 "D22" V 5346 5742 50  0000 R CNN
F 1 "5V_OK" V 5255 5742 50  0000 R CNN
F 2 "tera_diodes:LED_0805" H 5300 5850 50  0001 C CNN
F 3 "" H 5300 5850 50  0000 C CNN
F 4 "21-0002" H 0   1100 50  0001 C CNN "HPN"
	1    5300 5850
	0    -1   -1   0   
$EndComp
$Comp
L R R31
U 1 1 56F5FC50
P 5300 5450
F 0 "R31" H 5370 5496 50  0000 L CNN
F 1 "5k1" H 5370 5405 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 5230 5450 50  0001 C CNN
F 3 "" H 5300 5450 50  0000 C CNN
F 4 "11-5K10" H 0   1100 50  0001 C CNN "HPN"
	1    5300 5450
	1    0    0    -1  
$EndComp
Text HLabel 3550 5250 0    60   Input ~ 0
+12V_Permanent
Text HLabel 4550 3550 3    60   Input ~ 0
GND
Text HLabel 5450 5250 2    60   Output ~ 0
+5V
Text HLabel 5550 2600 2    60   Output ~ 0
+3V3
Text HLabel 4550 6200 3    60   Input ~ 0
GND
Wire Wire Line
	3550 2700 3750 2700
Wire Wire Line
	3550 2600 3750 2600
Wire Wire Line
	3550 5250 3750 5250
Wire Wire Line
	3550 5350 3750 5350
Wire Wire Line
	4550 5250 5450 5250
Wire Wire Line
	4550 2600 5550 2600
Wire Wire Line
	5400 2600 5400 2650
Wire Wire Line
	5400 3000 5400 2950
Wire Wire Line
	5300 5250 5300 5300
Wire Wire Line
	5300 5650 5300 5600
Wire Wire Line
	3550 2700 3550 3450
Wire Wire Line
	3550 5350 3550 6100
Wire Wire Line
	5400 3400 5400 3450
Wire Wire Line
	5300 6050 5300 6100
Wire Wire Line
	4550 2700 4550 3550
Wire Wire Line
	4550 5350 4550 6200
Connection ~ 5300 5250
Connection ~ 5400 2600
Connection ~ 4550 3450
Connection ~ 4550 6100
Wire Wire Line
	5300 6100 3550 6100
Wire Wire Line
	5400 3450 3550 3450
Text HLabel 3550 2600 0    60   Input ~ 0
+12V_Permanent
$Comp
L TSR_0.5-2433 G3
U 1 1 5AB846CB
P 9950 2600
F 0 "G3" H 9925 2947 60  0000 C CNN
F 1 "TSR_0.5-2433" H 9925 2841 60  0000 C CNN
F 2 "traco_power:TSR_0.5" H 9850 2800 60  0001 C CNN
F 3 "" H 9950 2600 60  0001 C CNN
F 4 "90-2001" H 9950 2600 60  0001 C CNN "HPN"
	1    9950 2600
	1    0    0    -1  
$EndComp
$Comp
L TSR_0.5-2450 G2
U 1 1 5AB847A1
P 9950 1750
F 0 "G2" H 9925 2097 60  0000 C CNN
F 1 "TSR_0.5-2450" H 9925 1991 60  0000 C CNN
F 2 "traco_power:TSR_0.5" H 9850 1950 60  0001 C CNN
F 3 "" H 9950 1750 60  0001 C CNN
F 4 "90-2002" H 9950 1750 60  0001 C CNN "HPN"
	1    9950 1750
	1    0    0    -1  
$EndComp
$Comp
L L_Small L5
U 1 1 5AB84965
P 8850 2500
F 0 "L5" V 8672 2500 50  0000 C CNN
F 1 "3u3" V 8763 2500 50  0000 C CNN
F 2 "tera_rlc:L_0805in" H 8850 2500 50  0001 C CNN
F 3 "" H 8850 2500 50  0000 C CNN
F 4 "11-0R00" V 8850 2500 60  0001 C CNN "HPN"
	1    8850 2500
	0    1    1    0   
$EndComp
Text Notes 8300 2300 0    30   ~ 0
Example inductor: \nCPI0805E3R3R-10 
$Comp
L C_Small C29
U 1 1 5AB851A2
P 9050 2750
F 0 "C29" H 9142 2796 50  0000 L CNN
F 1 "4u7" H 9142 2705 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 9142 2659 50  0001 L CNN
F 3 "" H 9050 2750 50  0000 C CNN
F 4 "52-4u70" H 9050 2750 60  0001 C CNN "HPN"
	1    9050 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C24
U 1 1 5AB852CB
P 8600 2750
F 0 "C24" H 8692 2796 50  0000 L CNN
F 1 "4u7" H 8692 2705 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 8692 2659 50  0001 L CNN
F 3 "" H 8600 2750 50  0000 C CNN
F 4 "52-4u70" H 8600 2750 60  0001 C CNN "HPN"
	1    8600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2500 9650 2500
Wire Wire Line
	9050 2650 9050 2500
Connection ~ 9050 2500
Wire Wire Line
	8600 2650 8600 2500
Wire Wire Line
	8400 2500 8750 2500
Text HLabel 8400 2500 0    60   Input ~ 0
+12V_Permanent
Connection ~ 8600 2500
Wire Wire Line
	9950 2900 9950 2800
Wire Wire Line
	8400 2900 9950 2900
Wire Wire Line
	9050 2900 9050 2850
Wire Wire Line
	8600 2900 8600 2850
Connection ~ 9050 2900
Text HLabel 10200 2500 2    60   Output ~ 0
+3V3
Text HLabel 8400 2900 0    60   Input ~ 0
GND
Connection ~ 8600 2900
$Comp
L L_Small L4
U 1 1 5AB85A35
P 8850 1650
F 0 "L4" V 8672 1650 50  0000 C CNN
F 1 "3u3" V 8763 1650 50  0000 C CNN
F 2 "tera_rlc:L_0805in" H 8850 1650 50  0001 C CNN
F 3 "" H 8850 1650 50  0000 C CNN
F 4 "11-0R00" V 8850 1650 60  0001 C CNN "HPN"
	1    8850 1650
	0    1    1    0   
$EndComp
$Comp
L C_Small C28
U 1 1 5AB85A3B
P 9050 1900
F 0 "C28" H 9142 1946 50  0000 L CNN
F 1 "4u7" H 9142 1855 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 9142 1809 50  0001 L CNN
F 3 "" H 9050 1900 50  0000 C CNN
F 4 "52-4u70" H 9050 1900 60  0001 C CNN "HPN"
	1    9050 1900
	1    0    0    -1  
$EndComp
$Comp
L C_Small C23
U 1 1 5AB85A41
P 8600 1900
F 0 "C23" H 8692 1946 50  0000 L CNN
F 1 "4u7" H 8692 1855 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 8692 1809 50  0001 L CNN
F 3 "" H 8600 1900 50  0000 C CNN
F 4 "52-4u70" H 8600 1900 60  0001 C CNN "HPN"
	1    8600 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 1650 9650 1650
Wire Wire Line
	9050 1800 9050 1650
Connection ~ 9050 1650
Wire Wire Line
	8600 1800 8600 1650
Wire Wire Line
	8400 1650 8750 1650
Text HLabel 8400 1650 0    60   Input ~ 0
+12V_Permanent
Connection ~ 8600 1650
Wire Wire Line
	8400 2050 9950 2050
Wire Wire Line
	9050 2050 9050 2000
Wire Wire Line
	8600 2050 8600 2000
Connection ~ 9050 2050
Text HLabel 8400 2050 0    60   Input ~ 0
GND
Connection ~ 8600 2050
Wire Wire Line
	9950 2050 9950 1950
Text HLabel 10200 1650 2    60   Output ~ 0
+5V
Text Notes 7700 1300 0    60   ~ 0
Replacement for TERA DC/DC\n\nInput filter should not be necessary for our application.
Wire Notes Line
	6800 550  6800 3300
Wire Notes Line
	6800 3300 11150 3300
$Comp
L PWR_FLAG #FLG040
U 1 1 5AB876A5
P 9200 1600
F 0 "#FLG040" H 9200 1695 50  0001 C CNN
F 1 "PWR_FLAG" H 9200 1824 50  0000 C CNN
F 2 "" H 9200 1600 50  0000 C CNN
F 3 "" H 9200 1600 50  0000 C CNN
	1    9200 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1600 9200 1650
Connection ~ 9200 1650
$Comp
L PWR_FLAG #FLG041
U 1 1 5AB878B2
P 9200 2450
F 0 "#FLG041" H 9200 2545 50  0001 C CNN
F 1 "PWR_FLAG" H 9200 2674 50  0000 C CNN
F 2 "" H 9200 2450 50  0000 C CNN
F 3 "" H 9200 2450 50  0000 C CNN
	1    9200 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 2450 9200 2500
Connection ~ 9200 2500
$EndSCHEMATC
