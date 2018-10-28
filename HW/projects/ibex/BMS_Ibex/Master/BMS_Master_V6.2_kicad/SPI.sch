EESchema Schematic File Version 4
LIBS:BMS_Master_V6_kicad-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 16
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
L Device:C C14
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
L tera_logic:MAX3390EEUD U5
U 1 1 57DC6F49
P 4250 1750
F 0 "U5" H 4450 2350 60  0000 C CNN
F 1 "MAX3390EEUD" H 4500 1500 40  0000 C CNN
F 2 "tera_atomic_ic:MAX3390EEUD" H 4300 2600 60  0001 C CNN
F 3 "" H 4250 1750 60  0001 C CNN
F 4 "20-1501" H 0   0   50  0001 C CNN "HPN"
	1    4250 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C25
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
L Device:C C26
U 1 1 57DC946D
P 4750 1100
F 0 "C26" V 4498 1100 50  0000 C CNN
F 1 "100n" V 4589 1100 50  0000 C CNN
F 2 "tera_rlc:C_0603in" H 4788 950 50  0001 C CNN
F 3 "" H 4750 1100 50  0000 C CNN
F 4 "52-100n" H -150 -200 50  0001 C CNN "HPN"
	1    4750 1100
	-1   0    0    1   
$EndComp
$Comp
L Device:C C27
U 1 1 57DCAEE5
P 5200 1100
F 0 "C27" V 4948 1100 50  0000 C CNN
F 1 "1u" V 5039 1100 50  0000 C CNN
F 2 "tera_rlc:C_0805in" H 5238 950 50  0001 C CNN
F 3 "" H 5200 1100 50  0000 C CNN
F 4 "52-1u00" H 100 -500 50  0001 C CNN "HPN"
	1    5200 1100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R41
U 1 1 57E95229
P 2150 3400
F 0 "R41" V 2100 3500 50  0000 L CNN
F 1 "1k" V 2150 3350 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 2080 3400 50  0001 C CNN
F 3 "" H 2150 3400 50  0000 C CNN
F 4 "11-1K00" H 0   0   50  0001 C CNN "HPN"
	1    2150 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R42
U 1 1 57E9534B
P 2300 3400
F 0 "R42" V 2250 3500 50  0000 L CNN
F 1 "1k" V 2300 3350 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 2230 3400 50  0001 C CNN
F 3 "" H 2300 3400 50  0000 C CNN
F 4 "11-1K00" H 0   0   50  0001 C CNN "HPN"
	1    2300 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R43
U 1 1 57E95391
P 2450 3400
F 0 "R43" V 2400 3500 50  0000 L CNN
F 1 "1k" V 2450 3350 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 2380 3400 50  0001 C CNN
F 3 "" H 2450 3400 50  0000 C CNN
F 4 "11-1K00" H 0   0   50  0001 C CNN "HPN"
	1    2450 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R44
U 1 1 57E95413
P 2000 4250
F 0 "R44" V 1950 4350 50  0000 L CNN
F 1 "10k" V 2000 4200 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 1930 4250 50  0001 C CNN
F 3 "" H 2000 4250 50  0000 C CNN
F 4 "11-10K0" H -600 850 50  0001 C CNN "HPN"
	1    2000 4250
	0    1    1    0   
$EndComp
$Comp
L tera_logic:SN74HC138DR U2
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
Text HLabel 1650 4500 0    39   Input ~ 0
SPI_CS
Text HLabel 1650 4650 0    39   Input ~ 0
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
Text HLabel 3700 3150 2    39   Input ~ 0
GND
Text HLabel 9250 1950 0    39   Output ~ 0
NALERT
Text HLabel 9250 1850 0    39   Output ~ 0
NFAULT
Text HLabel 4100 4050 2    39   Output ~ 0
NCS5
Text HLabel 4100 4150 2    39   Output ~ 0
NCS6
Text HLabel 4100 4250 2    39   Output ~ 0
NCS7
Text HLabel 4100 4350 2    39   Output ~ 0
NCS8
Text HLabel 2250 1750 0    39   Input ~ 0
SCLK
Text HLabel 2250 1550 0    39   Output ~ 0
MISO
Text HLabel 2250 1650 0    39   Input ~ 0
MOSI
Text HLabel 2000 3150 0    39   Input ~ 0
+5V
Text HLabel 4700 1550 2    39   Input ~ 0
MISO_5V
Text HLabel 4700 1650 2    39   Output ~ 0
MOSI_5V
Text HLabel 4700 1750 2    39   Output ~ 0
SCLK_5V
Text HLabel 3800 1350 0    39   Input ~ 0
SPI_CS
Text HLabel 5800 850  2    39   Input ~ 0
+5V
Text HLabel 3900 900  0    39   Input ~ 0
+3V3
Text HLabel 9250 2150 0    39   Input ~ 0
MISO_5V
Text HLabel 9250 2350 0    39   Output ~ 0
SCLK_5V
Text HLabel 9250 2250 0    39   Output ~ 0
MOSI_5V
Text Notes 950  3400 0    30   ~ 0
Push up resistors for 5V signal.\nIf used: disable push-pull output of stm32
NoConn ~ 4550 1850
$Comp
L Device:R R24
U 1 1 591AEA93
P 3200 1550
F 0 "R24" V 3150 1650 50  0000 L CNN
F 1 "100R" V 3200 1450 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 3130 1550 50  0001 C CNN
F 3 "" H 3200 1550 50  0000 C CNN
F 4 "11-100R" H 600 -1850 50  0001 C CNN "HPN"
	1    3200 1550
	0    1    1    0   
$EndComp
$Comp
L Device:R R25
U 1 1 591AF49D
P 3200 1650
F 0 "R25" V 3150 1750 50  0000 L CNN
F 1 "100R" V 3200 1550 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 3130 1650 50  0001 C CNN
F 3 "" H 3200 1650 50  0000 C CNN
F 4 "11-100R" H 600 -1750 50  0001 C CNN "HPN"
	1    3200 1650
	0    1    1    0   
$EndComp
$Comp
L Device:R R26
U 1 1 591B0EA8
P 3200 1750
F 0 "R26" V 3150 1850 50  0000 L CNN
F 1 "100R" V 3200 1650 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 3130 1750 50  0001 C CNN
F 3 "" H 3200 1750 50  0000 C CNN
F 4 "11-100R" H 600 -1650 50  0001 C CNN "HPN"
	1    3200 1750
	0    1    1    0   
$EndComp
Text HLabel 3700 1050 0    39   Input ~ 0
GND
Text HLabel 4700 1350 0    39   Input ~ 0
GND
NoConn ~ 3950 1850
$Comp
L tera_general:BSS205N Q6
U 1 1 5AB56673
P 2200 4500
F 0 "Q6" H 2287 4596 50  0000 L CNN
F 1 "BSS205N" H 2287 4505 50  0000 L CNN
F 2 "tera_atomic_infineon:BSS205N" H 2300 4475 50  0001 L CIN
F 3 "" H 2300 4625 50  0000 L CNN
F 4 "24-2050" H 2500 4400 60  0001 C CNN "HPN"
	1    2200 4500
	1    0    0    -1  
$EndComp
Text HLabel 1650 4250 0    39   Input ~ 0
+5V
Text HLabel 2650 4150 0    39   Input ~ 0
+5V
Text HLabel 4250 2200 3    39   Input ~ 0
GND
Wire Wire Line
	3200 4650 3200 4600
Wire Wire Line
	1650 4650 2200 4650
Wire Wire Line
	2700 4350 2650 4350
Wire Wire Line
	3200 3150 3200 3400
Wire Wire Line
	2000 3150 2150 3150
Wire Wire Line
	3700 3150 3650 3150
Wire Wire Line
	4100 4350 3700 4350
Wire Wire Line
	3700 4250 4100 4250
Wire Wire Line
	3700 4150 4100 4150
Wire Wire Line
	3700 4050 4100 4050
Wire Wire Line
	4350 850  4350 1150
Wire Wire Line
	4150 900  4150 1050
Wire Wire Line
	4350 850  4750 850 
Wire Wire Line
	4750 850  4750 950 
Wire Wire Line
	5200 850  5200 950 
Wire Wire Line
	2000 3650 2150 3650
Wire Wire Line
	2000 3750 2300 3750
Wire Wire Line
	2000 3850 2450 3850
Wire Wire Line
	2150 3550 2150 3650
Wire Wire Line
	2300 3550 2300 3750
Wire Wire Line
	2450 3550 2450 3850
Wire Wire Line
	2150 3250 2150 3150
Wire Wire Line
	2300 3250 2300 3150
Wire Wire Line
	2450 3250 2450 3150
Connection ~ 2650 4650
Connection ~ 3200 3150
Connection ~ 4750 850 
Connection ~ 5200 850 
Connection ~ 2150 3650
Connection ~ 2300 3750
Connection ~ 2450 3850
Connection ~ 2150 3150
Connection ~ 2300 3150
Connection ~ 2450 3150
Wire Wire Line
	3900 900  4150 900 
Wire Wire Line
	4050 1050 4150 1050
Connection ~ 4150 1050
Wire Wire Line
	3700 1050 3750 1050
Wire Wire Line
	4700 1350 4750 1350
Wire Wire Line
	5200 1350 5200 1250
Wire Wire Line
	4750 1250 4750 1350
Connection ~ 4750 1350
Wire Wire Line
	2250 1550 2900 1550
Wire Wire Line
	2250 1650 2650 1650
Wire Wire Line
	2250 1750 2400 1750
Wire Wire Line
	3350 1550 3950 1550
Wire Wire Line
	3350 1650 3950 1650
Wire Wire Line
	3350 1750 3950 1750
Wire Wire Line
	2650 4350 2650 4650
Wire Wire Line
	2150 4250 2200 4250
Wire Wire Line
	2200 4300 2200 4250
Wire Wire Line
	1650 4500 2000 4500
Wire Wire Line
	2200 4600 2200 4650
Connection ~ 2200 4650
Connection ~ 2200 4250
Wire Wire Line
	1650 4250 1850 4250
Wire Wire Line
	2650 4150 2700 4150
Wire Wire Line
	3950 1350 3800 1350
Wire Wire Line
	4250 2200 4250 2050
Wire Wire Line
	4700 1550 4550 1550
Wire Wire Line
	4700 1650 4550 1650
Wire Wire Line
	4700 1750 4550 1750
Text Label 10150 2050 0    39   ~ 0
NCS1
Text Label 10150 2150 0    39   ~ 0
NCS2
Text Label 10150 2250 0    39   ~ 0
NCS3
Text Label 10150 2350 0    39   ~ 0
NCS4
$Comp
L Device:D_Zener_Small D12
U 1 1 5AB82098
P 2400 1950
F 0 "D12" V 2354 2019 50  0000 L CNN
F 1 "3V3" V 2445 2019 50  0000 L CNN
F 2 "tera_diodes:uClamp3310D_tvs_3v3" H 2400 1950 50  0001 C CNN
F 3 "" H 2400 1950 50  0000 C CNN
	1    2400 1950
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener_Small D13
U 1 1 5AB87A9C
P 2650 1950
F 0 "D13" V 2604 2019 50  0000 L CNN
F 1 "3V3" V 2695 2019 50  0000 L CNN
F 2 "tera_diodes:uClamp3310D_tvs_3v3" H 2650 1950 50  0001 C CNN
F 3 "" H 2650 1950 50  0000 C CNN
	1    2650 1950
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener_Small D28
U 1 1 5AB88518
P 2900 1950
F 0 "D28" V 2854 2019 50  0000 L CNN
F 1 "3V3" V 2945 2019 50  0000 L CNN
F 2 "tera_diodes:uClamp3310D_tvs_3v3" H 2900 1950 50  0001 C CNN
F 3 "" H 2900 1950 50  0000 C CNN
	1    2900 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 1750 2400 1850
Wire Wire Line
	2650 1650 2650 1850
Wire Wire Line
	2900 1550 2900 1850
Connection ~ 2900 1550
Connection ~ 2650 1650
Connection ~ 2400 1750
Text HLabel 2650 2200 3    39   Input ~ 0
GND
Wire Wire Line
	2400 2050 2400 2100
Wire Wire Line
	2400 2100 2650 2100
Wire Wire Line
	2900 2100 2900 2050
Wire Wire Line
	2650 2050 2650 2100
Connection ~ 2650 2100
$Comp
L Device:Jumper_NO_Small JP5
U 1 1 5AB95AF1
P 4250 2550
F 0 "JP5" H 4250 2600 50  0000 C CNN
F 1 "Jumper_NO_Small" H 4260 2490 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2_1mm" H 4250 2644 50  0001 C CNN
F 3 "" H 4250 2550 50  0000 C CNN
	1    4250 2550
	1    0    0    -1  
$EndComp
Text Label 3950 1750 2    40   ~ 0
SCLK_3V3
Text Label 3950 1650 2    40   ~ 0
MOSI_3V3
Text Label 3950 1550 2    40   ~ 0
MISO_3V3
Text Label 4150 2550 2    40   ~ 0
MISO_3V3
Text HLabel 4350 2550 2    39   Input ~ 0
MISO_5V
Text HLabel 4350 2700 2    39   Output ~ 0
MOSI_5V
Text HLabel 4350 2850 2    39   Output ~ 0
SCLK_5V
Text Label 4150 2700 2    40   ~ 0
MOSI_3V3
Text Label 4150 2850 2    40   ~ 0
SCLK_3V3
$Comp
L Device:Jumper_NO_Small JP6
U 1 1 5AB98DF0
P 4250 2700
F 0 "JP6" H 4250 2750 50  0000 C CNN
F 1 "Jumper_NO_Small" H 4260 2640 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2_1mm" H 4250 2794 50  0001 C CNN
F 3 "" H 4250 2700 50  0000 C CNN
	1    4250 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP7
U 1 1 5AB98EB9
P 4250 2850
F 0 "JP7" H 4250 2900 50  0000 C CNN
F 1 "Jumper_NO_Small" H 4260 2790 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2_1mm" H 4250 2944 50  0001 C CNN
F 3 "" H 4250 2850 50  0000 C CNN
	1    4250 2850
	1    0    0    -1  
$EndComp
$Comp
L local_symbols:HostFilter U3
U 1 1 5AB57BA8
P 9700 2100
AR Path="/5AB57BA8" Ref="U3"  Part="1" 
AR Path="/56F507C6/5AB57BA8" Ref="U3"  Part="1" 
F 0 "U3" H 9700 2675 50  0000 C CNN
F 1 "HostFilter" H 9700 2584 50  0000 C CNN
F 2 "local_footprints:HostFilter" H 9700 2583 50  0001 C CNN
F 3 "" H 9700 900 50  0000 C CNN
	1    9700 2100
	1    0    0    -1  
$EndComp
Text HLabel 9250 2050 0    39   Input ~ 0
GND
Text HLabel 9250 1750 0    39   Input ~ 0
GND
Text HLabel 9250 2450 0    39   Input ~ 0
GND
Text HLabel 10150 2450 2    39   Input ~ 0
GND
Text HLabel 10150 1950 2    39   Input ~ 0
GND
Text HLabel 10150 1850 2    39   Input ~ 0
+5V
Text HLabel 10150 1750 2    39   Input ~ 0
+12V
Wire Wire Line
	2650 4650 3200 4650
Wire Wire Line
	3200 3150 3350 3150
Wire Wire Line
	4750 850  5200 850 
Wire Wire Line
	5200 850  5800 850 
Wire Wire Line
	2150 3650 2700 3650
Wire Wire Line
	2300 3750 2700 3750
Wire Wire Line
	2450 3850 2700 3850
Wire Wire Line
	2150 3150 2300 3150
Wire Wire Line
	2300 3150 2450 3150
Wire Wire Line
	2450 3150 3200 3150
Wire Wire Line
	4150 1050 4150 1150
Wire Wire Line
	4750 1350 5200 1350
Wire Wire Line
	2200 4650 2650 4650
Wire Wire Line
	2200 4250 2700 4250
Wire Wire Line
	2900 1550 3050 1550
Wire Wire Line
	2650 1650 3050 1650
Wire Wire Line
	2400 1750 3050 1750
Wire Wire Line
	2650 2100 2900 2100
Wire Wire Line
	2650 2100 2650 2200
$EndSCHEMATC
