EESchema Schematic File Version 4
LIBS:BMS_Master_V6_kicad-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 16
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
L Connector_Generic:Conn_01x02 P22
U 1 1 572C6E5A
P 2650 1650
F 0 "P22" H 2569 1369 50  0000 C CNN
F 1 "TS1" H 2569 1460 50  0000 C CNN
F 2 "tera_Connectors_Molex:Molex_PicoBlade_53398-0271_02x1.25mm_Straight" H 2650 1650 50  0001 C CNN
F 3 "" H 2650 1650 50  0000 C CNN
F 4 "03-0202" H 0   50  50  0001 C CNN "HPN"
	1    2650 1650
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R34
U 1 1 572C6F84
P 2950 1800
F 0 "R34" H 3009 1846 50  0000 L CNN
F 1 "?R" H 3009 1755 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 2950 1800 50  0001 C CNN
F 3 "" H 2950 1800 50  0000 C CNN
	1    2950 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C18
U 1 1 572C6FE8
P 3250 1800
F 0 "C18" H 3342 1846 50  0000 L CNN
F 1 "100n" H 3342 1755 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 3250 1800 50  0001 C CNN
F 3 "" H 3250 1800 50  0000 C CNN
F 4 "52-100n" H 0   0   50  0001 C CNN "HPN"
	1    3250 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R36
U 1 1 572C707A
P 3250 2100
F 0 "R36" H 3309 2146 50  0000 L CNN
F 1 "?R" H 3309 2055 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 3250 2100 50  0001 C CNN
F 3 "" H 3250 2100 50  0000 C CNN
	1    3250 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small D25
U 1 1 572C7151
P 3500 2100
F 0 "D25" V 3454 2169 50  0000 L CNN
F 1 "3V3" V 3545 2169 50  0000 L CNN
F 2 "tera_diodes:uClamp3310D_tvs_3v3" H 3500 2100 50  0001 C CNN
F 3 "" H 3500 2100 50  0000 C CNN
F 4 "21-9001" H 0   0   50  0001 C CNN "HPN"
	1    3500 2100
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P21
U 1 1 572C83C4
P 2600 2750
F 0 "P21" H 2519 2469 50  0000 C CNN
F 1 "TS3" H 2519 2560 50  0000 C CNN
F 2 "tera_Connectors_Molex:Molex_PicoBlade_53398-0271_02x1.25mm_Straight" H 2600 2750 50  0001 C CNN
F 3 "" H 2600 2750 50  0000 C CNN
F 4 "03-0202" H 0   50  50  0001 C CNN "HPN"
	1    2600 2750
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R33
U 1 1 572C83CA
P 2900 2900
F 0 "R33" H 2959 2946 50  0000 L CNN
F 1 "?R" H 2959 2855 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 2900 2900 50  0001 C CNN
F 3 "" H 2900 2900 50  0000 C CNN
	1    2900 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C17
U 1 1 572C83D0
P 3200 2900
F 0 "C17" H 3292 2946 50  0000 L CNN
F 1 "100n" H 3292 2855 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 3200 2900 50  0001 C CNN
F 3 "" H 3200 2900 50  0000 C CNN
F 4 "52-100n" H 0   0   50  0001 C CNN "HPN"
	1    3200 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R35
U 1 1 572C83D6
P 3200 3200
F 0 "R35" H 3259 3246 50  0000 L CNN
F 1 "?R" H 3259 3155 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 3200 3200 50  0001 C CNN
F 3 "" H 3200 3200 50  0000 C CNN
	1    3200 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small D24
U 1 1 572C83DC
P 3450 3200
F 0 "D24" V 3404 3269 50  0000 L CNN
F 1 "3V3" V 3495 3269 50  0000 L CNN
F 2 "tera_diodes:uClamp3310D_tvs_3v3" H 3450 3200 50  0001 C CNN
F 3 "" H 3450 3200 50  0000 C CNN
F 4 "21-9001" H 0   0   50  0001 C CNN "HPN"
	1    3450 3200
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P24
U 1 1 572C8835
P 4500 1650
F 0 "P24" H 4419 1369 50  0000 C CNN
F 1 "TS2" H 4419 1460 50  0000 C CNN
F 2 "tera_Connectors_Molex:Molex_PicoBlade_53398-0271_02x1.25mm_Straight" H 4500 1650 50  0001 C CNN
F 3 "" H 4500 1650 50  0000 C CNN
F 4 "03-0202" H 0   50  50  0001 C CNN "HPN"
	1    4500 1650
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R38
U 1 1 572C883B
P 4800 1800
F 0 "R38" H 4859 1846 50  0000 L CNN
F 1 "?R" H 4859 1755 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 4800 1800 50  0001 C CNN
F 3 "" H 4800 1800 50  0000 C CNN
	1    4800 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C20
U 1 1 572C8841
P 5100 1800
F 0 "C20" H 5192 1846 50  0000 L CNN
F 1 "100n" H 5192 1755 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 5100 1800 50  0001 C CNN
F 3 "" H 5100 1800 50  0000 C CNN
F 4 "52-100n" H 0   0   50  0001 C CNN "HPN"
	1    5100 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R40
U 1 1 572C8847
P 5100 2100
F 0 "R40" H 5159 2146 50  0000 L CNN
F 1 "?R" H 5159 2055 50  0000 L CNN
F 2 "tera_rlc:R_0603in" H 5100 2100 50  0001 C CNN
F 3 "" H 5100 2100 50  0000 C CNN
	1    5100 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener_Small D27
U 1 1 572C884D
P 5350 2100
F 0 "D27" V 5304 2169 50  0000 L CNN
F 1 "3V3" V 5395 2169 50  0000 L CNN
F 2 "tera_diodes:uClamp3310D_tvs_3v3" H 5350 2100 50  0001 C CNN
F 3 "" H 5350 2100 50  0000 C CNN
F 4 "21-9001" H 0   0   50  0001 C CNN "HPN"
	1    5350 2100
	0    1    1    0   
$EndComp
$Comp
L Supply:LT1461ACS8-5 IC8
U 1 1 56FBE7B0
P 9000 1700
F 0 "IC8" H 9000 2037 60  0000 C CNN
F 1 "LT1461ACS8-5" H 9000 1931 60  0000 C CNN
F 2 "tera_atomic_ic:LT1461ACS8" H 9000 2100 60  0001 C CNN
F 3 "" H 9000 1600 60  0000 C CNN
F 4 "23-2002" H 0   0   50  0001 C CNN "HPN"
	1    9000 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C21
U 1 1 56FBEF9A
P 8250 1750
F 0 "C21" H 8342 1796 50  0000 L CNN
F 1 "1u" H 8342 1705 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 8250 1750 50  0001 C CNN
F 3 "" H 8250 1750 50  0000 C CNN
F 4 "52-1u00" H 0   0   50  0001 C CNN "HPN"
	1    8250 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C22
U 1 1 56FBF749
P 9450 1700
F 0 "C22" H 9542 1746 50  0000 L CNN
F 1 "2u2" H 9542 1655 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 9450 1700 50  0001 C CNN
F 3 "" H 9450 1700 50  0000 C CNN
F 4 "52-2u20" H 0   0   50  0001 C CNN "HPN"
	1    9450 1700
	1    0    0    -1  
$EndComp
Text HLabel 3100 2250 0    39   Input ~ 0
GND
Text HLabel 3700 1950 2    39   Output ~ 0
TS1
Text Label 2850 1550 0    39   ~ 0
V_ref
Text HLabel 3050 3350 0    39   Input ~ 0
GND
Text HLabel 3650 3050 2    39   Output ~ 0
TS3
Text Label 2800 2650 0    39   ~ 0
V_ref
Text HLabel 4950 2250 0    39   Input ~ 0
GND
Text HLabel 5550 1950 2    39   Output ~ 0
TS2
Text Label 4700 1550 0    39   ~ 0
V_ref
Text HLabel 8150 1900 0    39   Input ~ 0
GND
Text HLabel 8150 1600 0    39   Input ~ 0
+12V
Text Label 9750 1600 0    39   ~ 0
V_ref
Text HLabel 8700 1700 0    39   Input ~ 0
~SHDN
Wire Wire Line
	2950 1650 2950 1700
Wire Wire Line
	3250 1550 3250 1700
Wire Wire Line
	3250 1900 3250 1950
Wire Wire Line
	2950 1950 3250 1950
Wire Wire Line
	2950 1950 2950 1900
Wire Wire Line
	3500 1950 3500 2000
Wire Wire Line
	3250 2200 3250 2250
Wire Wire Line
	3100 2250 3250 2250
Wire Wire Line
	3500 2250 3500 2200
Wire Wire Line
	2950 1650 2850 1650
Wire Wire Line
	3250 1550 2850 1550
Wire Wire Line
	2900 2750 2900 2800
Wire Wire Line
	3200 2650 3200 2800
Wire Wire Line
	3200 3000 3200 3050
Wire Wire Line
	2900 3050 3200 3050
Wire Wire Line
	2900 3050 2900 3000
Wire Wire Line
	3450 3050 3450 3100
Wire Wire Line
	3200 3300 3200 3350
Wire Wire Line
	3050 3350 3200 3350
Wire Wire Line
	3450 3350 3450 3300
Wire Wire Line
	2900 2750 2800 2750
Wire Wire Line
	3200 2650 2800 2650
Wire Wire Line
	4800 1650 4800 1700
Wire Wire Line
	5100 1550 5100 1700
Wire Wire Line
	5100 1900 5100 1950
Wire Wire Line
	4800 1950 5100 1950
Wire Wire Line
	4800 1950 4800 1900
Wire Wire Line
	5350 1950 5350 2000
Wire Wire Line
	5100 2200 5100 2250
Wire Wire Line
	4950 2250 5100 2250
Wire Wire Line
	5350 2250 5350 2200
Wire Wire Line
	4800 1650 4700 1650
Wire Wire Line
	5100 1550 4700 1550
Wire Wire Line
	9300 1600 9450 1600
Wire Wire Line
	8150 1600 8250 1600
Wire Wire Line
	8250 1650 8250 1600
Wire Wire Line
	8250 1850 8250 1900
Wire Wire Line
	8150 1900 8250 1900
Wire Wire Line
	8700 1900 8700 1800
Wire Wire Line
	9450 1900 9450 1800
Connection ~ 3250 2250
Connection ~ 3500 1950
Connection ~ 3250 1950
Connection ~ 3200 3350
Connection ~ 3450 3050
Connection ~ 3200 3050
Connection ~ 5100 2250
Connection ~ 5350 1950
Connection ~ 5100 1950
Connection ~ 8700 1900
Connection ~ 9450 1600
Connection ~ 8250 1600
Connection ~ 8250 1900
Wire Wire Line
	3250 2250 3500 2250
Wire Wire Line
	3500 1950 3700 1950
Wire Wire Line
	3250 1950 3250 2000
Wire Wire Line
	3250 1950 3500 1950
Wire Wire Line
	3200 3350 3450 3350
Wire Wire Line
	3450 3050 3650 3050
Wire Wire Line
	3200 3050 3200 3100
Wire Wire Line
	3200 3050 3450 3050
Wire Wire Line
	5100 2250 5350 2250
Wire Wire Line
	5350 1950 5550 1950
Wire Wire Line
	5100 1950 5100 2000
Wire Wire Line
	5100 1950 5350 1950
Wire Wire Line
	8700 1900 9450 1900
Wire Wire Line
	9450 1600 9750 1600
Wire Wire Line
	8250 1600 8700 1600
Wire Wire Line
	8250 1900 8700 1900
$EndSCHEMATC
