EESchema Schematic File Version 4
LIBS:bms_board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 17 17
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
L bms_board-rescue:CONN_01X10 P4
U 1 1 5886A607
P 3300 2300
F 0 "P4" H 3377 2338 50  0000 L CNN
F 1 "Host_Interface" H 3377 2247 50  0000 L CNN
F 2 "tera_Connectors_Molex:Molex_PicoBlade_53398-1071_10x1.25mm_Straight" H 3300 2300 50  0001 C CNN
F 3 "" H 3300 2300 50  0000 C CNN
F 4 "03-0210" H 3300 2300 60  0001 C CNN "HPN"
	1    3300 2300
	1    0    0    -1  
$EndComp
$Comp
L tera_general:BSS205N Q1
U 1 1 5886A60E
P 2200 3000
F 0 "Q1" H 2273 3096 50  0000 L CNN
F 1 "BSS205N" H 1800 2900 50  0000 L CNN
F 2 "tera_atomic_infineon:BSS205N" H 2300 2975 50  0001 L CIN
F 3 "" H 2300 3125 50  0000 L CNN
F 4 "24-2050" H 2200 3000 60  0001 C CNN "HPN"
	1    2200 3000
	1    0    0    -1  
$EndComp
$Comp
L tera_general:BSS205N Q2
U 1 1 5886A615
P 2600 3000
F 0 "Q2" H 2673 3096 50  0000 L CNN
F 1 "BSS205N" H 2600 2950 50  0000 L CNN
F 2 "tera_atomic_infineon:BSS205N" H 2700 2975 50  0001 L CIN
F 3 "" H 2700 3125 50  0000 L CNN
F 4 "24-2050" H 2600 3000 60  0001 C CNN "HPN"
	1    2600 3000
	1    0    0    -1  
$EndComp
$Comp
L bms_board-rescue:R_Small R36
U 1 1 5886A628
P 2200 1650
F 0 "R36" V 2100 1700 50  0000 C CNN
F 1 "10K" V 2300 1650 50  0000 C CNN
F 2 "tera_rlc:R_0603in" H 2200 1650 50  0001 C CNN
F 3 "" H 2200 1650 50  0000 C CNN
F 4 "11-10K0" V 2200 1650 60  0001 C CNN "HPN"
	1    2200 1650
	1    0    0    -1  
$EndComp
$Comp
L bms_board-rescue:R_Small R37
U 1 1 5886A635
P 2600 1650
F 0 "R37" V 2500 1700 50  0000 C CNN
F 1 "10K" V 2700 1650 50  0000 C CNN
F 2 "tera_rlc:R_0603in" H 2600 1650 50  0001 C CNN
F 3 "" H 2600 1650 50  0000 C CNN
F 4 "11-10K0" V 2600 1650 60  0001 C CNN "HPN"
	1    2600 1650
	1    0    0    -1  
$EndComp
Text Label 2200 2050 0    39   ~ 0
NALERT_H
Text Label 2600 2250 0    39   ~ 0
NFAULT_H
Wire Wire Line
	1700 2650 3100 2650
Wire Wire Line
	2200 3100 3100 3100
Wire Wire Line
	2600 3100 2600 3400
Wire Wire Line
	3100 3100 3100 2750
Connection ~ 2600 3100
Wire Wire Line
	1700 2550 3100 2550
Wire Wire Line
	2200 1350 2200 1550
Wire Wire Line
	2600 1350 2600 1550
Wire Wire Line
	2200 1750 2200 2800
Wire Wire Line
	2600 1750 2600 2800
Wire Wire Line
	2850 2150 3100 2150
Wire Wire Line
	1700 1950 2900 1950
Wire Wire Line
	2900 1950 2900 2050
Wire Wire Line
	2900 2050 3100 2050
Wire Wire Line
	1700 1850 2950 1850
Wire Wire Line
	2950 1850 2950 1950
Wire Wire Line
	2950 1950 3100 1950
Wire Wire Line
	3050 1850 3100 1850
Wire Wire Line
	3050 1100 3050 1850
Wire Wire Line
	1700 2050 2000 2050
Wire Wire Line
	2000 2050 2000 3000
Wire Wire Line
	2200 2050 2850 2050
Wire Wire Line
	2850 2050 2850 2150
Connection ~ 2200 2050
Wire Wire Line
	1700 2150 2400 2150
Wire Wire Line
	2400 2150 2400 3000
Wire Wire Line
	1700 2350 3100 2350
Wire Wire Line
	1700 2450 3100 2450
Wire Wire Line
	3100 2250 2600 2250
Connection ~ 2600 2250
Text HLabel 1700 1850 0    60   Output ~ 0
CONV_H
Text HLabel 1700 1950 0    60   Input ~ 0
DRDY_H
Text HLabel 1700 2050 0    60   Input ~ 0
Alert_H
Text HLabel 1700 2150 0    60   Input ~ 0
Fault_H
Text HLabel 1700 2350 0    60   Output ~ 0
SCLK_H
Text HLabel 1700 2450 0    60   Input ~ 0
SDO_H
Text HLabel 1700 2550 0    60   Output ~ 0
SDI_H
Text HLabel 1700 2650 0    60   Output ~ 0
CS_H
Text HLabel 2550 3400 0    60   Input ~ 0
VBatt-
Wire Wire Line
	2600 3400 2550 3400
Text Label 3050 1100 0    60   ~ 0
+5V_Host
$Comp
L tera_general:JUMPER3_NO JP1
U 1 1 5AA2DEC2
P 2400 1100
F 0 "JP1" H 2400 1301 50  0000 C CNN
F 1 "JUMPER3_NO" H 2400 1210 50  0000 C CNN
F 2 "tera_general:SOLDERJUMPER_3_1mm" H 2400 1210 50  0001 C CNN
F 3 "" H 2400 1100 50  0000 C CNN
	1    2400 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1100 3050 1100
Wire Wire Line
	2600 1350 2200 1350
Wire Wire Line
	2400 1200 2400 1350
Connection ~ 2400 1350
Text HLabel 2000 1100 0    60   Input ~ 0
5V
Wire Wire Line
	2000 1100 2100 1100
Text Label 2500 1350 0    60   ~ 0
+5V_DO
$EndSCHEMATC
