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
LIBS:local_power
LIBS:ft232rl
LIBS:relais
LIBS:Supply
LIBS:tera_connectors
LIBS:tera_emc_prodection
LIBS:tera_general
LIBS:tera_logic
LIBS:tera_processors
LIBS:tera_switches
LIBS:tera_sensoric
LIBS:fennek_power_distribution-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X02 P13
U 1 1 592C6B30
P 6000 2700
F 0 "P13" H 6077 2741 50  0000 L CNN
F 1 "SEM_telemetry_supply" H 5950 2850 40  0000 L CNN
F 2 "tera_Connectors_Phoenix:PhoenixContact_MC-GF_02x3.50mm_Angled_ThreadedFlange" H 6077 2604 50  0001 L CNN
F 3 "" H 6000 2700 50  0000 C CNN
F 4 "05-1252" H 6000 2700 60  0001 C CNN "HPN"
	1    6000 2700
	1    0    0    1   
$EndComp
$Comp
L ZENERsmall D12
U 1 1 592C6B38
P 5550 2700
F 0 "D12" V 5504 2769 50  0000 L CNN
F 1 "14V" V 5595 2769 50  0000 L CNN
F 2 "tera_diodes:SOD128_with_vias_in_pad" H 5550 2700 50  0001 C CNN
F 3 "" H 5550 2700 50  0000 C CNN
F 4 "21-9008" V 5550 2700 60  0001 C CNN "HPN"
	1    5550 2700
	0    1    1    0   
$EndComp
$Comp
L F_Small F7
U 1 1 592C6B40
P 4650 2500
F 0 "F7" H 4650 2685 50  0000 C CNN
F 1 "1A 12VDC" H 4650 2594 50  0000 C CNN
F 2 "tera_general:Fuse_Phoenix_SI-H-FKS_15" H 4650 2500 50  0001 C CNN
F 3 "" H 4650 2500 50  0000 C CNN
F 4 "94-1000" H 4650 2500 60  0001 C CNN "HPN"
	1    4650 2500
	1    0    0    -1  
$EndComp
$Comp
L JUMPER3_NO JP1
U 1 1 592C6B55
P 2950 2300
F 0 "JP1" H 2950 2501 50  0000 C CNN
F 1 "SEM_source" H 2950 2410 50  0000 C CNN
F 2 "tera_general:SOLDERJUMPER_3" H 2950 2410 50  0001 C CNN
F 3 "" H 2950 2300 50  0000 C CNN
	1    2950 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2500 5800 2500
Wire Wire Line
	5800 2500 5800 2650
Wire Wire Line
	5550 2500 5550 2600
Connection ~ 5550 2500
Wire Wire Line
	4500 2900 5800 2900
Wire Wire Line
	5800 2900 5800 2750
Wire Wire Line
	5550 2800 5550 2900
Connection ~ 5550 2900
Wire Wire Line
	3400 2900 3500 2900
Wire Wire Line
	3500 2800 3400 2800
Wire Wire Line
	3500 2600 3400 2600
Wire Wire Line
	3400 2600 3400 2500
Wire Wire Line
	2900 2500 3500 2500
Connection ~ 3400 2500
Wire Wire Line
	3300 2250 3300 2300
Wire Wire Line
	3300 2300 3250 2300
Wire Wire Line
	2600 2250 2600 2300
Wire Wire Line
	2600 2300 2650 2300
Wire Wire Line
	2950 2400 2950 2500
$Comp
L PWR_FLAG #FLG06
U 1 1 592C6B71
P 2900 2500
F 0 "#FLG06" H 2900 2595 50  0001 C CNN
F 1 "PWR_FLAG" H 2900 2600 15  0000 C CNN
F 2 "" H 2900 2500 50  0000 C CNN
F 3 "" H 2900 2500 50  0000 C CNN
	1    2900 2500
	0    -1   -1   0   
$EndComp
Connection ~ 2950 2500
Text Label 5000 2900 0    40   ~ 0
GND_telemetry
Text Label 5000 2500 0    40   ~ 0
+12V_telemetry
$Comp
L THD_12-xxxx_single_output U2
U 1 1 592C6B7B
P 4000 2700
F 0 "U2" H 4000 3000 60  0000 C CNN
F 1 "THD_12-4812_single_output" H 4100 2400 60  0000 C CNN
F 2 "traco_power:THD_12-xxxx" H 4000 3150 60  0001 C CNN
F 3 "" H 4000 2700 60  0000 C CNN
F 4 "90-1021" H 4000 2700 60  0001 C CNN "HPN"
	1    4000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2500 4500 2500
Text HLabel 3300 2250 1    50   Input ~ 0
+Vbatt
Text HLabel 2600 2250 1    50   Input ~ 0
Vbatt_Switched
Text HLabel 3300 4100 0    50   Input ~ 0
-Vbatt
Wire Wire Line
	3400 2800 3400 4100
$Comp
L Panasonic_AQY414S K5
U 1 1 593156DE
P 2850 3600
F 0 "K5" H 2850 3800 60  0000 C CNN
F 1 "Panasonic_AQY414S" H 2850 3350 40  0000 C CNN
F 2 "tera_general:SO-4" H 2800 3900 60  0001 C CNN
F 3 "" H 2850 3600 60  0000 C CNN
	1    2850 3600
	1    0    0    -1  
$EndComp
$Comp
L R_Small R23
U 1 1 593156E6
P 2450 3600
F 0 "R23" H 2509 3646 50  0000 L CNN
F 1 "1k" H 2509 3555 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 2509 3509 50  0001 L CNN
F 3 "" H 2450 3600 50  0000 C CNN
F 4 "11-1K00" H 2450 3600 60  0001 C CNN "HPN"
	1    2450 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2200 3450 2550 3450
Wire Wire Line
	2450 3450 2450 3500
Wire Wire Line
	2200 3750 2550 3750
Wire Wire Line
	2450 3750 2450 3700
Connection ~ 2450 3450
Connection ~ 2450 3750
Text HLabel 2200 3800 3    60   Output ~ 0
IL_prev-
Text HLabel 2200 3400 1    60   Input ~ 0
IL_next-
Wire Wire Line
	3500 2700 3150 2700
Wire Wire Line
	3400 3700 3150 3700
Connection ~ 3400 2900
Wire Wire Line
	3400 4100 3300 4100
Connection ~ 3400 3700
Wire Wire Line
	2550 3450 2550 3500
Wire Wire Line
	2550 3750 2550 3700
$Comp
L Jumper_NO_Small JP3
U 1 1 5931624E
P 3150 2900
F 0 "JP3" V 3100 2700 50  0000 L CNN
F 1 "Jumper_NO_Small" H 3160 2840 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2_1mm" H 3150 2900 50  0001 C CNN
F 3 "" H 3150 2900 50  0000 C CNN
	1    3150 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 2700 3150 2800
Wire Wire Line
	3150 3000 3150 3500
Wire Wire Line
	2200 3400 2200 3450
Wire Wire Line
	2200 3800 2200 3750
Text HLabel 2000 3800 3    60   Input ~ 0
IL_prev+
Text HLabel 2000 3400 1    60   Output ~ 0
IL_next+
Wire Wire Line
	2000 3400 2000 3800
Wire Notes Line
	1700 2900 2850 2900
Wire Notes Line
	2850 2900 2850 4350
Wire Notes Line
	2850 4350 1700 4350
Wire Notes Line
	1700 4350 1700 2900
Text Notes 1850 4200 1    60   ~ 0
Isolated Interlock circuit
$EndSCHEMATC
