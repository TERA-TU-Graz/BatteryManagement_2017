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
LIBS:HostInterfaceSplitter-V2-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "BMS Host Interface Splitter"
Date "2017-01-06"
Rev "2"
Comp "TERA TU Graz"
Comment1 "Rene Pöschl"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74HCT1G125GW-Q100 U2
U 1 1 57EAD344
P 4500 3150
AR Path="/57EAD33B/57EAD344" Ref="U2"  Part="1" 
AR Path="/57EB35FE/57EAD344" Ref="U4"  Part="1" 
AR Path="/57EB6BDD/57EAD344" Ref="U6"  Part="1" 
AR Path="/57EB6BE8/57EAD344" Ref="U8"  Part="1" 
F 0 "U2" H 4250 3450 50  0000 L CNN
F 1 "74HCT1G125GW-Q100" H 3500 3350 50  0000 L CNN
F 2 "tera_atomic_ic:74HCT1G125GW-Q100H" H 4500 3500 50  0001 C CNN
F 3 "" H 4445 3100 50  0000 C CNN
F 4 "20-2090" H 4500 3150 60  0001 C CNN "HPN"
	1    4500 3150
	-1   0    0    -1  
$EndComp
Text HLabel 3900 2850 0    40   Input ~ 0
5V
Text HLabel 3950 3450 0    40   Input ~ 0
GND
Text HLabel 3950 3200 0    40   3State ~ 0
MISO
Text HLabel 4800 3100 2    40   Input ~ 0
NCS
Text Label 4800 3200 0    40   ~ 0
MISO_S
$Comp
L C_Small C2
U 1 1 57EAD52B
P 4050 3000
AR Path="/57EAD33B/57EAD52B" Ref="C2"  Part="1" 
AR Path="/57EB35FE/57EAD52B" Ref="C4"  Part="1" 
AR Path="/57EB6BDD/57EAD52B" Ref="C6"  Part="1" 
AR Path="/57EB6BE8/57EAD52B" Ref="C8"  Part="1" 
F 0 "C2" H 4142 3046 50  0000 L CNN
F 1 "100n" H 4142 2955 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 4142 2909 50  0001 L CNN
F 3 "" H 4050 3000 50  0000 C CNN
F 4 "52-100n" H 4050 3000 60  0001 C CNN "HPN"
	1    4050 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2850 4500 2850
Wire Wire Line
	4500 2850 4500 2900
Wire Wire Line
	4050 2850 4050 2900
Connection ~ 4050 2850
Wire Wire Line
	3950 3450 4500 3450
Wire Wire Line
	4500 3450 4500 3400
Wire Wire Line
	4050 3100 4050 3450
Connection ~ 4050 3450
Wire Wire Line
	3950 3200 4200 3200
$Comp
L CONN_01X06 P5
U 1 1 57EAD708
P 7150 3100
AR Path="/57EAD33B/57EAD708" Ref="P5"  Part="1" 
AR Path="/57EB35FE/57EAD708" Ref="P8"  Part="1" 
AR Path="/57EB6BDD/57EAD708" Ref="P11"  Part="1" 
AR Path="/57EB6BE8/57EAD708" Ref="P14"  Part="1" 
F 0 "P5" H 7228 3141 50  0000 L CNN
F 1 "SPI_Out" H 7228 3050 50  0000 L CNN
F 2 "tera_Connectors_Molex:Molex_PicoBlade_53398-0671_06x1.25mm_Straight" H 7150 3100 50  0001 C CNN
F 3 "" H 7150 3100 50  0000 C CNN
F 4 "03-0206" H 7150 3100 60  0001 C CNN "HPN"
	1    7150 3100
	1    0    0    -1  
$EndComp
Text Label 6950 3050 2    40   ~ 0
MISO_S
Text Label 6950 3150 2    40   ~ 0
MOSI_S
Text Label 6950 2950 2    40   ~ 0
CLK_S
Text HLabel 6950 3250 0    40   Input ~ 0
NCS
Text HLabel 6950 3350 0    40   Input ~ 0
GND
Text HLabel 6950 2850 0    40   Input ~ 0
5V
$Comp
L NC7WZ16P6X U3
U 1 1 57EAD897
P 4500 4150
AR Path="/57EAD33B/57EAD897" Ref="U3"  Part="1" 
AR Path="/57EB35FE/57EAD897" Ref="U5"  Part="1" 
AR Path="/57EB6BDD/57EAD897" Ref="U7"  Part="1" 
AR Path="/57EB6BE8/57EAD897" Ref="U9"  Part="1" 
F 0 "U3" H 4600 4350 60  0000 C CNN
F 1 "NC7WZ16P6X" H 4850 3950 60  0000 C CNN
F 2 "tera_atomic_ic:NC7WZ16P6X" H 4500 4500 60  0001 C CNN
F 3 "" H 4500 4200 60  0001 C CNN
F 4 "20-2092" H 4500 4150 60  0001 C CNN "HPN"
	1    4500 4150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 57EADAC4
P 4800 3850
AR Path="/57EAD33B/57EADAC4" Ref="C3"  Part="1" 
AR Path="/57EB35FE/57EADAC4" Ref="C5"  Part="1" 
AR Path="/57EB6BDD/57EADAC4" Ref="C7"  Part="1" 
AR Path="/57EB6BE8/57EADAC4" Ref="C9"  Part="1" 
F 0 "C3" V 4571 3850 50  0000 C CNN
F 1 "100n" V 4662 3850 50  0000 C CNN
F 2 "tera_rlc:C_0603in" H 4892 3759 50  0001 L CNN
F 3 "" H 4800 3850 50  0000 C CNN
F 4 "52-100n" V 4800 3850 60  0001 C CNN "HPN"
	1    4800 3850
	0    1    1    0   
$EndComp
Text HLabel 4050 3850 0    40   Input ~ 0
5V
Text HLabel 4000 4500 0    40   Input ~ 0
GND
Text HLabel 4900 3850 2    40   Input ~ 0
GND
Wire Wire Line
	4050 3850 4700 3850
Wire Wire Line
	4500 3900 4500 3850
Connection ~ 4500 3850
Wire Wire Line
	4000 4500 4500 4500
Wire Wire Line
	4500 4500 4500 4400
Text HLabel 4050 4100 0    40   Input ~ 0
CLK
Text HLabel 4050 4200 0    40   Input ~ 0
MOSI
Wire Wire Line
	4050 4100 4300 4100
Wire Wire Line
	4050 4200 4300 4200
Text Label 4700 4100 0    40   ~ 0
CLK_S
Text Label 4700 4200 0    40   ~ 0
MOSI_S
$Comp
L CONN_01X02 P4
U 1 1 57EAE469
P 3800 5200
AR Path="/57EAD33B/57EAE469" Ref="P4"  Part="1" 
AR Path="/57EB35FE/57EAE469" Ref="P7"  Part="1" 
AR Path="/57EB6BDD/57EAE469" Ref="P10"  Part="1" 
AR Path="/57EB6BE8/57EAE469" Ref="P13"  Part="1" 
F 0 "P4" H 3719 4925 50  0000 C CNN
F 1 "Digital_In" H 3719 5016 50  0000 C CNN
F 2 "tera_Connectors_JST:JST_EH_B02B-EH-A_02x2.50mm_Straight" H 3800 5200 50  0001 C CNN
F 3 "" H 3800 5200 50  0000 C CNN
F 4 "02-1902" H 3800 5200 60  0001 C CNN "HPN"
	1    3800 5200
	-1   0    0    1   
$EndComp
$Comp
L R_Small R3
U 1 1 57EAE5B7
P 4150 5450
AR Path="/57EAD33B/57EAE5B7" Ref="R3"  Part="1" 
AR Path="/57EB35FE/57EAE5B7" Ref="R5"  Part="1" 
AR Path="/57EB6BDD/57EAE5B7" Ref="R7"  Part="1" 
AR Path="/57EB6BE8/57EAE5B7" Ref="R9"  Part="1" 
F 0 "R3" H 4209 5496 50  0000 L CNN
F 1 "10K" H 4209 5405 50  0000 L CNN
F 2 "tera_rlc:R_0805in" H 4209 5359 50  0001 L CNN
F 3 "" H 4150 5450 50  0000 C CNN
F 4 "11-10K0" H 4150 5450 60  0001 C CNN "HPN"
	1    4150 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 5250 4650 5250
Wire Wire Line
	4150 5250 4150 5350
$Comp
L R_Small R4
U 1 1 57EAE7D5
P 4450 5450
AR Path="/57EAD33B/57EAE7D5" Ref="R4"  Part="1" 
AR Path="/57EB35FE/57EAE7D5" Ref="R6"  Part="1" 
AR Path="/57EB6BDD/57EAE7D5" Ref="R8"  Part="1" 
AR Path="/57EB6BE8/57EAE7D5" Ref="R10"  Part="1" 
F 0 "R4" H 4509 5496 50  0000 L CNN
F 1 "10K" H 4509 5405 50  0000 L CNN
F 2 "tera_rlc:R_0805in" H 4509 5359 50  0001 L CNN
F 3 "" H 4450 5450 50  0000 C CNN
F 4 "11-10K0" H 4450 5450 60  0001 C CNN "HPN"
	1    4450 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 5150 4650 5150
Wire Wire Line
	4450 5150 4450 5350
Text HLabel 3900 5650 0    40   Input ~ 0
GND
Wire Wire Line
	3900 5650 4450 5650
Wire Wire Line
	4150 5650 4150 5550
Wire Wire Line
	4450 5650 4450 5550
Connection ~ 4150 5650
Text HLabel 4650 5150 2    40   Output ~ 0
~ALERT
Connection ~ 4450 5150
Text HLabel 4650 5250 2    40   Output ~ 0
~FAULT
Connection ~ 4150 5250
$Comp
L CONN_01X02 P6
U 1 1 57EAECD6
P 7150 3700
AR Path="/57EAD33B/57EAECD6" Ref="P6"  Part="1" 
AR Path="/57EB35FE/57EAECD6" Ref="P9"  Part="1" 
AR Path="/57EB6BDD/57EAECD6" Ref="P12"  Part="1" 
AR Path="/57EB6BE8/57EAECD6" Ref="P15"  Part="1" 
F 0 "P6" H 7228 3741 50  0000 L CNN
F 1 "12V_Out" H 7228 3650 50  0000 L CNN
F 2 "tera_Connectors_JST:JST_XH_B02B-XH-A_02x2.50mm_Straight" H 7150 3700 50  0001 C CNN
F 3 "" H 7150 3700 50  0000 C CNN
F 4 "02-0902" H 7150 3700 60  0001 C CNN "HPN"
	1    7150 3700
	1    0    0    1   
$EndComp
Text HLabel 6950 3750 0    40   Input ~ 0
GND
Text HLabel 6950 3650 0    40   Input ~ 0
12V
$EndSCHEMATC
