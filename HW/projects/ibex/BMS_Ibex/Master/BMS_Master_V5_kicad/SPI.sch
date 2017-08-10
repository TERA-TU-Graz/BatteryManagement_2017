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
Sheet 11 16
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
L 74LS138 U2
U 1 1 56FACF28
P 3300 4000
F 0 "U2" H 3550 4650 50  0000 C CNN
F 1 "74LS138" H 3550 4550 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 3300 4000 50  0001 C CNN
F 3 "" H 3300 4000 50  0000 C CNN
	1    3300 4000
	1    0    0    -1  
$EndComp
Text HLabel 2700 3650 0    39   Input ~ 0
CS_B0
Text HLabel 2700 3750 0    39   Input ~ 0
CS_B1
Text HLabel 2700 3850 0    39   Input ~ 0
CS_B2
Text HLabel 2700 4150 0    39   Input ~ 0
SPI_CS
Text HLabel 2450 4500 0    39   Input ~ 0
GND
Wire Wire Line
	3300 4500 3300 4450
Wire Wire Line
	2450 4500 3300 4500
Wire Wire Line
	2700 4250 2650 4250
Wire Wire Line
	2650 4250 2650 4500
Connection ~ 2650 4500
Wire Wire Line
	2700 4350 2650 4350
Connection ~ 2650 4350
Wire Wire Line
	3300 3550 3300 3150
Wire Wire Line
	3050 3150 3350 3150
Text Label 3900 3650 0    39   ~ 0
NCS1
Text Label 3900 3750 0    39   ~ 0
NCS2
Text Label 3900 3850 0    39   ~ 0
NCS3
Text Label 3900 3950 0    39   ~ 0
NCS4
Text Label 3900 4050 0    39   ~ 0
NCS5
Text Label 3900 4150 0    39   ~ 0
NCS6
Text Label 3900 4250 0    39   ~ 0
NCS7
Text Label 3900 4350 0    39   ~ 0
NCS8
$Comp
L CONN_01X09 P15
U 1 1 56FAD51B
P 7300 1750
F 0 "P15" H 7218 1119 50  0000 C CNN
F 1 "CONN_01X09" H 7218 1210 50  0000 C CNN
F 2 "Connectors_Molex:Molex_PicoBlade_53398-0971" H 7300 1750 50  0001 C CNN
F 3 "" H 7300 1750 50  0000 C CNN
	1    7300 1750
	1    0    0    1   
$EndComp
Text HLabel 7100 1350 0    39   Input ~ 0
+3V3
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
$Comp
L C C14
U 1 1 56FADBA9
P 3500 3150
F 0 "C14" V 3248 3150 50  0000 C CNN
F 1 "100n" V 3339 3150 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 3538 3000 50  0001 C CNN
F 3 "" H 3500 3150 50  0000 C CNN
	1    3500 3150
	0    1    1    0   
$EndComp
Connection ~ 3300 3150
Text HLabel 3700 3150 2    39   Input ~ 0
GND
Wire Wire Line
	3700 3150 3650 3150
Text Label 7100 1450 2    39   ~ 0
SCLK
Text Label 7100 1550 2    39   ~ 0
MISO
Text Label 7100 1650 2    39   ~ 0
MOSI
$Comp
L CONN_01X02 P16
U 1 1 56FAEA99
P 7300 2450
F 0 "P16" H 7378 2488 50  0000 L CNN
F 1 "CONN_01X02" H 7378 2397 50  0000 L CNN
F 2 "Connectors_JST:JST_XH_B02B-XH-A_02x2.50mm_Straight" H 7300 2450 50  0001 C CNN
F 3 "" H 7300 2450 50  0000 C CNN
	1    7300 2450
	1    0    0    1   
$EndComp
$Comp
L R R22
U 1 1 56FAEBAB
P 6950 2800
F 0 "R22" H 7020 2846 50  0000 L CNN
F 1 "10k" H 7020 2755 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 6880 2800 50  0001 C CNN
F 3 "" H 6950 2800 50  0000 C CNN
	1    6950 2800
	1    0    0    -1  
$EndComp
$Comp
L R R21
U 1 1 56FAEC22
P 6700 2800
F 0 "R21" H 6770 2846 50  0000 L CNN
F 1 "10k" H 6770 2755 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 6630 2800 50  0001 C CNN
F 3 "" H 6700 2800 50  0000 C CNN
	1    6700 2800
	1    0    0    -1  
$EndComp
Text HLabel 6550 3050 0    39   Input ~ 0
GND
Wire Wire Line
	6550 3050 6950 3050
Wire Wire Line
	6950 3050 6950 2950
Wire Wire Line
	6700 2950 6700 3050
Connection ~ 6700 3050
Wire Wire Line
	6550 2500 7100 2500
Wire Wire Line
	6550 2400 7100 2400
Text HLabel 6550 2400 0    39   Output ~ 0
NALERT
Text HLabel 6550 2500 0    39   Output ~ 0
NFAULT
Text Notes 6600 3250 0    39   ~ 0
Resistors for broken\nwire detection.
Text HLabel 4300 4050 2    39   Output ~ 0
NCS5
Text HLabel 4300 4150 2    39   Output ~ 0
NCS6
Text HLabel 4300 4250 2    39   Output ~ 0
NCS7
Text HLabel 4300 4350 2    39   Output ~ 0
NCS8
Wire Wire Line
	4300 4350 3900 4350
Wire Wire Line
	3900 4250 4300 4250
Wire Wire Line
	3900 4150 4300 4150
Wire Wire Line
	3900 4050 4300 4050
Text HLabel 6800 1450 0    39   Input ~ 0
SCLK
Text HLabel 6800 1550 0    39   Output ~ 0
MISO
Text HLabel 6800 1650 0    39   Input ~ 0
MOSI
Wire Wire Line
	6800 1450 7100 1450
Wire Wire Line
	6800 1550 7100 1550
Wire Wire Line
	6800 1650 7100 1650
Text HLabel 3050 3150 0    39   Input ~ 0
+3V3
Wire Wire Line
	6700 2650 6700 2500
Connection ~ 6700 2500
Wire Wire Line
	6950 2650 6950 2400
Connection ~ 6950 2400
$EndSCHEMATC
