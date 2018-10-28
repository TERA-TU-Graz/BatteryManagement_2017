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
LIBS:tera_processors
LIBS:tera_connectors
LIBS:tera_emc_prodection
LIBS:tera_sensoric
LIBS:interlock_power
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:Altera
LIBS:analog_devices
LIBS:battery_management
LIBS:bbd
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:logo
LIBS:maxim
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:motor_drivers
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:powerint
LIBS:Power_Management
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:Worldsemi
LIBS:Xicor
LIBS:Zilog
LIBS:isolator_pwr
LIBS:BMS_Master_V7_kicad-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 11
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
L C C14
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
L MAX3390EEUD U5
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
L C C25
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
L C C26
U 1 1 57DC946D
P 4750 1050
F 0 "C26" V 4498 1050 50  0000 C CNN
F 1 "100n" V 4589 1050 50  0000 C CNN
F 2 "tera_rlc:C_0603in" H 4788 900 50  0001 C CNN
F 3 "" H 4750 1050 50  0000 C CNN
F 4 "52-100n" H -150 -250 50  0001 C CNN "HPN"
	1    4750 1050
	0    -1   -1   0   
$EndComp
$Comp
L R R41
U 1 1 57E95229
P 2150 3400
F 0 "R41" V 2100 3500 50  0000 L CNN
F 1 "10k" V 2150 3350 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 2080 3400 50  0001 C CNN
F 3 "" H 2150 3400 50  0000 C CNN
F 4 "11-10K0" H 0   0   50  0001 C CNN "HPN"
	1    2150 3400
	1    0    0    -1  
$EndComp
$Comp
L R R42
U 1 1 57E9534B
P 2300 3400
F 0 "R42" V 2250 3500 50  0000 L CNN
F 1 "10k" V 2300 3350 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 2230 3400 50  0001 C CNN
F 3 "" H 2300 3400 50  0000 C CNN
F 4 "11-10K0" H 0   0   50  0001 C CNN "HPN"
	1    2300 3400
	1    0    0    -1  
$EndComp
$Comp
L R R43
U 1 1 57E95391
P 2450 3400
F 0 "R43" V 2400 3500 50  0000 L CNN
F 1 "10k" V 2450 3350 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 2380 3400 50  0001 C CNN
F 3 "" H 2450 3400 50  0000 C CNN
F 4 "11-10K0" H 0   0   50  0001 C CNN "HPN"
	1    2450 3400
	1    0    0    -1  
$EndComp
$Comp
L R R44
U 1 1 57E95413
P 1950 4250
F 0 "R44" V 1850 4200 50  0000 L CNN
F 1 "10k" V 1950 4200 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 1880 4250 50  0001 C CNN
F 3 "" H 1950 4250 50  0000 C CNN
F 4 "11-10K0" H -650 850 50  0001 C CNN "HPN"
	1    1950 4250
	0    1    1    0   
$EndComp
$Comp
L SN74HC138DR U2
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
Text HLabel 1550 4500 0    39   Input ~ 0
SPI_CS
Text HLabel 1800 4650 0    39   Input ~ 0
GND
Text Label 3700 3650 0    39   ~ 0
NCS1
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
Text HLabel 4100 4050 2    39   Output ~ 0
NCS5
Text HLabel 4100 4150 2    39   Output ~ 0
NCS6
Text HLabel 4100 4250 2    39   Output ~ 0
NCS7
Text HLabel 4100 4350 2    39   Output ~ 0
NCS8
Text HLabel 2900 1750 0    39   Input ~ 0
SCLK
Text HLabel 2900 1550 0    39   Output ~ 0
MISO
Text HLabel 2900 1650 0    39   Input ~ 0
MOSI
Text HLabel 2000 3150 0    39   Input ~ 0
+5V
Text HLabel 3950 1350 0    39   Input ~ 0
SPI_CS
Text HLabel 4650 650  2    39   Input ~ 0
+5V
Text HLabel 3900 900  0    39   Input ~ 0
+3V3
Text HLabel 3200 2250 0    39   Input ~ 0
GND
Text Notes 2950 600  0    60   ~ 0
5V SPI should be better in a noisy environment!
Text Notes 950  3400 0    30   ~ 0
Push up resistors for 5V signal.\nIf used: disable push-pull output of stm32
NoConn ~ 4550 1850
Text HLabel 3700 1050 0    39   Input ~ 0
GND
$Sheet
S 6650 3350 900  1150
U 5930ACE1
F0 "SPI Isolator" 60
F1 "Bus_Isolator.sch" 60
F2 "+12V_Permanent" I L 6650 3450 60 
F3 "GND" I L 6650 4350 60 
F4 "+5V" I L 6650 3550 60 
F5 "NCS" I L 6650 3800 60 
F6 "MISO" T L 6650 3900 60 
F7 "SCLK" I L 6650 4000 60 
F8 "MOSI" I L 6650 4100 60 
F9 "~Alert" O R 7550 3950 60 
F10 "~Fault" O R 7550 4100 60 
$EndSheet
$Comp
L R R12
U 1 1 592FEE44
P 3100 1550
F 0 "R12" V 3050 1650 50  0000 L CNN
F 1 "100R" V 3100 1450 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 3030 1550 50  0001 C CNN
F 3 "" H 3100 1550 50  0000 C CNN
F 4 "11-100R" H 500 -1850 50  0001 C CNN "HPN"
	1    3100 1550
	0    1    1    0   
$EndComp
$Comp
L CP_Small C27
U 1 1 59301D25
P 4750 850
F 0 "C27" V 4700 1000 50  0000 C CNN
F 1 "1u" V 4700 750 50  0000 C CNN
F 2 "tera_rlc:TantalC_SizeM-1608mm_H0.9mm" H 4838 759 50  0001 L CNN
F 3 "" H 4750 850 50  0000 C CNN
F 4 "55-1u00" H 4750 850 60  0001 C CNN "HPN"
	1    4750 850 
	0    -1   1    0   
$EndComp
$Comp
L R R18
U 1 1 59304477
P 4900 2000
F 0 "R18" V 4850 2100 50  0000 L CNN
F 1 "100k" V 4800 1900 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 4830 2000 50  0001 C CNN
F 3 "" H 4900 2000 50  0000 C CNN
F 4 "11-100K" H 2300 -1400 50  0001 C CNN "HPN"
	1    4900 2000
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 59304521
P 3100 1650
F 0 "R13" V 3050 1750 50  0000 L CNN
F 1 "100R" V 3100 1550 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 3030 1650 50  0001 C CNN
F 3 "" H 3100 1650 50  0000 C CNN
F 4 "11-100R" H 500 -1750 50  0001 C CNN "HPN"
	1    3100 1650
	0    1    1    0   
$EndComp
$Comp
L R R14
U 1 1 593045A9
P 3100 1750
F 0 "R14" V 3050 1850 50  0000 L CNN
F 1 "100R" V 3100 1650 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 3030 1750 50  0001 C CNN
F 3 "" H 3100 1750 50  0000 C CNN
F 4 "11-100R" H 500 -1650 50  0001 C CNN "HPN"
	1    3100 1750
	0    1    1    0   
$EndComp
Text HLabel 5000 950  2    39   Input ~ 0
GND
$Comp
L Jumper_NO_Small JP1
U 1 1 5930CF8E
P 4250 2450
F 0 "JP1" H 4150 2500 50  0000 C CNN
F 1 "Jumper_NO_Small" H 4260 2390 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2_1mm" H 4250 2450 50  0001 C CNN
F 3 "" H 4250 2450 50  0000 C CNN
	1    4250 2450
	1    0    0    -1  
$EndComp
Text Label 4550 1550 0    40   ~ 0
MISO_5V_1
Text Label 4550 1650 0    40   ~ 0
MOSI_5V_1
Text Label 4550 1750 0    40   ~ 0
SCLK_5V_1
Text Label 3950 1550 2    40   ~ 0
MISO_1
Text Label 3950 1650 2    40   ~ 0
MOSI_1
Text Label 3950 1750 2    40   ~ 0
SCLK_1
Text Label 4000 2450 2    40   ~ 0
MISO_1
Text Label 4000 2550 2    40   ~ 0
MOSI_1
Text Label 4000 2650 2    40   ~ 0
SCLK_1
Text Label 4500 2450 0    40   ~ 0
MISO_5V_1
Text Label 4500 2550 0    40   ~ 0
MOSI_5V_1
Text Label 4500 2650 0    40   ~ 0
SCLK_5V_1
$Comp
L Jumper_NO_Small JP4
U 1 1 59311515
P 4250 2550
F 0 "JP4" H 4150 2600 50  0000 C CNN
F 1 "Jumper_NO_Small" H 4260 2490 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2_1mm" H 4250 2550 50  0001 C CNN
F 3 "" H 4250 2550 50  0000 C CNN
	1    4250 2550
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP5
U 1 1 5931159A
P 4250 2650
F 0 "JP5" H 4150 2700 50  0000 C CNN
F 1 "Jumper_NO_Small" H 4260 2590 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2_1mm" H 4250 2650 50  0001 C CNN
F 3 "" H 4250 2650 50  0000 C CNN
	1    4250 2650
	1    0    0    -1  
$EndComp
Text HLabel 7750 3950 2    40   Output ~ 0
~Alert
Text HLabel 7750 4100 2    40   Output ~ 0
~Fault
Text HLabel 5350 1750 2    39   Output ~ 0
SCLK_5V
Text HLabel 5350 1650 2    39   Output ~ 0
MOSI_5V
Text HLabel 5350 1550 2    39   Input ~ 0
MISO_5V
Text HLabel 6500 3900 0    39   Input ~ 0
MISO_5V
Text HLabel 6500 4100 0    39   Output ~ 0
MOSI_5V
Text HLabel 6500 4000 0    39   Output ~ 0
SCLK_5V
Text Label 6650 3800 2    39   ~ 0
NCS1
Text HLabel 6500 3550 0    39   Input ~ 0
+5V
Text HLabel 6500 3450 0    39   Input ~ 0
+12V_Permanent
$Comp
L BSS205N Q2
U 1 1 5936AA07
P 2150 4500
F 0 "Q2" H 2237 4596 50  0000 L CNN
F 1 "BSS205N" H 2237 4505 50  0000 L CNN
F 2 "tera_atomic_infineon:BSS205N" H 2250 4475 50  0001 L CIN
F 3 "" H 2250 4625 50  0000 L CNN
F 4 "24-2050" H 2450 4400 60  0001 C CNN "HPN"
	1    2150 4500
	1    0    0    -1  
$EndComp
Text HLabel 2700 4150 0    39   Input ~ 0
+5V
$Comp
L R R10
U 1 1 5936D6AC
P 1750 4500
F 0 "R10" V 1650 4500 50  0000 L CNN
F 1 "1k" V 1750 4450 50  0000 L CNN
F 2 "tera_rlc:R_0603in" V 1680 4500 50  0001 C CNN
F 3 "" H 1750 4500 50  0000 C CNN
F 4 "11-1K00" H -850 1100 50  0001 C CNN "HPN"
	1    1750 4500
	0    1    1    0   
$EndComp
Text HLabel 1750 4250 0    39   Input ~ 0
+5V
Text Label 2200 4250 0    39   ~ 0
SPI_NCS_5V
NoConn ~ 3700 3750
NoConn ~ 3700 3850
NoConn ~ 3700 3950
Text HLabel 6500 4350 0    39   Input ~ 0
GND
Wire Wire Line
	3200 4650 3200 4600
Wire Wire Line
	1800 4650 3200 4650
Wire Wire Line
	2100 4250 2700 4250
Wire Wire Line
	2700 4350 2650 4350
Wire Wire Line
	3200 3150 3200 3400
Wire Wire Line
	2000 3150 3350 3150
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
	4350 650  4350 1150
Wire Wire Line
	4150 900  4150 1150
Wire Wire Line
	3950 1850 3900 1850
Wire Wire Line
	3900 1850 3900 2250
Wire Wire Line
	3200 2250 4900 2250
Wire Wire Line
	4250 2050 4250 2250
Wire Wire Line
	2000 3650 2700 3650
Wire Wire Line
	2000 3750 2700 3750
Wire Wire Line
	2000 3850 2700 3850
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
Connection ~ 3900 2250
Connection ~ 4250 2250
Connection ~ 2150 3650
Connection ~ 2300 3750
Connection ~ 2450 3850
Connection ~ 2150 3150
Connection ~ 2300 3150
Connection ~ 2450 3150
Wire Wire Line
	3250 1650 3950 1650
Wire Wire Line
	3250 1750 3950 1750
Wire Wire Line
	4900 1850 4900 1550
Connection ~ 4900 1550
Wire Wire Line
	4900 2250 4900 2150
Wire Wire Line
	3900 900  4150 900 
Wire Wire Line
	4050 1050 4150 1050
Connection ~ 4150 1050
Wire Wire Line
	3700 1050 3750 1050
Wire Wire Line
	2900 1550 2950 1550
Wire Wire Line
	3250 1550 3950 1550
Wire Wire Line
	2900 1750 2950 1750
Wire Wire Line
	2900 1650 2950 1650
Wire Wire Line
	4600 1050 4350 1050
Wire Wire Line
	4650 850  4350 850 
Connection ~ 4350 1050
Wire Wire Line
	4650 650  4350 650 
Connection ~ 4350 850 
Wire Wire Line
	4850 850  4950 850 
Wire Wire Line
	4950 850  4950 1050
Wire Wire Line
	4950 1050 4900 1050
Wire Wire Line
	5000 950  4950 950 
Connection ~ 4950 950 
Wire Wire Line
	4000 2450 4150 2450
Wire Wire Line
	4000 2550 4150 2550
Wire Wire Line
	4000 2650 4150 2650
Wire Wire Line
	4350 2450 4500 2450
Wire Wire Line
	4350 2550 4500 2550
Wire Wire Line
	4350 2650 4500 2650
Wire Wire Line
	6500 3900 6650 3900
Wire Wire Line
	6500 4000 6650 4000
Wire Wire Line
	6500 4100 6650 4100
Wire Wire Line
	6500 3550 6650 3550
Wire Wire Line
	7550 3950 7750 3950
Wire Wire Line
	7550 4100 7750 4100
Wire Wire Line
	6500 3450 6650 3450
Wire Wire Line
	2650 4350 2650 4650
Wire Wire Line
	2150 4300 2150 4250
Connection ~ 2150 4250
Wire Wire Line
	2150 4600 2150 4650
Connection ~ 2150 4650
Wire Wire Line
	1900 4500 1950 4500
Wire Wire Line
	1550 4500 1600 4500
Wire Wire Line
	1750 4250 1800 4250
Wire Wire Line
	6500 4350 6650 4350
Wire Wire Line
	5350 1550 4550 1550
Wire Wire Line
	5350 1650 4550 1650
Wire Wire Line
	5350 1750 4550 1750
$EndSCHEMATC
