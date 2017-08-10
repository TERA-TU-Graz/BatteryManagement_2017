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
LIBS:tera_general
LIBS:Supply
LIBS:relais
LIBS:ft232rl
LIBS:tera_connectors
LIBS:tera_emc_prodection
LIBS:tera_logic
LIBS:tera_processors
LIBS:tera_sensoric
LIBS:tera_switches
LIBS:interlock_power
LIBS:Interlock-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "BMS fennek interlock relay interface"
Date "2017-05-20"
Rev "1"
Comp "TERA TU Graz"
Comment1 "Rene Pöschl"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X02 P1
U 1 1 56DB2FC4
P 2850 3000
F 0 "P1" H 2850 3150 50  0000 C CNN
F 1 "IL1" H 2850 2800 50  0000 C CNN
F 2 "tera_Connectors_JST:JST_EH_B02B-EH-A_02x2.50mm_Straight" H 2850 3000 50  0001 C CNN
F 3 "" H 2850 3000 50  0000 C CNN
F 4 "02-1902" H 2850 3000 60  0001 C CNN "HPN"
	1    2850 3000
	-1   0    0    1   
$EndComp
$Comp
L R_Small R1
U 1 1 56DB6990
P 3700 3050
F 0 "R1" V 3650 3150 50  0000 L CNN
F 1 "1K" V 3700 3000 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 3700 3050 50  0001 C CNN
F 3 "" H 3700 3050 50  0000 C CNN
F 4 "11-1K00" H 3700 3050 60  0001 C CNN "HPN"
	1    3700 3050
	0    1    1    0   
$EndComp
$Comp
L ASSR-1218 K1
U 1 1 56E996D2
P 3700 3450
F 0 "K1" H 3700 3650 60  0000 C CNN
F 1 "ASSR-1218" H 3650 3200 60  0000 C CNN
F 2 "tera_general:SO-4" H 3650 3750 60  0001 C CNN
F 3 "" H 3700 3450 60  0000 C CNN
F 4 "96-3001" H 3700 3450 60  0001 C CNN "HPN"
	1    3700 3450
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P2
U 1 1 59209049
P 2900 3850
F 0 "P2" H 2900 4000 50  0000 C CNN
F 1 "Relay_in" H 2850 3700 50  0000 C CNN
F 2 "tera_Connectors_JST:JST_XH_B02B-XH-A_02x2.50mm_Straight" H 2900 3850 50  0001 C CNN
F 3 "" H 2900 3850 50  0000 C CNN
F 4 "02-1902" H 2900 3850 60  0001 C CNN "HPN"
	1    2900 3850
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X03 P3
U 1 1 592091C8
P 4700 2950
F 0 "P3" H 4618 2625 50  0000 C CNN
F 1 "IL2" H 4618 2716 50  0000 C CNN
F 2 "tera_Connectors_JST:JST_EH_S03B-EH_03x2.50mm_Angled" H 4618 2717 50  0001 C CNN
F 3 "" H 4700 2950 50  0000 C CNN
	1    4700 2950
	1    0    0    1   
$EndComp
$Comp
L CONN_01X03 P4
U 1 1 59209252
P 4700 3900
F 0 "P4" H 4650 4100 50  0000 L CNN
F 1 "Relay_out" H 4550 3700 50  0000 L CNN
F 2 "tera_Connectors_JST:JST_XH_S03B-XH-A_03x2.50mm_Angled" H 4700 3900 50  0001 C CNN
F 3 "" H 4700 3900 50  0000 C CNN
	1    4700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3050 3900 3050
Wire Wire Line
	3900 3050 3800 3050
Wire Wire Line
	3900 3050 3900 3150
Wire Wire Line
	3900 3150 3800 3150
Connection ~ 3900 3050
Wire Wire Line
	3600 3050 3500 3050
Wire Wire Line
	3500 3050 3050 3050
Wire Wire Line
	3600 3150 3500 3150
Wire Wire Line
	3500 3150 3500 3050
Connection ~ 3500 3050
Wire Wire Line
	3050 2950 3300 2950
Wire Wire Line
	3300 2950 3300 2850
Wire Wire Line
	3300 2850 4500 2850
Wire Wire Line
	3100 3800 3600 3800
Wire Wire Line
	3600 3800 3600 3750
Wire Wire Line
	3800 3750 3800 3800
Wire Wire Line
	3800 3800 4500 3800
Wire Wire Line
	3100 3900 3600 3900
Wire Wire Line
	3600 3900 3600 4000
Wire Wire Line
	3600 4000 4500 4000
NoConn ~ 4500 2950
NoConn ~ 4500 3900
$EndSCHEMATC
