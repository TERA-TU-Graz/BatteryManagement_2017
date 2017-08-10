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
Sheet 9 16
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
L TLE8102SG IC?
U 1 1 56FBF232
P 2900 4500
AR Path="/56F50775/56F58707/56FBF232" Ref="IC?"  Part="1" 
AR Path="/56F50775/56F59A35/56FBF232" Ref="IC?"  Part="1" 
AR Path="/56F50775/56F6E70D/56FBF232" Ref="IC?"  Part="1" 
AR Path="/56F50775/56F7A222/56FBF232" Ref="IC?"  Part="1" 
AR Path="/56F50775/56F859E1/56FBF232" Ref="IC6"  Part="1" 
AR Path="/56F50775/56F899AD/56FBF232" Ref="IC7"  Part="1" 
F 0 "IC6" H 2900 5137 60  0000 C CNN
F 1 "TLE8102SG" H 2900 5031 60  0000 C CNN
F 2 "infineon:INF-PG-DSO-12-11-EP_EPvias" H 2850 4500 60  0001 C CNN
F 3 "" H 2850 4500 60  0000 C CNN
	1    2900 4500
	1    0    0    -1  
$EndComp
Text HLabel 2500 4400 0    60   Input ~ 0
NCS
Text HLabel 2500 4500 0    60   Input ~ 0
SCLK
Text HLabel 2500 4600 0    60   Input ~ 0
MOSI
Text HLabel 2500 4700 0    60   3State ~ 0
MISO
Text HLabel 2500 4800 0    60   Output ~ 0
Fault
Text HLabel 2300 4200 0    60   Input ~ 0
relay_on
$Comp
L LED D?
U 1 1 56FBF233
P 4000 3900
AR Path="/56F50775/56F58707/56FBF233" Ref="D?"  Part="1" 
AR Path="/56F50775/56F59A35/56FBF233" Ref="D?"  Part="1" 
AR Path="/56F50775/56F6E70D/56FBF233" Ref="D?"  Part="1" 
AR Path="/56F50775/56F7A222/56FBF233" Ref="D?"  Part="1" 
AR Path="/56F50775/56F859E1/56FBF233" Ref="D8"  Part="1" 
AR Path="/56F50775/56F899AD/56FBF233" Ref="D10"  Part="1" 
F 0 "D8" V 4046 3792 50  0000 R CNN
F 1 "LED" V 3955 3792 50  0000 R CNN
F 2 "LEDs:LED_0805" H 4000 3900 50  0001 C CNN
F 3 "" H 4000 3900 50  0000 C CNN
	1    4000 3900
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 56F516C1
P 4000 3500
AR Path="/56F50775/56F58707/56F516C1" Ref="R?"  Part="1" 
AR Path="/56F50775/56F59A35/56F516C1" Ref="R?"  Part="1" 
AR Path="/56F50775/56F6E70D/56F516C1" Ref="R?"  Part="1" 
AR Path="/56F50775/56F7A222/56F516C1" Ref="R?"  Part="1" 
AR Path="/56F50775/56F859E1/56F516C1" Ref="R17"  Part="1" 
AR Path="/56F50775/56F899AD/56F516C1" Ref="R19"  Part="1" 
F 0 "R17" H 4070 3546 50  0000 L CNN
F 1 "12k" H 4070 3455 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 3930 3500 50  0001 C CNN
F 3 "" H 4000 3500 50  0000 C CNN
	1    4000 3500
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 56F516EB
P 3550 4050
AR Path="/56F50775/56F58707/56F516EB" Ref="C?"  Part="1" 
AR Path="/56F50775/56F59A35/56F516EB" Ref="C?"  Part="1" 
AR Path="/56F50775/56F6E70D/56F516EB" Ref="C?"  Part="1" 
AR Path="/56F50775/56F7A222/56F516EB" Ref="C?"  Part="1" 
AR Path="/56F50775/56F859E1/56F516EB" Ref="C12"  Part="1" 
AR Path="/56F50775/56F899AD/56F516EB" Ref="C13"  Part="1" 
F 0 "C12" V 3298 4050 50  0000 C CNN
F 1 "100n" V 3389 4050 50  0000 C CNN
F 2 "Capacitors_SMD:C_0603" H 3588 3900 50  0001 C CNN
F 3 "" H 3550 4050 50  0000 C CNN
	1    3550 4050
	0    1    1    0   
$EndComp
$Comp
L LED D?
U 1 1 56FBF236
P 4400 3900
AR Path="/56F50775/56F58707/56FBF236" Ref="D?"  Part="1" 
AR Path="/56F50775/56F59A35/56FBF236" Ref="D?"  Part="1" 
AR Path="/56F50775/56F6E70D/56FBF236" Ref="D?"  Part="1" 
AR Path="/56F50775/56F7A222/56FBF236" Ref="D?"  Part="1" 
AR Path="/56F50775/56F859E1/56FBF236" Ref="D9"  Part="1" 
AR Path="/56F50775/56F899AD/56FBF236" Ref="D11"  Part="1" 
F 0 "D9" V 4446 3792 50  0000 R CNN
F 1 "LED" V 4355 3792 50  0000 R CNN
F 2 "LEDs:LED_0805" H 4400 3900 50  0001 C CNN
F 3 "" H 4400 3900 50  0000 C CNN
	1    4400 3900
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 56F52A59
P 4400 3500
AR Path="/56F50775/56F58707/56F52A59" Ref="R?"  Part="1" 
AR Path="/56F50775/56F59A35/56F52A59" Ref="R?"  Part="1" 
AR Path="/56F50775/56F6E70D/56F52A59" Ref="R?"  Part="1" 
AR Path="/56F50775/56F7A222/56F52A59" Ref="R?"  Part="1" 
AR Path="/56F50775/56F859E1/56F52A59" Ref="R18"  Part="1" 
AR Path="/56F50775/56F899AD/56F52A59" Ref="R20"  Part="1" 
F 0 "R18" H 4470 3546 50  0000 L CNN
F 1 "12k" H 4470 3455 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 4330 3500 50  0001 C CNN
F 3 "" H 4400 3500 50  0000 C CNN
	1    4400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4700 3400 4700
Wire Wire Line
	3400 4700 3400 5400
Wire Wire Line
	3300 4800 3400 4800
Connection ~ 3400 4800
Wire Wire Line
	3300 4900 3400 4900
Connection ~ 3400 4900
Wire Wire Line
	3350 4100 3300 4100
Wire Wire Line
	3350 3600 3350 4100
Wire Wire Line
	3400 4050 3350 4050
Connection ~ 3350 4050
Wire Wire Line
	3750 4050 3700 4050
Wire Wire Line
	3300 4200 4900 4200
Wire Wire Line
	4000 4200 4000 4100
Wire Wire Line
	4000 3250 4000 3350
Wire Wire Line
	4000 3650 4000 3700
Wire Wire Line
	4400 4100 4400 4300
Wire Wire Line
	4400 3250 4400 3350
Wire Wire Line
	4400 3650 4400 3700
Connection ~ 4000 4200
Connection ~ 4400 4300
Wire Wire Line
	2300 4200 2500 4200
Wire Wire Line
	2400 4200 2400 4100
Wire Wire Line
	2400 4100 2500 4100
Connection ~ 2400 4200
Text HLabel 3100 5400 0    60   Input ~ 0
GND
Text HLabel 3850 3250 0    60   Input ~ 0
+12V_PWR
Text HLabel 3250 3600 0    60   Input ~ 0
+5V
Connection ~ 3400 5400
Wire Wire Line
	3750 4050 3750 5400
Wire Wire Line
	3850 3250 5450 3250
Connection ~ 4000 3250
Wire Wire Line
	3350 3600 3250 3600
$Comp
L CONN_01X02 P11
U 1 1 56F85CB6
P 5100 4150
AR Path="/56F50775/56F859E1/56F85CB6" Ref="P11"  Part="1" 
AR Path="/56F50775/56F899AD/56F85CB6" Ref="P13"  Part="1" 
F 0 "P11" H 5000 4000 50  0000 C CNN
F 1 "CONN_01X02" V 5200 4050 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B02B-XH-A_02x2.50mm_Straight" H 5100 4150 50  0001 C CNN
F 3 "" H 5100 4150 50  0000 C CNN
	1    5100 4150
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 P12
U 1 1 56F85D31
P 5650 4150
AR Path="/56F50775/56F859E1/56F85D31" Ref="P12"  Part="1" 
AR Path="/56F50775/56F899AD/56F85D31" Ref="P14"  Part="1" 
F 0 "P12" H 5600 4000 50  0000 C CNN
F 1 "CONN_01X02" V 5750 4050 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B02B-XH-A_02x2.50mm_Straight" H 5650 4150 50  0001 C CNN
F 3 "" H 5650 4150 50  0000 C CNN
	1    5650 4150
	1    0    0    1   
$EndComp
Wire Wire Line
	5450 4200 5450 4300
Wire Wire Line
	5450 4300 3300 4300
Wire Wire Line
	4900 3250 4900 4100
Connection ~ 4400 3250
Wire Wire Line
	5450 3250 5450 4100
Connection ~ 4900 3250
Wire Wire Line
	3750 5400 3100 5400
Text Label 3300 4200 0    60   ~ 0
out1
Text Label 3300 4300 0    60   ~ 0
out2
$EndSCHEMATC