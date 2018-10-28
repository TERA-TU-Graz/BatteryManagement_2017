EESchema Schematic File Version 4
LIBS:bms_board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 17
Title "BMS Monitor / Balancer for Fennek 2017"
Date "2017-01-06"
Rev "6"
Comp "TERA TU Graz"
Comment1 "Rene Pöschl"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L bms_board-rescue:C C2
U 1 1 58593A62
P 5950 3050
AR Path="/5859336D/58593A62" Ref="C2"  Part="1" 
AR Path="/585C2532/58593A62" Ref="C19"  Part="1" 
AR Path="/58593A62" Ref="C19"  Part="1" 
F 0 "C19" H 6065 3096 50  0000 L CNN
F 1 "10u" H 6065 3005 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 5988 2900 50  0001 C CNN
F 3 "" H 5950 3050 50  0000 C CNN
F 4 "53-10u0" H 5950 3050 60  0001 C CNN "HPN"
	1    5950 3050
	-1   0    0    -1  
$EndComp
$Comp
L bms_board-rescue:C C7
U 1 1 58593A6F
P 7250 2350
AR Path="/5859336D/58593A6F" Ref="C7"  Part="1" 
AR Path="/585C2532/58593A6F" Ref="C24"  Part="1" 
AR Path="/58593A6F" Ref="C24"  Part="1" 
F 0 "C24" H 7365 2396 50  0000 L CNN
F 1 "2.2u" H 7365 2305 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 7288 2200 50  0001 C CNN
F 3 "" H 7250 2350 50  0000 C CNN
F 4 "52-2u20" H 7250 2350 60  0001 C CNN "HPN"
	1    7250 2350
	0    -1   -1   0   
$EndComp
$Comp
L bms_board-rescue:C C11
U 1 1 58593A82
P 8150 3100
AR Path="/5859336D/58593A82" Ref="C11"  Part="1" 
AR Path="/585C2532/58593A82" Ref="C28"  Part="1" 
AR Path="/58593A82" Ref="C28"  Part="1" 
F 0 "C28" V 8100 3150 50  0000 L CNN
F 1 "2.2u" V 8265 3055 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 8188 2950 50  0001 C CNN
F 3 "" H 8150 3100 50  0000 C CNN
F 4 "52-2u20" V 8150 3100 60  0001 C CNN "HPN"
	1    8150 3100
	-1   0    0    -1  
$EndComp
$Comp
L bms_board-rescue:C C12
U 1 1 58593A89
P 8300 3400
AR Path="/5859336D/58593A89" Ref="C12"  Part="1" 
AR Path="/585C2532/58593A89" Ref="C29"  Part="1" 
AR Path="/58593A89" Ref="C29"  Part="1" 
F 0 "C29" V 8250 3450 50  0000 L CNN
F 1 "100n" V 8350 3100 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 8338 3250 50  0001 C CNN
F 3 "" H 8300 3400 50  0000 C CNN
F 4 "52-100n" V 8300 3400 60  0001 C CNN "HPN"
	1    8300 3400
	-1   0    0    -1  
$EndComp
$Comp
L bms_board-rescue:C C14
U 1 1 58593A90
P 8500 3100
AR Path="/5859336D/58593A90" Ref="C14"  Part="1" 
AR Path="/585C2532/58593A90" Ref="C31"  Part="1" 
AR Path="/58593A90" Ref="C31"  Part="1" 
F 0 "C31" V 8450 3150 50  0000 L CNN
F 1 "2.2u" V 8615 3055 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 8538 2950 50  0001 C CNN
F 3 "" H 8500 3100 50  0000 C CNN
F 4 "52-2u20" V 8500 3100 60  0001 C CNN "HPN"
	1    8500 3100
	-1   0    0    -1  
$EndComp
$Comp
L bms_board-rescue:C C15
U 1 1 58593A97
P 8650 3400
AR Path="/5859336D/58593A97" Ref="C15"  Part="1" 
AR Path="/585C2532/58593A97" Ref="C32"  Part="1" 
AR Path="/58593A97" Ref="C32"  Part="1" 
F 0 "C32" V 8600 3450 50  0000 L CNN
F 1 "100n" V 8700 3100 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 8688 3250 50  0001 C CNN
F 3 "" H 8650 3400 50  0000 C CNN
F 4 "52-100n" V 8650 3400 60  0001 C CNN "HPN"
	1    8650 3400
	-1   0    0    -1  
$EndComp
$Comp
L bms_board-rescue:CONN_01X02 X1
U 1 1 58593A9E
P 9100 2800
AR Path="/5859336D/58593A9E" Ref="X1"  Part="1" 
AR Path="/585C2532/58593A9E" Ref="X2"  Part="1" 
F 0 "X2" H 9019 2519 50  0000 C CNN
F 1 "Prog_Voltage" H 9019 2610 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02" H 9100 2800 50  0001 C CNN
F 3 "" H 9100 2800 50  0000 C CNN
F 4 "09-1003" H 9100 2800 60  0001 C CNN "HPN"
	1    9100 2800
	1    0    0    1   
$EndComp
$Comp
L bms_board-rescue:C C5
U 1 1 58593AAB
P 7100 3100
AR Path="/5859336D/58593AAB" Ref="C5"  Part="1" 
AR Path="/585C2532/58593AAB" Ref="C22"  Part="1" 
AR Path="/58593AAB" Ref="C22"  Part="1" 
F 0 "C22" V 7050 3150 50  0000 L CNN
F 1 "2.2u" V 7150 2850 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 7138 2950 50  0001 C CNN
F 3 "" H 7100 3100 50  0000 C CNN
F 4 "52-2u20" V 7100 3100 60  0001 C CNN "HPN"
	1    7100 3100
	-1   0    0    -1  
$EndComp
$Comp
L bms_board-rescue:C C8
U 1 1 58593AB2
P 7250 3250
AR Path="/5859336D/58593AB2" Ref="C8"  Part="1" 
AR Path="/585C2532/58593AB2" Ref="C25"  Part="1" 
AR Path="/58593AB2" Ref="C25"  Part="1" 
F 0 "C25" V 7200 3300 50  0000 L CNN
F 1 "100n" V 7100 3150 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 7288 3100 50  0001 C CNN
F 3 "" H 7250 3250 50  0000 C CNN
F 4 "52-100n" V 7250 3250 60  0001 C CNN "HPN"
	1    7250 3250
	-1   0    0    -1  
$EndComp
$Comp
L bms_board-rescue:C C1
U 1 1 58593ACB
P 5650 2500
AR Path="/5859336D/58593ACB" Ref="C1"  Part="1" 
AR Path="/585C2532/58593ACB" Ref="C18"  Part="1" 
AR Path="/58593ACB" Ref="C18"  Part="1" 
F 0 "C18" V 5700 2300 50  0000 L CNN
F 1 "100n 50V" V 5800 2300 50  0000 L CNN
F 2 "tera_rlc:C_0805in" H 5688 2350 50  0001 C CNN
F 3 "" H 5650 2500 50  0000 C CNN
F 4 "50-100n" V 5650 2500 60  0001 C CNN "HPN"
	1    5650 2500
	-1   0    0    1   
$EndComp
$Comp
L tera_general:TI-bq76pl536-multiunit IC1
U 8 1 58593AD2
P 6450 2750
AR Path="/5859336D/58593AD2" Ref="IC1"  Part="8" 
AR Path="/585C2532/58593AD2" Ref="IC2"  Part="8" 
AR Path="/58593AD2" Ref="IC2"  Part="8" 
F 0 "IC2" H 6450 3437 60  0000 C CNN
F 1 "TI-bq76pl536" H 6600 3350 60  0000 C CNN
F 2 "tera_atomic_ic:TI_bq76PL536" H 6550 5250 60  0001 C CNN
F 3 "" H 6650 2700 60  0000 C CNN
F 4 "20-0006" H 6450 2750 60  0001 C CNN "HPN"
	8    6450 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3200 5950 3300
Wire Wire Line
	5950 2850 5950 2900
Wire Wire Line
	7500 2350 7400 2350
Wire Wire Line
	6950 2350 7100 2350
Wire Wire Line
	5650 2650 5950 2650
Wire Wire Line
	6950 2750 8900 2750
Wire Wire Line
	8150 2750 8150 2950
Wire Wire Line
	8300 2750 8300 3250
Wire Wire Line
	8800 2650 8800 2750
Wire Wire Line
	6950 2650 8800 2650
Connection ~ 8800 2750
Wire Wire Line
	8900 2900 8900 2850
Wire Wire Line
	7100 2850 7100 2950
Wire Wire Line
	7250 2850 7250 3100
Connection ~ 7100 2850
Wire Wire Line
	7250 3450 7250 3400
Wire Wire Line
	7100 3450 7250 3450
Wire Wire Line
	7100 3450 7100 3250
Connection ~ 7200 3450
Wire Wire Line
	8650 3700 8650 3550
Wire Wire Line
	8150 3700 8650 3700
Wire Wire Line
	8400 3700 8400 3750
Wire Wire Line
	8150 3700 8150 3250
Connection ~ 8400 3700
Wire Wire Line
	8300 3550 8300 3700
Connection ~ 8300 3700
Wire Wire Line
	8500 3250 8500 3700
Connection ~ 8500 3700
Wire Wire Line
	8500 2650 8500 2950
Wire Wire Line
	8650 2650 8650 3250
Wire Wire Line
	6950 2850 7400 2850
Wire Wire Line
	5650 2350 5950 2350
Wire Wire Line
	5800 2450 5950 2450
Wire Wire Line
	5800 2200 5800 2450
Connection ~ 5800 2350
Wire Wire Line
	6250 3350 6250 3450
Wire Wire Line
	6250 3450 6650 3450
Wire Wire Line
	6650 3450 6650 3350
Connection ~ 6450 3450
Wire Wire Line
	6450 3350 6450 3550
Wire Wire Line
	6550 3350 6550 3450
Connection ~ 6550 3450
Connection ~ 8650 2650
Connection ~ 8500 2650
Connection ~ 8300 2750
Connection ~ 8150 2750
$Comp
L tera_general:TI-bq76pl536-multiunit IC?
U 1 1 58595E80
P 4050 3350
AR Path="/58595E80" Ref="IC?"  Part="1" 
AR Path="/5859336D/58595E80" Ref="IC1"  Part="1" 
AR Path="/585C2532/58595E80" Ref="IC2"  Part="1" 
F 0 "IC2" H 4050 3937 60  0000 C CNN
F 1 "TI-bq76pl536" H 4050 3831 60  0000 C CNN
F 2 "tera_atomic_ic:TI_bq76PL536" H 4150 5850 60  0001 C CNN
F 3 "" H 4250 3300 60  0000 C CNN
F 4 "20-0006" H 4050 3350 60  0001 C CNN "HPN"
	1    4050 3350
	1    0    0    -1  
$EndComp
Text HLabel 5950 3300 3    60   Input ~ 0
VBatt-
Text HLabel 5650 2200 0    60   Input ~ 0
VBatt+
Wire Wire Line
	5800 2200 5650 2200
Text HLabel 6450 3550 3    60   Input ~ 0
VBatt-
Text HLabel 7200 3550 3    60   Input ~ 0
VBatt-
Wire Wire Line
	7200 3550 7200 3450
Text HLabel 8400 3750 3    60   Input ~ 0
VBatt-
Text HLabel 8900 2900 3    60   Input ~ 0
VBatt-
Text HLabel 7500 2350 2    60   Input ~ 0
VBatt-
Text HLabel 1200 1100 0    60   Input ~ 0
VBatt+
Text HLabel 1250 4900 0    60   Input ~ 0
VBatt-
Text HLabel 1200 1600 0    60   Input ~ 0
VC5
Text HLabel 1200 2300 0    60   Input ~ 0
VC4
Text HLabel 1200 3000 0    60   Input ~ 0
VC3
Text HLabel 1200 3700 0    60   Input ~ 0
VC2
Text HLabel 1250 4400 0    60   Input ~ 0
VC1
$Comp
L tera_general:TI-bq76pl536-multiunit IC?
U 4 1 585A3EA2
P 2050 5650
AR Path="/585A3EA2" Ref="IC?"  Part="4" 
AR Path="/5859336D/585A3EA2" Ref="IC1"  Part="4" 
AR Path="/585C2532/585A3EA2" Ref="IC2"  Part="4" 
F 0 "IC2" H 2400 5700 60  0000 C CNN
F 1 "TI-bq76pl536" H 2600 5600 60  0000 C CNN
F 2 "tera_atomic_ic:TI_bq76PL536" H 2150 8150 60  0001 C CNN
F 3 "" H 2350 5600 60  0000 C CNN
F 4 "20-0006" H 2050 5650 60  0001 C CNN "HPN"
	4    2050 5650
	1    0    0    -1  
$EndComp
$Comp
L tera_general:TI-bq76pl536-multiunit IC?
U 2 1 585A3EA9
P 2050 6500
AR Path="/585A3EA9" Ref="IC?"  Part="2" 
AR Path="/5859336D/585A3EA9" Ref="IC1"  Part="2" 
AR Path="/585C2532/585A3EA9" Ref="IC2"  Part="2" 
F 0 "IC2" H 2278 6553 60  0000 L CNN
F 1 "TI-bq76pl536" H 2278 6447 60  0000 L CNN
F 2 "tera_atomic_ic:TI_bq76PL536" H 2150 9000 60  0001 C CNN
F 3 "" H 2350 6450 60  0000 C CNN
F 4 "20-0006" H 2050 6500 60  0001 C CNN "HPN"
	2    2050 6500
	1    0    0    -1  
$EndComp
$Comp
L tera_general:TI-bq76pl536-multiunit IC?
U 3 1 585A3EB0
P 2050 7300
AR Path="/585A3EB0" Ref="IC?"  Part="3" 
AR Path="/5859336D/585A3EB0" Ref="IC1"  Part="3" 
AR Path="/585C2532/585A3EB0" Ref="IC2"  Part="3" 
F 0 "IC2" H 2278 7353 60  0000 L CNN
F 1 "TI-bq76pl536" H 2278 7247 60  0000 L CNN
F 2 "tera_atomic_ic:TI_bq76PL536" H 2150 9800 60  0001 C CNN
F 3 "" H 2350 7250 60  0000 C CNN
F 4 "20-0006" H 2050 7300 60  0001 C CNN "HPN"
	3    2050 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5650 1750 5650
Wire Wire Line
	1750 5550 1650 5550
Wire Wire Line
	1650 5550 1650 5650
Connection ~ 1650 5650
$Comp
L tera_general:TI-bq76pl536-multiunit IC?
U 5 1 585A712E
P 9800 3200
AR Path="/585A712E" Ref="IC?"  Part="5" 
AR Path="/5859336D/585A712E" Ref="IC1"  Part="5" 
AR Path="/585C2532/585A712E" Ref="IC2"  Part="5" 
F 0 "IC2" H 9750 2513 60  0000 C CNN
F 1 "TI-bq76pl536" H 9750 2619 60  0000 C CNN
F 2 "tera_atomic_ic:TI_bq76PL536" H 9900 5700 60  0001 C CNN
F 3 "" H 10000 3150 60  0000 C CNN
F 4 "20-0006" H 9800 3200 60  0001 C CNN "HPN"
	5    9800 3200
	1    0    0    1   
$EndComp
$Comp
L tera_general:TI-bq76pl536-multiunit IC?
U 6 1 585A7135
P 9300 5100
AR Path="/585A7135" Ref="IC?"  Part="6" 
AR Path="/5859336D/585A7135" Ref="IC1"  Part="6" 
AR Path="/585C2532/585A7135" Ref="IC2"  Part="6" 
F 0 "IC2" H 9072 5047 60  0000 R CNN
F 1 "TI-bq76pl536" H 9072 5153 60  0000 R CNN
F 2 "tera_atomic_ic:TI_bq76PL536" H 9400 7600 60  0001 C CNN
F 3 "" H 9500 5050 60  0000 C CNN
F 4 "20-0006" H 9300 5100 60  0001 C CNN "HPN"
	6    9300 5100
	0    -1   1    0   
$EndComp
$Comp
L tera_general:TI-bq76pl536-multiunit IC?
U 7 1 585A713C
P 9400 1400
AR Path="/585A713C" Ref="IC?"  Part="7" 
AR Path="/5859336D/585A713C" Ref="IC1"  Part="7" 
AR Path="/585C2532/585A713C" Ref="IC2"  Part="7" 
F 0 "IC2" H 9400 2100 60  0000 C CNN
F 1 "TI-bq76pl536" H 9400 2000 60  0000 C CNN
F 2 "tera_atomic_ic:TI_bq76PL536" H 9500 3900 60  0001 C CNN
F 3 "" H 9600 1350 60  0000 C CNN
F 4 "20-0006" H 9400 1400 60  0001 C CNN "HPN"
	7    9400 1400
	0    1    -1   0   
$EndComp
Text HLabel 8900 5500 3    60   Input ~ 0
CS_S
Text HLabel 9000 5500 3    60   Input ~ 0
SDI_S
Text HLabel 9100 5500 3    60   Output ~ 0
SDO_S
Text HLabel 9200 5500 3    60   Input ~ 0
SCLK_S
Text HLabel 9400 5500 3    60   Output ~ 0
Fault_S
Text HLabel 9500 5500 3    60   Output ~ 0
Alert_S
Text HLabel 9600 5500 3    60   Output ~ 0
DRDY_S
Text HLabel 9700 5500 3    60   Input ~ 0
CONV_S
Text HLabel 9000 1000 1    60   Output ~ 0
CS_N
Text HLabel 9100 1000 1    60   Output ~ 0
SDI_N
Text HLabel 9200 1000 1    60   Input ~ 0
SDO_N
Text HLabel 9300 1000 1    60   Output ~ 0
SCLK_N
Text HLabel 9500 1000 1    60   Input ~ 0
Fault_N
Text HLabel 9600 1000 1    60   Input ~ 0
Alert_N
Text HLabel 9700 1000 1    60   Input ~ 0
DRDY_N
Text HLabel 9800 1000 1    60   Output ~ 0
CONV_N
Text HLabel 10200 3600 2    60   Input ~ 0
CS_H
Text HLabel 10200 3500 2    60   Input ~ 0
SDI_H
Text HLabel 10200 3400 2    60   Output ~ 0
SDO_H
Text HLabel 10200 3300 2    60   Input ~ 0
SCLK_H
Text HLabel 10200 3100 2    60   Output ~ 0
Fault_H
Text HLabel 10200 3000 2    60   Output ~ 0
Alert_H
Text HLabel 10200 2900 2    60   Output ~ 0
DRDY_H
Text HLabel 10200 2800 2    60   Input ~ 0
CONV_H
Text HLabel 9300 3600 0    60   Input ~ 0
HSEL
NoConn ~ 1750 5750
Wire Wire Line
	7000 2350 7000 1900
Wire Wire Line
	7000 1900 7300 1900
Connection ~ 7000 2350
Text HLabel 7300 1900 2    60   Output ~ 0
+5V
NoConn ~ 6950 2450
Text HLabel 1750 6400 0    60   BiDi ~ 0
TS1+
Text HLabel 1750 6600 0    60   BiDi ~ 0
TS1-
Text HLabel 1750 7200 0    60   BiDi ~ 0
TS2+
Text HLabel 1750 7400 0    60   BiDi ~ 0
TS2-
$Sheet
S 1450 1000 1150 500 
U 5862B589
F0 "BalanceCell6" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 2600 1100 60 
F3 "Celln-" I L 1450 1400 60 
F4 "Celln+" I L 1450 1100 60 
F5 "VCn" O R 2600 1250 60 
F6 "GND" I R 2600 1400 60 
$EndSheet
Wire Wire Line
	1450 1400 1350 1400
Wire Wire Line
	1350 1400 1350 1800
Wire Wire Line
	1350 1800 1450 1800
Wire Wire Line
	1450 2100 1350 2100
Wire Wire Line
	1350 2100 1350 2500
Wire Wire Line
	1350 2500 1450 2500
Wire Wire Line
	1450 2800 1350 2800
Wire Wire Line
	1350 2800 1350 3200
Wire Wire Line
	1350 3200 1450 3200
Wire Wire Line
	1450 3500 1350 3500
Wire Wire Line
	1350 3500 1350 3900
Wire Wire Line
	1350 3900 1450 3900
Wire Wire Line
	1450 4200 1350 4200
Wire Wire Line
	1350 4200 1350 4600
Wire Wire Line
	1350 4600 1450 4600
Wire Wire Line
	1250 4400 1350 4400
Connection ~ 1350 4400
Wire Wire Line
	1250 4900 1450 4900
Wire Wire Line
	1200 3700 1350 3700
Connection ~ 1350 3700
Wire Wire Line
	1200 3000 1350 3000
Connection ~ 1350 3000
Wire Wire Line
	1200 2300 1350 2300
Connection ~ 1350 2300
Wire Wire Line
	1200 1600 1350 1600
Connection ~ 1350 1600
Wire Wire Line
	1200 1100 1450 1100
Text HLabel 2600 4900 2    60   Input ~ 0
VBatt-
Text HLabel 2600 4200 2    60   Input ~ 0
VBatt-
Text HLabel 2600 3500 2    60   Input ~ 0
VBatt-
Text HLabel 2600 2800 2    60   Input ~ 0
VBatt-
Text HLabel 2600 2100 2    60   Input ~ 0
VBatt-
Text HLabel 2600 1400 2    60   Input ~ 0
VBatt-
Wire Wire Line
	3650 3550 3450 3550
Wire Wire Line
	3450 3550 3450 4750
Wire Wire Line
	3650 3050 3550 3050
Wire Wire Line
	3550 3050 3550 1250
Wire Wire Line
	3550 1250 2600 1250
Wire Wire Line
	3650 3150 3450 3150
Wire Wire Line
	3450 3150 3450 1950
Wire Wire Line
	3450 1950 2600 1950
Wire Wire Line
	3650 3250 3350 3250
Wire Wire Line
	3350 3250 3350 2650
Wire Wire Line
	3350 2650 2600 2650
Wire Wire Line
	3450 4750 2600 4750
Wire Wire Line
	3650 3450 3350 3450
Wire Wire Line
	3350 3450 3350 4050
Wire Wire Line
	3350 4050 2600 4050
Wire Wire Line
	2600 3350 3650 3350
Text HLabel 3550 3750 3    60   Input ~ 0
VBatt-
Wire Wire Line
	3550 3750 3550 3650
Wire Wire Line
	3550 3650 3650 3650
Text Label 4450 3550 0    50   ~ 0
CB1
Text Label 2600 4600 0    50   ~ 0
CB1
Text Label 2600 3900 0    50   ~ 0
CB2
Text Label 4450 3450 0    50   ~ 0
CB2
Text Label 2600 3200 0    50   ~ 0
CB3
Text Label 4450 3350 0    50   ~ 0
CB3
Text Label 2600 2500 0    50   ~ 0
CB4
Text Label 4450 3250 0    50   ~ 0
CB4
Text Label 2600 1800 0    50   ~ 0
CB5
Text Label 4450 3150 0    50   ~ 0
CB5
Text Label 2600 1100 0    50   ~ 0
CB6
Text Label 4450 3050 0    50   ~ 0
CB6
$Sheet
S 1450 1700 1150 500 
U 5868A2E9
F0 "BalanceCell5" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 2600 1800 60 
F3 "Celln-" I L 1450 2100 60 
F4 "Celln+" I L 1450 1800 60 
F5 "VCn" O R 2600 1950 60 
F6 "GND" I R 2600 2100 60 
$EndSheet
$Sheet
S 1450 2400 1150 500 
U 5868B11E
F0 "BalanceCell4" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 2600 2500 60 
F3 "Celln-" I L 1450 2800 60 
F4 "Celln+" I L 1450 2500 60 
F5 "VCn" O R 2600 2650 60 
F6 "GND" I R 2600 2800 60 
$EndSheet
$Sheet
S 1450 3100 1150 500 
U 5868B125
F0 "BalanceCell3" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 2600 3200 60 
F3 "Celln-" I L 1450 3500 60 
F4 "Celln+" I L 1450 3200 60 
F5 "VCn" O R 2600 3350 60 
F6 "GND" I R 2600 3500 60 
$EndSheet
$Sheet
S 1450 3800 1150 500 
U 5868CA28
F0 "BalanceCell2" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 2600 3900 60 
F3 "Celln-" I L 1450 4200 60 
F4 "Celln+" I L 1450 3900 60 
F5 "VCn" O R 2600 4050 60 
F6 "GND" I R 2600 4200 60 
$EndSheet
$Sheet
S 1450 4500 1150 500 
U 5868CA2F
F0 "BalanceCell1" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 2600 4600 60 
F3 "Celln-" I L 1450 4900 60 
F4 "Celln+" I L 1450 4600 60 
F5 "VCn" O R 2600 4750 60 
F6 "GND" I R 2600 4900 60 
$EndSheet
Text HLabel 1500 5650 0    60   Input ~ 0
VBatt-
Text HLabel 5650 2750 3    60   Input ~ 0
VBatt-
Wire Wire Line
	5650 2750 5650 2650
Connection ~ 5650 2650
Text HLabel 7400 2850 2    60   Output ~ 0
+5V_LDOA
Connection ~ 7250 2850
Text Label 7100 2750 0    60   ~ 0
LDODx
$EndSCHEMATC
