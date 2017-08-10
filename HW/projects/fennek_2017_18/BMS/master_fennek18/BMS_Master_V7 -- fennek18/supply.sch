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
P 4150 4350
AR Path="/56F5D766" Ref="PS2"  Part="1" 
AR Path="/56F5D14B/56F5D766" Ref="PS2"  Part="1" 
F 0 "PS2" H 4150 4615 50  0000 C CNN
F 1 "Stepdown_v6-5V" H 4150 4524 50  0000 C CNN
F 2 "Boards_Tera:DCDC_Stepdown_v6" H 4150 4550 60  0001 C CNN
F 3 "" V 4100 4450 60  0000 C CNN
F 4 "99-0026" H 0   200 50  0001 C CNN "HPN"
	1    4150 4350
	1    0    0    -1  
$EndComp
$Comp
L ZENER D21
U 1 1 56F5DE81
P 5050 2850
F 0 "D21" V 5004 2929 50  0000 L CNN
F 1 "3V3" V 5095 2929 50  0000 L CNN
F 2 "tera_diodes:DO-216AA" H 5050 2850 50  0001 C CNN
F 3 "" H 5050 2850 50  0000 C CNN
F 4 "21-9001" H 0   0   50  0001 C CNN "HPN"
	1    5050 2850
	0    1    1    0   
$EndComp
$Comp
L ZENER D20
U 1 1 56F5DF65
P 5000 4600
F 0 "D20" V 4954 4679 50  0000 L CNN
F 1 "5V" V 5045 4679 50  0000 L CNN
F 2 "tera_diodes:DO-216AA" H 5000 4600 50  0001 C CNN
F 3 "" H 5000 4600 50  0000 C CNN
	1    5000 4600
	0    1    1    0   
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
P 5300 4950
F 0 "D22" V 5346 4842 50  0000 R CNN
F 1 "5V_OK" V 5255 4842 50  0000 R CNN
F 2 "tera_diodes:LED_0805" H 5300 4950 50  0001 C CNN
F 3 "" H 5300 4950 50  0000 C CNN
F 4 "21-0002" H 0   200 50  0001 C CNN "HPN"
	1    5300 4950
	0    -1   -1   0   
$EndComp
$Comp
L R R31
U 1 1 56F5FC50
P 5300 4550
F 0 "R31" H 5370 4596 50  0000 L CNN
F 1 "5k1" H 5370 4505 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 5230 4550 50  0001 C CNN
F 3 "" H 5300 4550 50  0000 C CNN
F 4 "11-5K10" H 0   200 50  0001 C CNN "HPN"
	1    5300 4550
	1    0    0    -1  
$EndComp
Text HLabel 3550 4350 0    60   Input ~ 0
+12V_Permanent
Text HLabel 4550 3550 3    60   Input ~ 0
GND
Text HLabel 5450 4350 2    60   Output ~ 0
+5V
Text HLabel 5550 2600 2    60   Output ~ 0
+3V3
Text HLabel 4550 5300 3    60   Input ~ 0
GND
Wire Wire Line
	3550 2700 3750 2700
Wire Wire Line
	3550 2600 3750 2600
Wire Wire Line
	3550 4350 3750 4350
Wire Wire Line
	3550 4450 3750 4450
Wire Wire Line
	4550 4350 5450 4350
Wire Wire Line
	4550 2600 5550 2600
Wire Wire Line
	5400 2600 5400 2650
Wire Wire Line
	5400 3000 5400 2950
Wire Wire Line
	5300 4350 5300 4400
Wire Wire Line
	5300 4750 5300 4700
Wire Wire Line
	5050 2650 5050 2600
Wire Wire Line
	5000 4400 5000 4350
Wire Wire Line
	3550 2700 3550 3450
Wire Wire Line
	3550 4450 3550 5200
Wire Wire Line
	5000 4800 5000 5200
Wire Wire Line
	5050 3050 5050 3450
Wire Wire Line
	5400 3400 5400 3450
Wire Wire Line
	5300 5150 5300 5200
Wire Wire Line
	4550 2700 4550 3550
Wire Wire Line
	4550 4450 4550 5300
Connection ~ 5000 4350
Connection ~ 5050 2600
Connection ~ 5300 4350
Connection ~ 5400 2600
Connection ~ 5000 5200
Connection ~ 5050 3450
Connection ~ 4550 3450
Connection ~ 4550 5200
Wire Wire Line
	5300 5200 3550 5200
Wire Wire Line
	5400 3450 3550 3450
Text HLabel 3550 2600 0    60   Input ~ 0
+12V_Permanent
$EndSCHEMATC
