EESchema Schematic File Version 2
LIBS:ft232rl
LIBS:relais
LIBS:Supply
LIBS:tera_connectors
LIBS:tera_emc_prodection
LIBS:tera_general
LIBS:tera_logic
LIBS:tera_processors
LIBS:tera_sensoric
LIBS:tera_switches
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
LIBS:relays
LIBS:PreCharger V2-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp "TERA TU Graz"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TE_OJ-SH-112DM RL1
U 1 1 59B3E864
P 4900 3350
F 0 "RL1" H 5330 3396 50  0000 L CNN
F 1 "TE_OJ-SH-112DM" H 5330 3305 50  0000 L CNN
F 2 "tera_relais:RELAIS-TE-OJ" H 5750 3050 50  0001 C CNN
F 3 "" H 4900 3350 50  0000 C CNN
F 4 "96-0002" H 5550 3250 60  0001 C CNN "HPN"
	1    4900 3350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 59B3E96B
P 2950 3350
F 0 "P1" H 2869 3075 50  0000 C CNN
F 1 "CONN_01X02" H 2869 3166 50  0000 C CNN
F 2 "tera_Connectors_JST:JST_XH_B02B-XH-A_02x2.50mm_Straight" H 2950 3350 50  0001 C CNN
F 3 "" H 2950 3350 50  0000 C CNN
	1    2950 3350
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 P2
U 1 1 59B3EAE3
P 6950 3350
F 0 "P2" H 7027 3391 50  0000 L CNN
F 1 "HV Connector" H 7027 3300 50  0000 L CNN
F 2 "tera_Connectors_Phoenix:MCV_1.5_2-GF-3.5_MountHole" H 7027 3254 50  0001 L CNN
F 3 "" H 6950 3350 50  0000 C CNN
	1    6950 3350
	1    0    0    1   
$EndComp
$Comp
L R_Small R2
U 1 1 59B3EE7A
P 5900 2900
F 0 "R2" V 5704 2900 50  0000 C CNN
F 1 "R_Small" V 5795 2900 50  0000 C CNN
F 2 "tera_rlc:R_WH25" H 5900 2900 50  0001 C CNN
F 3 "" H 5900 2900 50  0000 C CNN
	1    5900 2900
	0    1    1    0   
$EndComp
$Comp
L R_Small R1
U 1 1 59B3F02F
P 3650 3200
F 0 "R1" H 3591 3154 50  0000 R CNN
F 1 "R_Small" H 3591 3245 50  0000 R CNN
F 2 "tera_rlc:R_0805in" H 3591 3291 50  0001 R CNN
F 3 "" H 3650 3200 50  0000 C CNN
	1    3650 3200
	-1   0    0    1   
$EndComp
$Comp
L C_Small C1
U 1 1 59B3F0D5
P 3650 3500
F 0 "C1" H 3742 3546 50  0000 L CNN
F 1 "C_Small" H 3742 3455 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 3650 3500 50  0001 C CNN
F 3 "" H 3650 3500 50  0000 C CNN
	1    3650 3500
	1    0    0    -1  
$EndComp
$Comp
L D_Small D1
U 1 1 59B3F18D
P 4100 3350
F 0 "D1" H 4100 3450 50  0000 L CNN
F 1 "BAS3005B-02V" H 3850 3550 50  0000 L CNN
F 2 "tera_diodes:BAS3005B-02V__sc79" V 4191 3418 50  0001 L CNN
F 3 "" V 4100 3350 50  0000 C CNN
	1    4100 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 3300 3400 3300
Wire Wire Line
	3400 3300 3400 3000
Wire Wire Line
	3400 3000 4700 3000
Wire Wire Line
	4700 3000 4700 3050
Wire Wire Line
	3150 3400 3400 3400
Wire Wire Line
	3400 3400 3400 3750
Wire Wire Line
	3400 3750 4700 3750
Wire Wire Line
	4700 3750 4700 3650
Wire Wire Line
	3650 3600 3650 3750
Connection ~ 3650 3750
Wire Wire Line
	3650 3300 3650 3400
Wire Wire Line
	3650 3000 3650 3100
Connection ~ 3650 3000
Wire Wire Line
	4100 3250 4100 3000
Connection ~ 4100 3000
Wire Wire Line
	4100 3450 4100 3750
Connection ~ 4100 3750
Wire Wire Line
	5200 3050 5200 2900
Wire Wire Line
	5200 2900 5800 2900
Wire Wire Line
	6000 2900 6600 2900
Wire Wire Line
	6600 2900 6600 3300
Wire Wire Line
	6600 3300 6750 3300
Wire Wire Line
	5100 3650 5100 3800
Wire Wire Line
	5100 3800 6600 3800
Wire Wire Line
	6600 3800 6600 3400
Wire Wire Line
	6600 3400 6750 3400
$EndSCHEMATC
