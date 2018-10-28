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
Sheet 7 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5900 4250 2    60   Input ~ 0
CBx
Text HLabel 2700 4750 0    60   Input ~ 0
Celln-
Text HLabel 2750 3200 0    60   Input ~ 0
Celln+
$Comp
L R R1
U 1 1 56F08038
P 3800 3400
AR Path="/56F07FAD/56F08038" Ref="R1"  Part="1" 
AR Path="/56F0A894/56F08038" Ref="R5"  Part="1" 
AR Path="/56F0B664/56F08038" Ref="R9"  Part="1" 
AR Path="/56F0B66A/56F08038" Ref="R13"  Part="1" 
AR Path="/56F0C03E/56F08038" Ref="R17"  Part="1" 
AR Path="/56F0C044/56F08038" Ref="R21"  Part="1" 
F 0 "R21" V 3700 3350 50  0000 L CNN
F 1 "2K2" V 3800 3350 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 3730 3400 50  0001 C CNN
F 3 "" H 3800 3400 50  0000 C CNN
	1    3800 3400
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 56F0808B
P 3800 3850
AR Path="/56F07FAD/56F0808B" Ref="D2"  Part="1" 
AR Path="/56F0A894/56F0808B" Ref="D5"  Part="1" 
AR Path="/56F0B664/56F0808B" Ref="D8"  Part="1" 
AR Path="/56F0B66A/56F0808B" Ref="D11"  Part="1" 
AR Path="/56F0C03E/56F0808B" Ref="D14"  Part="1" 
AR Path="/56F0C044/56F0808B" Ref="D17"  Part="1" 
F 0 "D17" V 3846 3742 50  0000 R CNN
F 1 "LED" V 3755 3742 50  0000 R CNN
F 2 "LEDs:LED_0805" H 3800 3850 50  0001 C CNN
F 3 "" H 3800 3850 50  0000 C CNN
	1    3800 3850
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D1
U 1 1 56F08187
P 2850 3850
AR Path="/56F07FAD/56F08187" Ref="D1"  Part="1" 
AR Path="/56F0A894/56F08187" Ref="D4"  Part="1" 
AR Path="/56F0B664/56F08187" Ref="D7"  Part="1" 
AR Path="/56F0B66A/56F08187" Ref="D10"  Part="1" 
AR Path="/56F0C03E/56F08187" Ref="D13"  Part="1" 
AR Path="/56F0C044/56F08187" Ref="D16"  Part="1" 
F 0 "D16" V 2804 3929 50  0000 L CNN
F 1 "5.1V" V 2895 3929 50  0000 L CNN
F 2 "tera_general:DO-214AA" H 2850 3850 50  0001 C CNN
F 3 "" H 2850 3850 50  0000 C CNN
	1    2850 3850
	0    1    1    0   
$EndComp
$Comp
L ZENER D3
U 1 1 56F08242
P 4750 4500
AR Path="/56F07FAD/56F08242" Ref="D3"  Part="1" 
AR Path="/56F0A894/56F08242" Ref="D6"  Part="1" 
AR Path="/56F0B664/56F08242" Ref="D9"  Part="1" 
AR Path="/56F0B66A/56F08242" Ref="D12"  Part="1" 
AR Path="/56F0C03E/56F08242" Ref="D15"  Part="1" 
AR Path="/56F0C044/56F08242" Ref="D18"  Part="1" 
F 0 "D18" V 4704 4579 50  0000 L CNN
F 1 "5.1V" V 4795 4579 50  0000 L CNN
F 2 "Diodes_SMD:SOD-323" H 4750 4500 50  0001 C CNN
F 3 "" H 4750 4500 50  0000 C CNN
	1    4750 4500
	0    1    1    0   
$EndComp
$Comp
L BSS205N Q1
U 1 1 56F08379
P 3950 4500
AR Path="/56F07FAD/56F08379" Ref="Q1"  Part="1" 
AR Path="/56F0A894/56F08379" Ref="Q2"  Part="1" 
AR Path="/56F0B664/56F08379" Ref="Q3"  Part="1" 
AR Path="/56F0B66A/56F08379" Ref="Q4"  Part="1" 
AR Path="/56F0C03E/56F08379" Ref="Q5"  Part="1" 
AR Path="/56F0C044/56F08379" Ref="Q6"  Part="1" 
F 0 "Q6" H 4023 4596 50  0000 L CNN
F 1 "BSS205N" H 4023 4505 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 4050 4475 50  0001 L CIN
F 3 "" H 4050 4625 50  0000 L CNN
	1    3950 4500
	-1   0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 56F084AC
P 5150 4500
AR Path="/56F07FAD/56F084AC" Ref="R3"  Part="1" 
AR Path="/56F0A894/56F084AC" Ref="R7"  Part="1" 
AR Path="/56F0B664/56F084AC" Ref="R11"  Part="1" 
AR Path="/56F0B66A/56F084AC" Ref="R15"  Part="1" 
AR Path="/56F0C03E/56F084AC" Ref="R19"  Part="1" 
AR Path="/56F0C044/56F084AC" Ref="R23"  Part="1" 
F 0 "R23" H 5220 4546 50  0000 L CNN
F 1 "2M" H 5220 4455 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" V 5080 4500 50  0001 C CNN
F 3 "" H 5150 4500 50  0000 C CNN
	1    5150 4500
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 56F085A7
P 5550 4250
AR Path="/56F07FAD/56F085A7" Ref="R4"  Part="1" 
AR Path="/56F0A894/56F085A7" Ref="R8"  Part="1" 
AR Path="/56F0B664/56F085A7" Ref="R12"  Part="1" 
AR Path="/56F0B66A/56F085A7" Ref="R16"  Part="1" 
AR Path="/56F0C03E/56F085A7" Ref="R20"  Part="1" 
AR Path="/56F0C044/56F085A7" Ref="R24"  Part="1" 
F 0 "R24" V 5343 4250 50  0000 C CNN
F 1 "1K" V 5434 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5480 4250 50  0001 C CNN
F 3 "" H 5550 4250 50  0000 C CNN
	1    5550 4250
	0    1    1    0   
$EndComp
Text HLabel 5850 3200 2    60   Input ~ 0
VCn
Wire Wire Line
	3800 3550 3800 3650
Wire Wire Line
	4100 4100 4100 3550
Wire Wire Line
	3800 4100 4100 4100
Wire Wire Line
	3800 4100 3800 4050
Wire Wire Line
	3950 4100 3950 4300
Connection ~ 3950 4100
Wire Wire Line
	2750 3200 5850 3200
Wire Wire Line
	3800 3200 3800 3250
Wire Wire Line
	4100 3200 4100 3250
Connection ~ 3800 3200
Wire Wire Line
	2700 4750 5150 4750
Wire Wire Line
	3950 4750 3950 4600
Wire Wire Line
	4750 4750 4750 4700
Connection ~ 3950 4750
Wire Wire Line
	4750 4300 4750 4250
Wire Wire Line
	4150 4250 5400 4250
Wire Wire Line
	4150 4250 4150 4500
Wire Wire Line
	5150 4250 5150 4350
Connection ~ 4750 4250
Wire Wire Line
	5150 4750 5150 4650
Connection ~ 4750 4750
Wire Wire Line
	5900 4250 5700 4250
Connection ~ 5150 4250
Wire Wire Line
	2850 4050 2850 4750
Connection ~ 2850 4750
Wire Wire Line
	2850 3650 2850 3200
Connection ~ 2850 3200
Connection ~ 4100 3200
$Comp
L C C1
U 1 1 56F0944E
P 3400 3900
AR Path="/56F07FAD/56F0944E" Ref="C1"  Part="1" 
AR Path="/56F0A894/56F0944E" Ref="C2"  Part="1" 
AR Path="/56F0B664/56F0944E" Ref="C3"  Part="1" 
AR Path="/56F0B66A/56F0944E" Ref="C4"  Part="1" 
AR Path="/56F0C03E/56F0944E" Ref="C5"  Part="1" 
AR Path="/56F0C044/56F0944E" Ref="C6"  Part="1" 
F 0 "C6" H 3515 3946 50  0000 L CNN
F 1 "100n" H 3515 3855 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3438 3750 50  0001 C CNN
F 3 "" H 3400 3900 50  0000 C CNN
	1    3400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3750 3400 3200
Connection ~ 3400 3200
Wire Wire Line
	3400 4050 3400 4750
Connection ~ 3400 4750
Text HLabel 4600 3400 2    60   Input ~ 0
Heat
$Comp
L R_Heat R22
U 1 1 56F12F13
P 4100 3400
AR Path="/56F0C044/56F12F13" Ref="R22"  Part="1" 
AR Path="/56F07FAD/56F12F13" Ref="R2"  Part="1" 
AR Path="/56F0A894/56F12F13" Ref="R6"  Part="1" 
AR Path="/56F0B664/56F12F13" Ref="R10"  Part="1" 
AR Path="/56F0B66A/56F12F13" Ref="R14"  Part="1" 
AR Path="/56F0C03E/56F12F13" Ref="R18"  Part="1" 
F 0 "R22" H 4170 3446 50  0000 L CNN
F 1 "3R3" V 4100 3350 50  0000 L CNN
F 2 "tera_general:HS15-1EP" V 4030 3400 50  0001 C CNN
F 3 "" H 4100 3400 50  0000 C CNN
	1    4100 3400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4600 3400 4200 3400
$EndSCHEMATC
