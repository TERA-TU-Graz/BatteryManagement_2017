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
Sheet 8 11
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
L SUPPRESSOR D13
U 1 1 56F60DD7
P 7300 3250
AR Path="/56F507DC/56F600A4/56F60DD7" Ref="D13"  Part="1" 
AR Path="/56F507DC/56F5B634/56F60DD7" Ref="D15"  Part="1" 
AR Path="/58175C82/56F60DD7" Ref="D15"  Part="1" 
F 0 "D15" H 7300 3350 50  0000 C CNN
F 1 "SUPPRESSOR" H 7600 3200 50  0000 C CNN
F 2 "tera_sot:SOT-23" V 7450 3450 60  0001 C CNN
F 3 "" V 7450 3450 60  0000 C CNN
F 4 "21-9011" H 0   0   50  0001 C CNN "HPN"
	1    7300 3250
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP7
U 1 1 56F60DD8
P 5450 3250
AR Path="/56F507DC/56F600A4/56F60DD8" Ref="JP7"  Part="1" 
AR Path="/56F507DC/56F5B634/56F60DD8" Ref="JP9"  Part="1" 
AR Path="/58175C82/56F60DD8" Ref="JP9"  Part="1" 
F 0 "JP9" H 5450 3330 50  0000 C CNN
F 1 "Jumper_NO_Small" H 5460 3190 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2" H 5450 3250 60  0001 C CNN
F 3 "" H 5450 3250 60  0000 C CNN
	1    5450 3250
	1    0    0    -1  
$EndComp
$Comp
L Jumper_NO_Small JP8
U 1 1 56F60DD9
P 5450 2250
AR Path="/56F507DC/56F600A4/56F60DD9" Ref="JP8"  Part="1" 
AR Path="/56F507DC/56F5B634/56F60DD9" Ref="JP10"  Part="1" 
AR Path="/58175C82/56F60DD9" Ref="JP10"  Part="1" 
F 0 "JP10" H 5450 2330 50  0000 C CNN
F 1 "Jumper_NO_Small" H 5460 2190 50  0001 C CNN
F 2 "tera_general:SOLDERJUMPER_2" H 5450 2250 60  0001 C CNN
F 3 "" H 5450 2250 60  0000 C CNN
	1    5450 2250
	1    0    0    -1  
$EndComp
$Comp
L SUPPRESSOR D12
U 1 1 56F60DDA
P 4650 3300
AR Path="/56F507DC/56F600A4/56F60DDA" Ref="D12"  Part="1" 
AR Path="/56F507DC/56F5B634/56F60DDA" Ref="D14"  Part="1" 
AR Path="/58175C82/56F60DDA" Ref="D14"  Part="1" 
F 0 "D14" H 4650 3400 50  0000 C CNN
F 1 "SUPPRESSOR" H 4950 3250 50  0000 C CNN
F 2 "tera_sot:SOT-23" V 4800 3500 60  0001 C CNN
F 3 "" V 4800 3500 60  0000 C CNN
F 4 "21-9011" H 0   0   50  0001 C CNN "HPN"
	1    4650 3300
	1    0    0    -1  
$EndComp
$Comp
L R R24
U 1 1 56F60DDB
P 6350 3850
AR Path="/56F507DC/56F600A4/56F60DDB" Ref="R24"  Part="1" 
AR Path="/56F507DC/56F5B634/56F60DDB" Ref="R27"  Part="1" 
AR Path="/58175C82/56F60DDB" Ref="R27"  Part="1" 
F 0 "R27" V 6430 3850 50  0000 C CNN
F 1 "60R" V 6350 3850 50  0000 C CNN
F 2 "tera_rlc:R_0603in" V 6280 3850 30  0001 C CNN
F 3 "" H 6350 3850 30  0000 C CNN
F 4 "11-60R4" H 0   0   50  0001 C CNN "HPN"
	1    6350 3850
	1    0    0    -1  
$EndComp
$Comp
L R R25
U 1 1 56F60DDC
P 6550 3850
AR Path="/56F507DC/56F600A4/56F60DDC" Ref="R25"  Part="1" 
AR Path="/56F507DC/56F5B634/56F60DDC" Ref="R28"  Part="1" 
AR Path="/58175C82/56F60DDC" Ref="R28"  Part="1" 
F 0 "R28" V 6630 3850 50  0000 C CNN
F 1 "60R" V 6550 3850 50  0000 C CNN
F 2 "tera_rlc:R_0603in" V 6480 3850 30  0001 C CNN
F 3 "" H 6550 3850 30  0000 C CNN
F 4 "11-60R4" H 0   0   50  0001 C CNN "HPN"
	1    6550 3850
	1    0    0    -1  
$EndComp
$Comp
L C C15
U 1 1 56F60DDD
P 6450 4150
AR Path="/56F507DC/56F600A4/56F60DDD" Ref="C15"  Part="1" 
AR Path="/56F507DC/56F5B634/56F60DDD" Ref="C16"  Part="1" 
AR Path="/58175C82/56F60DDD" Ref="C16"  Part="1" 
F 0 "C16" H 6475 4250 50  0000 L CNN
F 1 "47nF" H 6475 4050 50  0000 L CNN
F 2 "tera_rlc:C_0603in" H 6750 4000 30  0001 C CNN
F 3 "" H 6450 4150 60  0000 C CNN
F 4 "52-47n0" H 0   0   50  0001 C CNN "HPN"
	1    6450 4150
	1    0    0    -1  
$EndComp
$Comp
L CM_CHOKE L1
U 1 1 56F60DE1
P 5450 2750
AR Path="/56F507DC/56F600A4/56F60DE1" Ref="L1"  Part="1" 
AR Path="/56F507DC/56F5B634/56F60DE1" Ref="L2"  Part="1" 
AR Path="/58175C82/56F60DE1" Ref="L2"  Part="1" 
F 0 "L2" H 5450 2550 50  0000 C CNN
F 1 "CM_CHOKE" H 5450 2950 50  0000 C CNN
F 2 "tera_rlc:L_ACT45B-XXX-2P_common-mode-choke" H 5450 2750 60  0001 C CNN
F 3 "" H 5450 2750 60  0000 C CNN
F 4 "97-1001" H 0   0   50  0001 C CNN "HPN"
	1    5450 2750
	-1   0    0    1   
$EndComp
$Comp
L CAN_CON_2pol P17
U 1 1 581338CD
P 8750 2700
F 0 "P17" H 8743 2527 50  0000 C CNN
F 1 "CAN_CON_2pol" H 8800 2850 50  0001 C CNN
F 2 "tera_Connectors_JST:JST_PH_S2B-PH-K_02x2.00mm_Angled" V 8900 2850 60  0001 C CNN
F 3 "" V 8900 2850 60  0000 C CNN
F 4 "02-2002" H 0   0   50  0001 C CNN "HPN"
	1    8750 2700
	1    0    0    1   
$EndComp
$Comp
L SWITCH_DPDT S1
U 1 1 5816ED00
P 6500 3150
F 0 "S1" V 6462 3378 39  0000 L CNN
F 1 "SWITCH_DPDT" H 6400 2900 39  0000 L CNN
F 2 "tera_switches:CuK_JS202011CQN_DPDT" V 6575 3378 39  0001 L CNN
F 3 "" H 6500 3150 39  0000 C CNN
F 4 "95-0003" H 0   0   50  0001 C CNN "HPN"
	1    6500 3150
	0    1    1    0   
$EndComp
Text HLabel 4000 2650 0    60   BiDi ~ 0
CAN2+
Text HLabel 4000 2750 0    60   BiDi ~ 0
CAN2-
Text Label 4100 2650 0    39   ~ 0
CAN+
Text Label 4100 2750 0    39   ~ 0
CAN-
Text Label 5950 2650 0    39   ~ 0
CANperi+
Text Label 5950 2850 0    39   ~ 0
CANperi-
Text Notes 5000 1000 0    39   ~ 0
Place everything near the connector.\n(Exception CAN Tranceiver: this should be near STM)
Text Notes 7800 2450 0    39   ~ 0
keep this wires short
Text HLabel 2200 4500 0    60   Input ~ 0
GND
Wire Wire Line
	5850 2850 8100 2850
Wire Wire Line
	5850 2650 8550 2650
Wire Wire Line
	6350 4000 6550 4000
Wire Wire Line
	7300 4500 7300 3350
Wire Wire Line
	6450 4500 6450 4300
Wire Wire Line
	5050 2650 5050 2250
Wire Wire Line
	5050 2250 5350 2250
Wire Wire Line
	5550 2250 5850 2250
Wire Wire Line
	5850 2250 5850 2650
Wire Wire Line
	5050 2850 5050 3250
Wire Wire Line
	5050 3250 5350 3250
Wire Wire Line
	5550 3250 5850 3250
Wire Wire Line
	5850 3250 5850 2850
Wire Wire Line
	4250 2850 5050 2850
Wire Wire Line
	4000 2650 5050 2650
Wire Wire Line
	4650 4500 4650 3400
Wire Wire Line
	4000 2750 4250 2750
Wire Wire Line
	4250 2750 4250 2850
Wire Wire Line
	7150 2900 7150 2850
Wire Wire Line
	7450 2900 7450 2650
Wire Wire Line
	8100 2850 8100 2750
Wire Wire Line
	8100 2750 8550 2750
Wire Notes Line
	8250 2500 8250 2750
Wire Notes Line
	7950 2500 8250 2500
Wire Notes Line
	8150 2650 8150 2500
Wire Wire Line
	6550 3350 6550 3700
Wire Wire Line
	6350 3350 6350 3700
Wire Wire Line
	2200 4500 7300 4500
Wire Wire Line
	6350 2950 6350 2650
Wire Wire Line
	6550 2950 6550 2850
Wire Wire Line
	4500 2950 4500 2850
Wire Wire Line
	4800 2950 4800 2650
Connection ~ 6450 4000
Connection ~ 7150 2850
Connection ~ 7450 2650
Connection ~ 4650 4500
Connection ~ 6450 4500
Connection ~ 4500 2850
Connection ~ 4800 2650
Connection ~ 6350 2650
Connection ~ 6550 2850
NoConn ~ 6450 3350
NoConn ~ 6650 3350
Text HLabel 4050 5000 0    60   BiDi ~ 0
CAN1+
Text HLabel 4050 5100 0    60   BiDi ~ 0
CAN1-
$Comp
L CAN_CON_2pol P8
U 1 1 59335539
P 4250 5050
F 0 "P8" H 4243 4877 50  0000 C CNN
F 1 "CAN_CON_2pol" H 4300 5200 50  0001 C CNN
F 2 "tera_Connectors_JST:JST_PH_S2B-PH-K_02x2.00mm_Angled" V 4400 5200 60  0001 C CNN
F 3 "" V 4400 5200 60  0000 C CNN
F 4 "02-2002" H -4500 2350 50  0001 C CNN "HPN"
	1    4250 5050
	1    0    0    1   
$EndComp
$EndSCHEMATC
