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
LIBS:local_power
LIBS:ft232rl
LIBS:relais
LIBS:Supply
LIBS:tera_connectors
LIBS:tera_emc_prodection
LIBS:tera_general
LIBS:tera_logic
LIBS:tera_processors
LIBS:tera_switches
LIBS:tera_sensoric
LIBS:fennek_power_distribution-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3600 2250 3750 2250
Wire Wire Line
	3650 2150 3650 2350
$Comp
L C_Small C7
U 1 1 593789CD
P 5900 2250
F 0 "C7" V 5950 2300 50  0000 L CNN
F 1 "100n" V 5950 2000 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 5992 2159 50  0001 L CNN
F 3 "" H 5900 2250 50  0000 C CNN
F 4 "52-100n" H 5900 2250 60  0001 C CNN "HPN"
	1    5900 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 2250 5750 2150
Wire Wire Line
	4250 2250 5800 2250
Connection ~ 5750 2250
$Comp
L C_Small C8
U 1 1 593789DF
P 5900 2950
F 0 "C8" V 5950 3000 50  0000 L CNN
F 1 "100n" V 5950 2700 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 5992 2859 50  0001 L CNN
F 3 "" H 5900 2950 50  0000 C CNN
F 4 "52-100n" H 5900 2950 60  0001 C CNN "HPN"
	1    5900 2950
	0    1    1    0   
$EndComp
$Comp
L PWR_FLAG #FLG012
U 1 1 593789F0
P 5600 2150
F 0 "#FLG012" H 5600 2245 50  0001 C CNN
F 1 "PWR_FLAG" H 5600 2250 15  0000 C CNN
F 2 "" H 5600 2150 50  0000 C CNN
F 3 "" H 5600 2150 50  0000 C CNN
	1    5600 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2150 5600 2250
Connection ~ 5600 2250
$Comp
L PWR_FLAG #FLG013
U 1 1 593789F8
P 5600 2850
F 0 "#FLG013" H 5600 2945 50  0001 C CNN
F 1 "PWR_FLAG" H 5600 2950 15  0000 C CNN
F 2 "" H 5600 2850 50  0000 C CNN
F 3 "" H 5600 2850 50  0000 C CNN
	1    5600 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2350 3750 2350
Connection ~ 3650 2250
Wire Wire Line
	4400 2350 4250 2350
Wire Wire Line
	3650 3850 3650 4250
Wire Wire Line
	3650 4250 3750 4250
Connection ~ 3650 4150
Text HLabel 4250 4150 2    50   Input ~ 0
+12VDC_BMS
Text HLabel 4250 4250 2    50   Input ~ 0
+12VDC_BMS_Switched
Text HLabel 5750 2150 1    50   Output ~ 0
+3V3
Text HLabel 5750 2850 1    50   Output ~ 0
+5V
NoConn ~ 4250 3350
NoConn ~ 3750 3550
Text HLabel 3750 3450 0    50   Input ~ 0
IL_master-
Text HLabel 4250 3450 2    50   Output ~ 0
IL_master+
NoConn ~ 4250 3550
NoConn ~ 3750 3350
Text HLabel 4250 3150 2    50   Output ~ 0
Interlock_OK
Wire Wire Line
	3600 4050 3750 4050
Wire Wire Line
	3650 3150 3750 3150
Text HLabel 4400 2150 2    50   Input ~ 0
ISense_MCU
Text HLabel 4250 3950 2    50   Input ~ 0
ISense_Main
Wire Wire Line
	3650 3050 3750 3050
Connection ~ 3650 3150
Text HLabel 4250 3650 2    50   Input ~ 0
PreCharge_Fault
Text HLabel 4250 3750 2    50   Input ~ 0
MainRelay_Fault
Text HLabel 3750 3750 0    50   Input ~ 0
12V_Relay_Fault
Text HLabel 4250 2550 2    50   Output ~ 0
NCS_MainRelay
Text HLabel 4250 2450 2    50   Output ~ 0
NCS_PreCharge
Text HLabel 3750 2450 0    50   Output ~ 0
NCS_12V_Relay
Text HLabel 4250 2650 2    50   Output ~ 0
SPI_CLK
Text HLabel 4250 2750 2    50   Output ~ 0
SPI_MOSI
Text HLabel 4250 2850 2    50   3State ~ 0
SPI_MISO
Wire Wire Line
	3600 2750 3750 2750
Wire Wire Line
	3650 2850 3750 2850
Connection ~ 3650 2750
Wire Wire Line
	3650 2650 3750 2650
Wire Wire Line
	3650 2550 3750 2550
Connection ~ 3650 2650
Text HLabel 6050 2250 2    60   Input ~ 0
GND_BN
Text HLabel 6050 2950 2    60   Input ~ 0
GND_BN
Text HLabel 4400 2350 2    60   Input ~ 0
GND_BN
Text HLabel 4400 3250 2    60   Input ~ 0
GND_BN
Wire Wire Line
	4400 3250 4250 3250
Text HLabel 3600 4050 0    60   Input ~ 0
GND_BN
Text HLabel 3600 3100 0    60   Input ~ 0
GND_BN
Text HLabel 3600 2750 0    60   Input ~ 0
GND_BN
Text HLabel 3600 2250 0    60   Input ~ 0
GND_BN
Wire Wire Line
	3650 2150 3750 2150
Text HLabel 4400 3050 2    60   Input ~ 0
GND_BN
Wire Wire Line
	4400 3050 4250 3050
Wire Wire Line
	4400 2150 4250 2150
Wire Wire Line
	6050 2250 6000 2250
Wire Wire Line
	5600 2850 5600 2950
Wire Wire Line
	4250 2950 5800 2950
Wire Wire Line
	5750 2950 5750 2850
Connection ~ 5750 2950
Wire Wire Line
	6050 2950 6000 2950
Connection ~ 5600 2950
Text HLabel 4400 3850 2    60   Input ~ 0
GND_BN
Wire Wire Line
	4400 3850 4250 3850
$Comp
L CONN_02X22 P3
U 1 1 5937F738
P 4000 3200
F 0 "P3" H 4000 4465 50  0000 C CNN
F 1 "CONN_02X22" H 4000 4374 50  0000 C CNN
F 2 "tera_Connectors_other:ESW-122-12-L-D" H 4000 2300 50  0001 C CNN
F 3 "" H 4000 2300 50  0000 C CNN
	1    4000 3200
	1    0    0    1   
$EndComp
Wire Wire Line
	3650 3250 3750 3250
$Comp
L C_Small C9
U 1 1 5933A614
P 5900 4050
F 0 "C9" V 5950 4100 50  0000 L CNN
F 1 "100n" V 5950 3800 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 5992 3959 50  0001 L CNN
F 3 "" H 5900 4050 50  0000 C CNN
F 4 "52-100n" H 5900 4050 60  0001 C CNN "HPN"
	1    5900 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 3950 5750 4050
Wire Wire Line
	4250 4050 5800 4050
Connection ~ 5750 4050
Text HLabel 5750 3950 1    50   Output ~ 0
+3V3
Text HLabel 6050 4050 2    60   Input ~ 0
GND_BN
Wire Wire Line
	6050 4050 6000 4050
Wire Wire Line
	3750 3950 3650 3950
Connection ~ 3650 4050
Wire Wire Line
	3750 3850 3650 3850
Connection ~ 3650 3950
Wire Wire Line
	3750 4150 3650 4150
Wire Wire Line
	3650 2550 3650 2850
Wire Wire Line
	3650 3650 3750 3650
Wire Wire Line
	3650 2950 3650 3250
Text HLabel 3650 3650 0    60   Input ~ 0
GND_BN
Wire Wire Line
	3650 3100 3600 3100
Connection ~ 3650 3100
Wire Wire Line
	3650 2950 3750 2950
Connection ~ 3650 3050
$EndSCHEMATC
