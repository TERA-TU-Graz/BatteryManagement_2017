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
LIBS:BMS_Master_V6_kicad-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 14
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
L CONN_01X09 P15
U 1 1 56FAD51B
P 7300 1750
F 0 "P15" H 7218 1119 50  0000 C CNN
F 1 "SPI_Slaves" H 7218 1210 50  0000 C CNN
F 2 "tera_Connectors_Molex:Molex_PicoBlade_53398-0971_09x1.25mm_Straight" H 7300 1750 50  0001 C CNN
F 3 "" H 7300 1750 50  0000 C CNN
F 4 "03-0209" H 0   0   50  0001 C CNN "HPN"
	1    7300 1750
	1    0    0    1   
$EndComp
$Comp
L C C14
U 1 1 56FADBA9
P 3500 3150
F 0 "C14" V 3248 3150 50  0000 C CNN
F 1 "100n" V 3339 3150 50  0000 C CNN
F 2 "tera_rlc:C_0603in" H 3538 3000 50  0001 C CNN
F 3 "" H 3500 3150 50  0000 C CNN
F 4 "52-100n" H 0   0   50  0001 C CNN "HPN"
	1    3500 3150
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 P16
U 1 1 56FAEA99
P 7300 2450
F 0 "P16" H 7378 2488 50  0000 L CNN
F 1 "DI_Slaves" H 7378 2397 50  0000 L CNN
F 2 "tera_Connectors_JST:JST_XH_B02B-XH-A_02x2.50mm_Straight" H 7300 2450 50  0001 C CNN
F 3 "" H 7300 2450 50  0000 C CNN
F 4 "02-0902" H 0   0   50  0001 C CNN "HPN"
	1    7300 2450
	1    0    0    1   
$EndComp
$Comp
L R R22
U 1 1 56FAEBAB
P 6950 2800
F 0 "R22" H 7020 2846 50  0000 L CNN
F 1 "10k" H 7020 2755 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 6880 2800 50  0001 C CNN
F 3 "" H 6950 2800 50  0000 C CNN
F 4 "11-10K0" H 0   0   50  0001 C CNN "HPN"
	1    6950 2800
	1    0    0    -1  
$EndComp
$Comp
L R R21
U 1 1 56FAEC22
P 6700 2800
F 0 "R21" H 6770 2846 50  0000 L CNN
F 1 "10k" H 6770 2755 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 6630 2800 50  0001 C CNN
F 3 "" H 6700 2800 50  0000 C CNN
F 4 "11-10K0" H 0   0   50  0001 C CNN "HPN"
	1    6700 2800
	1    0    0    -1  
$EndComp
$Comp
L MAX3390EEUD U5
U 1 1 57DC6F49
P 4250 1750
F 0 "U5" H 4450 2350 60  0000 C CNN
F 1 "MAX3390EEUD" H 4600 1500 40  0000 C CNN
F 2 "tera_atomic_ic:MAX3390EEUD" H 4300 2600 60  0001 C CNN
F 3 "" H 4250 1750 60  0001 C CNN
F 4 "20-1501" H 0   0   50  0001 C CNN "HPN"
	1    4250 1750
	1    0    0    -1  
$EndComp
$Comp
L C C25
U 1 1 57DC929F
P 3900 1050
F 0 "C25" V 3850 1150 50  0000 C CNN
F 1 "100n" V 3850 900 50  0000 C CNN
F 2 "tera_rlc:C_0603in" H 3938 900 50  0001 C CNN
F 3 "" H 3900 1050 50  0000 C CNN
F 4 "52-100n" H 400 -200 50  0001 C CNN "HPN"
	1    3900 1050
	0    -1   -1   0   
$EndComp
$Comp
L C C26
U 1 1 57DC946D
P 5250 1300
F 0 "C26" V 4998 1300 50  0000 C CNN
F 1 "100n" V 5089 1300 50  0000 C CNN
F 2 "tera_rlc:C_0603in" H 5288 1150 50  0001 C CNN
F 3 "" H 5250 1300 50  0000 C CNN
F 4 "52-100n" H 350 0   50  0001 C CNN "HPN"
	1    5250 1300
	-1   0    0    1   
$EndComp
$Comp
L C C27
U 1 1 57DCAEE5
P 5550 1600
F 0 "C27" V 5298 1600 50  0000 C CNN
F 1 "1u" V 5389 1600 50  0000 C CNN
F 2 "tera_rlc:C_0805in" H 5588 1450 50  0001 C CNN
F 3 "" H 5550 1600 50  0000 C CNN
F 4 "52-1u00" H 450 0   50  0001 C CNN "HPN"
	1    5550 1600
	-1   0    0    1   
$EndComp
$Comp
L R R41
U 1 1 57E95229
P 2150 3400
F 0 "R41" V 2100 3500 50  0000 L CNN
F 1 "1k" V 2150 3350 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 2080 3400 50  0001 C CNN
F 3 "" H 2150 3400 50  0000 C CNN
F 4 "11-1K00" H 0   0   50  0001 C CNN "HPN"
	1    2150 3400
	1    0    0    -1  
$EndComp
$Comp
L R R42
U 1 1 57E9534B
P 2300 3400
F 0 "R42" V 2250 3500 50  0000 L CNN
F 1 "1k" V 2300 3350 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 2230 3400 50  0001 C CNN
F 3 "" H 2300 3400 50  0000 C CNN
F 4 "11-1K00" H 0   0   50  0001 C CNN "HPN"
	1    2300 3400
	1    0    0    -1  
$EndComp
$Comp
L R R43
U 1 1 57E95391
P 2450 3400
F 0 "R43" V 2400 3500 50  0000 L CNN
F 1 "1k" V 2450 3350 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 2380 3400 50  0001 C CNN
F 3 "" H 2450 3400 50  0000 C CNN
F 4 "11-1K00" H 0   0   50  0001 C CNN "HPN"
	1    2450 3400
	1    0    0    -1  
$EndComp
$Comp
L R R44
U 1 1 57E95413
P 2600 3400
F 0 "R44" V 2550 3500 50  0000 L CNN
F 1 "1k" V 2600 3350 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 2530 3400 50  0001 C CNN
F 3 "" H 2600 3400 50  0000 C CNN
F 4 "11-1K00" H 0   0   50  0001 C CNN "HPN"
	1    2600 3400
	1    0    0    -1  
$EndComp
$Comp
L SN74HC138DR U2
U 1 1 57F01901
P 3200 4000
F 0 "U2" H 3250 4550 50  0000 C CNN
F 1 "SN74HC138DR" H 3550 3450 50  0000 C CNN
F 2 "tera_atomic_ic:SN74HC138DR" H 3200 3300 50  0001 C CNN
F 3 "" H 3200 4000 50  0000 C CNN
F 4 "20-2004" H 0   0   50  0001 C CNN "HPN"
	1    3200 4000
	1    0    0    -1  
$EndComp
Text HLabel 2000 3650 0    39   Input ~ 0
CS_B0
Text HLabel 2000 3750 0    39   Input ~ 0
CS_B1
Text HLabel 2000 3850 0    39   Input ~ 0
CS_B2
Text HLabel 2000 4150 0    39   Input ~ 0
SPI_CS
Text HLabel 2450 4650 0    39   Input ~ 0
GND
Text Label 3700 3650 0    39   ~ 0
NCS1
Text Label 3700 3750 0    39   ~ 0
NCS2
Text Label 3700 3850 0    39   ~ 0
NCS3
Text Label 3700 3950 0    39   ~ 0
NCS4
Text Label 3700 4050 0    39   ~ 0
NCS5
Text Label 3700 4150 0    39   ~ 0
NCS6
Text Label 3700 4250 0    39   ~ 0
NCS7
Text Label 3700 4350 0    39   ~ 0
NCS8
Text HLabel 7100 1350 0    39   Input ~ 0
+5V
Text HLabel 7100 2150 0    39   Input ~ 0
GND
Text Label 7100 1750 2    39   ~ 0
NCS1
Text Label 7100 1850 2    39   ~ 0
NCS2
Text Label 7100 1950 2    39   ~ 0
NCS3
Text Label 7100 2050 2    39   ~ 0
NCS4
Text HLabel 3700 3150 2    39   Input ~ 0
GND
Text Label 7100 1450 2    39   ~ 0
SCLK_5V
Text Label 7100 1550 2    39   ~ 0
MISO_5V
Text Label 7100 1650 2    39   ~ 0
MOSI_5V
Text HLabel 6550 3050 0    39   Input ~ 0
GND
Text HLabel 6550 2400 0    39   Output ~ 0
NALERT
Text HLabel 6550 2500 0    39   Output ~ 0
NFAULT
Text Notes 6600 3250 0    39   ~ 0
Resistors for broken\nwire detection.
Text HLabel 4100 4050 2    39   Output ~ 0
NCS5
Text HLabel 4100 4150 2    39   Output ~ 0
NCS6
Text HLabel 4100 4250 2    39   Output ~ 0
NCS7
Text HLabel 4100 4350 2    39   Output ~ 0
NCS8
Text HLabel 3600 1750 0    39   Input ~ 0
SCLK
Text HLabel 3950 1550 0    39   Output ~ 0
MISO
Text HLabel 3600 1650 0    39   Input ~ 0
MOSI
Text HLabel 2000 3150 0    39   Input ~ 0
+5V
Text HLabel 4950 1550 2    39   Input ~ 0
MISO_5V
Text HLabel 4550 1650 2    39   Output ~ 0
MOSI_5V
Text HLabel 4550 1750 2    39   Output ~ 0
SCLK_5V
Text HLabel 2950 1400 0    39   Input ~ 0
SPI_CS
Text HLabel 5800 1050 2    39   Input ~ 0
+5V
Text HLabel 3900 900  0    39   Input ~ 0
+3V3
Text HLabel 3550 2250 0    39   Input ~ 0
GND
Text HLabel 6800 1550 0    39   Input ~ 0
MISO_5V
Text HLabel 6800 1450 0    39   Output ~ 0
SCLK_5V
Text HLabel 6800 1650 0    39   Output ~ 0
MOSI_5V
Text Notes 3300 850  0    60   ~ 0
5V SPI should be better in an noisy environment!
Text Notes 2400 2250 1    30   ~ 0
EN input should not exceed 3.3+0.4V\nIf 5V pullups are used, permanently disable thristade mode!
Text Notes 950  3400 0    30   ~ 0
Push up resistors for 5V signal.\nIf used: disable push-pull output of stm32
Wire Wire Line
	3200 4650 3200 4600
Wire Wire Line
	2450 4650 3200 4650
Wire Wire Line
	2700 4250 2650 4250
Wire Wire Line
	2650 4250 2650 4650
Wire Wire Line
	2700 4350 2650 4350
Wire Wire Line
	3200 3150 3200 3400
Wire Wire Line
	2000 3150 3350 3150
Wire Wire Line
	3700 3150 3650 3150
Wire Wire Line
	6550 3050 6950 3050
Wire Wire Line
	6950 3050 6950 2950
Wire Wire Line
	6700 2950 6700 3050
Wire Wire Line
	6550 2500 7100 2500
Wire Wire Line
	6550 2400 7100 2400
Wire Wire Line
	4100 4350 3700 4350
Wire Wire Line
	3700 4250 4100 4250
Wire Wire Line
	3700 4150 4100 4150
Wire Wire Line
	3700 4050 4100 4050
Wire Wire Line
	6800 1450 7100 1450
Wire Wire Line
	6800 1550 7100 1550
Wire Wire Line
	6800 1650 7100 1650
Wire Wire Line
	6700 2650 6700 2500
Wire Wire Line
	6950 2650 6950 2400
Wire Wire Line
	4350 1050 4350 1150
Wire Wire Line
	4150 900  4150 1150
Wire Wire Line
	3950 1850 3900 1850
Wire Wire Line
	3900 1850 3900 2250
Wire Wire Line
	4350 1050 5800 1050
Wire Wire Line
	5250 1050 5250 1150
Wire Wire Line
	5250 2250 5250 1450
Wire Wire Line
	3550 2250 5550 2250
Wire Wire Line
	4250 2050 4250 2250
Wire Wire Line
	5550 1050 5550 1450
Wire Wire Line
	5550 2250 5550 1750
Wire Wire Line
	2000 3650 2700 3650
Wire Wire Line
	2000 3750 2700 3750
Wire Wire Line
	2000 3850 2700 3850
Wire Wire Line
	2000 4150 2700 4150
Wire Wire Line
	2150 3550 2150 3650
Wire Wire Line
	2300 3550 2300 3750
Wire Wire Line
	2450 3550 2450 3850
Wire Wire Line
	2600 3550 2600 4150
Wire Wire Line
	2150 3250 2150 3150
Wire Wire Line
	2300 3250 2300 3150
Wire Wire Line
	2450 3250 2450 3150
Wire Wire Line
	2600 3250 2600 3150
Connection ~ 2650 4650
Connection ~ 2650 4350
Connection ~ 3200 3150
Connection ~ 6700 3050
Connection ~ 6700 2500
Connection ~ 6950 2400
Connection ~ 3900 2250
Connection ~ 5250 1050
Connection ~ 4250 2250
Connection ~ 5550 1050
Connection ~ 5250 2250
Connection ~ 2150 3650
Connection ~ 2300 3750
Connection ~ 2450 3850
Connection ~ 2600 4150
Connection ~ 2150 3150
Connection ~ 2300 3150
Connection ~ 2450 3150
Connection ~ 2600 3150
NoConn ~ 4550 1850
Wire Wire Line
	3600 1650 3950 1650
Wire Wire Line
	3600 1750 3950 1750
$Comp
L R R?
U 1 1 591AEA93
P 3650 2000
F 0 "R?" V 3600 2100 50  0000 L CNN
F 1 "1k" V 3650 1950 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 3580 2000 50  0001 C CNN
F 3 "" H 3650 2000 50  0000 C CNN
F 4 "11-1K00" H 1050 -1400 50  0001 C CNN "HPN"
	1    3650 2000
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 591AF49D
P 3800 2000
F 0 "R?" V 3750 2100 50  0000 L CNN
F 1 "1k" V 3800 1950 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 3730 2000 50  0001 C CNN
F 3 "" H 3800 2000 50  0000 C CNN
F 4 "11-1K00" H 1200 -1400 50  0001 C CNN "HPN"
	1    3800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1850 3650 1650
Connection ~ 3650 1650
Wire Wire Line
	3800 1850 3800 1750
Connection ~ 3800 1750
Wire Wire Line
	3800 2150 3800 2250
Connection ~ 3800 2250
Wire Wire Line
	3650 2150 3650 2250
Connection ~ 3650 2250
Wire Wire Line
	4550 1550 4950 1550
$Comp
L R R?
U 1 1 591B0EA8
P 4900 2000
F 0 "R?" V 4850 2100 50  0000 L CNN
F 1 "1k" V 4900 1950 50  0000 L CNN
F 2 "tera_rlc:R_0805in" V 4830 2000 50  0001 C CNN
F 3 "" H 4900 2000 50  0000 C CNN
F 4 "11-1K00" H 2300 -1400 50  0001 C CNN "HPN"
	1    4900 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1850 4900 1550
Connection ~ 4900 1550
Wire Wire Line
	4900 2150 4900 2250
Connection ~ 4900 2250
Wire Wire Line
	3900 900  4150 900 
Wire Wire Line
	4050 1050 4150 1050
Connection ~ 4150 1050
Text HLabel 3700 1050 0    39   Input ~ 0
GND
Wire Wire Line
	3700 1050 3750 1050
$EndSCHEMATC
