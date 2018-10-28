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
LIBS:bms_balance_v4-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
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
L CONN_02X08 P2
U 1 1 56F07686
P 9700 3150
F 0 "P2" V 9654 2706 50  0000 R CNN
F 1 "CONN_02X08" V 9745 2706 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x08" H 9700 1950 50  0001 C CNN
F 3 "" H 9700 1950 50  0000 C CNN
	1    9700 3150
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR01
U 1 1 56F0773B
P 10250 3650
F 0 "#PWR01" H 10250 3400 50  0001 C CNN
F 1 "GND" H 10258 3477 50  0000 C CNN
F 2 "" H 10250 3650 50  0000 C CNN
F 3 "" H 10250 3650 50  0000 C CNN
	1    10250 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 3400 10050 3600
Wire Wire Line
	9350 3600 10250 3600
Wire Wire Line
	10250 2850 10250 3650
Connection ~ 10250 3600
Wire Wire Line
	10050 2900 10050 2850
$Comp
L +BATT #PWR02
U 1 1 56F07783
P 9950 2850
F 0 "#PWR02" H 9950 2700 50  0001 C CNN
F 1 "+BATT" V 10050 3000 50  0000 C CNN
F 2 "" H 9950 2850 50  0000 C CNN
F 3 "" H 9950 2850 50  0000 C CNN
	1    9950 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 2850 10250 2850
Wire Wire Line
	9350 3600 9350 3400
Connection ~ 10050 3600
Wire Wire Line
	9950 2900 9950 2850
Text Label 9350 2900 1    60   ~ 0
CB1
Text Label 9450 2900 1    60   ~ 0
CB2
Text Label 9550 2900 1    60   ~ 0
CB3
Text Label 9650 2900 1    60   ~ 0
CB4
Text Label 9750 2900 1    60   ~ 0
CB5
Text Label 9850 2900 1    60   ~ 0
CB6
Text Label 9450 3400 3    60   ~ 0
VC1
Text Label 9550 3400 3    60   ~ 0
VC2
Text Label 9650 3400 3    60   ~ 0
VC3
Text Label 9750 3400 3    60   ~ 0
VC4
Text Label 9850 3400 3    60   ~ 0
VC5
Text Label 9950 3400 3    60   ~ 0
VC6
$Comp
L CONN_01X07 P1
U 1 1 56F078EF
P 1600 4050
F 0 "P1" H 1519 3519 50  0000 C CNN
F 1 "CONN_01X07" H 1519 3610 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B07B-XH-A_07x2.50mm_Straight" H 1600 4050 50  0001 C CNN
F 3 "" H 1600 4050 50  0000 C CNN
	1    1600 4050
	-1   0    0    -1  
$EndComp
$Comp
L +BATT #PWR03
U 1 1 56F0798E
P 2250 1900
F 0 "#PWR03" H 2250 1750 50  0001 C CNN
F 1 "+BATT" H 2268 2073 50  0000 C CNN
F 2 "" H 2250 1900 50  0000 C CNN
F 3 "" H 2250 1900 50  0000 C CNN
	1    2250 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4350 2000 4350
Wire Wire Line
	2000 4350 2000 6700
Wire Wire Line
	2250 3750 1800 3750
Text Label 1800 4250 0    60   ~ 0
V1
Text Label 1800 4150 0    60   ~ 0
V2
Text Label 1800 4050 0    60   ~ 0
V3
Text Label 1800 3850 0    60   ~ 0
V5
Text Label 1800 3950 0    60   ~ 0
V4
$Sheet
S 4000 5900 750  600 
U 56F07FAD
F0 "BalancerCell1" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 4750 6000 60 
F3 "Celln-" I L 4000 6450 60 
F4 "Celln+" I L 4000 6200 60 
F5 "VCn" I R 4750 6200 60 
F6 "Heat" I R 4750 6400 60 
$EndSheet
$Sheet
S 4000 5050 750  600 
U 56F0A894
F0 "BalancerCell2" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 4750 5150 60 
F3 "Celln-" I L 4000 5600 60 
F4 "Celln+" I L 4000 5350 60 
F5 "VCn" I R 4750 5350 60 
F6 "Heat" I R 4750 5550 60 
$EndSheet
$Sheet
S 4000 4250 750  600 
U 56F0B664
F0 "BalancerCell3" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 4750 4350 60 
F3 "Celln-" I L 4000 4800 60 
F4 "Celln+" I L 4000 4550 60 
F5 "VCn" I R 4750 4550 60 
F6 "Heat" I R 4750 4750 60 
$EndSheet
$Sheet
S 4000 3400 750  600 
U 56F0B66A
F0 "BalancerCell4" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 4750 3500 60 
F3 "Celln-" I L 4000 3950 60 
F4 "Celln+" I L 4000 3700 60 
F5 "VCn" I R 4750 3700 60 
F6 "Heat" I R 4750 3900 60 
$EndSheet
$Sheet
S 4000 2600 750  600 
U 56F0C03E
F0 "BalancerCell5" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 4750 2700 60 
F3 "Celln-" I L 4000 3150 60 
F4 "Celln+" I L 4000 2900 60 
F5 "VCn" I R 4750 2900 60 
F6 "Heat" I R 4750 3100 60 
$EndSheet
$Sheet
S 4000 1750 750  600 
U 56F0C044
F0 "BalancerCell6" 60
F1 "BalancerOneCell.sch" 60
F2 "CBx" I R 4750 1850 60 
F3 "Celln-" I L 4000 2300 60 
F4 "Celln+" I L 4000 2050 60 
F5 "VCn" I R 4750 2050 60 
F6 "Heat" I R 4750 2200 60 
$EndSheet
Wire Wire Line
	4000 2050 2250 2050
Wire Wire Line
	2250 1900 2250 3750
Connection ~ 2250 2050
Wire Wire Line
	1800 3850 2400 3850
Wire Wire Line
	3850 2300 4000 2300
Wire Wire Line
	4000 2900 3850 2900
Wire Wire Line
	3850 2900 3850 2300
Wire Wire Line
	4000 3700 3850 3700
Wire Wire Line
	3850 3700 3850 3150
Wire Wire Line
	3850 3150 4000 3150
Wire Wire Line
	4000 4550 3850 4550
Wire Wire Line
	3850 4550 3850 3950
Wire Wire Line
	3850 3950 4000 3950
Wire Wire Line
	4000 5350 3850 5350
Wire Wire Line
	3850 5350 3850 4800
Wire Wire Line
	3850 4800 4000 4800
Wire Wire Line
	4000 6200 3850 6200
Wire Wire Line
	3850 6200 3850 5600
Wire Wire Line
	3850 5600 4000 5600
Wire Wire Line
	3850 2550 2400 2550
Wire Wire Line
	2400 2550 2400 3850
Connection ~ 3850 2550
Wire Wire Line
	1800 3950 2550 3950
Wire Wire Line
	2550 3950 2550 3400
Wire Wire Line
	2550 3400 3850 3400
Connection ~ 3850 3400
Wire Wire Line
	1800 4050 2550 4050
Wire Wire Line
	2550 4050 2550 4200
Wire Wire Line
	2550 4200 3850 4200
Connection ~ 3850 4200
Wire Wire Line
	1800 4150 2400 4150
Wire Wire Line
	2400 4150 2400 5050
Wire Wire Line
	2400 5050 3850 5050
Connection ~ 3850 5050
Wire Wire Line
	1800 4250 2250 4250
Wire Wire Line
	2250 4250 2250 5900
Wire Wire Line
	2250 5900 3850 5900
Connection ~ 3850 5900
Wire Wire Line
	2000 6450 4000 6450
$Comp
L GND #PWR04
U 1 1 56F1239F
P 2000 6700
F 0 "#PWR04" H 2000 6450 50  0001 C CNN
F 1 "GND" H 2008 6527 50  0000 C CNN
F 2 "" H 2000 6700 50  0000 C CNN
F 3 "" H 2000 6700 50  0000 C CNN
	1    2000 6700
	1    0    0    -1  
$EndComp
Connection ~ 2000 6450
Text Label 4750 6000 0    60   ~ 0
CB1
Text Label 4750 5150 0    60   ~ 0
CB2
Text Label 4750 4350 0    60   ~ 0
CB3
Text Label 4750 6200 0    60   ~ 0
VC1
Text Label 4750 5350 0    60   ~ 0
VC2
Text Label 4750 4550 0    60   ~ 0
VC3
Text Label 4750 3700 0    60   ~ 0
VC4
Text Label 4750 3500 0    60   ~ 0
CB4
Text Label 4750 2900 0    60   ~ 0
VC5
Text Label 4750 2700 0    60   ~ 0
CB5
Text Label 4750 2050 0    60   ~ 0
VC6
Text Label 4750 1850 0    60   ~ 0
CB6
Wire Wire Line
	4750 6400 5450 6400
Wire Wire Line
	5450 6400 5450 2200
Wire Wire Line
	5450 2200 4750 2200
Wire Wire Line
	4750 3100 5450 3100
Connection ~ 5450 3100
Wire Wire Line
	4750 3900 5450 3900
Connection ~ 5450 3900
Wire Wire Line
	4750 4750 5450 4750
Connection ~ 5450 4750
Wire Wire Line
	4750 5550 5450 5550
Connection ~ 5450 5550
$EndSCHEMATC
