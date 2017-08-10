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
LIBS:BMS_Master_V6_kicad-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 14
Title "BMS Master"
Date "2017-01-06"
Rev "6"
Comp "TERA TU Graz"
Comment1 "Rene Pöschl"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3150 2700 750  1150
U 56F58707
F0 "SuperChargerRelais" 60
F1 "2xRelaisWithRM.sch" 60
F2 "NCS" I L 3150 3200 60 
F3 "SCLK" I L 3150 3300 60 
F4 "MOSI" I L 3150 3400 60 
F5 "MISO" O L 3150 3500 60 
F6 "Fault" O R 3900 3400 60 
F7 "k_on" O R 3900 3500 60 
F8 "GND" I L 3150 3800 60 
F9 "relay_on" I L 3150 3650 60 
F10 "+12V_PWR" I L 3150 2750 60 
F11 "+3V3" I L 3150 3050 60 
F12 "+5V" I L 3150 2950 60 
$EndSheet
$Sheet
S 3150 1300 750  1150
U 56F7A222
F0 "MainRelais" 60
F1 "2xRelaisWithRM.sch" 60
F2 "NCS" I L 3150 1800 60 
F3 "SCLK" I L 3150 1900 60 
F4 "MOSI" I L 3150 2000 60 
F5 "MISO" O L 3150 2100 60 
F6 "Fault" O R 3900 2000 60 
F7 "k_on" O R 3900 2100 60 
F8 "GND" I L 3150 2400 60 
F9 "relay_on" I L 3150 2250 60 
F10 "+12V_PWR" I L 3150 1350 60 
F11 "+3V3" I L 3150 1650 60 
F12 "+5V" I L 3150 1550 60 
$EndSheet
$Sheet
S 3150 4200 750  1150
U 56F859E1
F0 "PRECHARGER" 60
F1 "2xLowSideSwitch8A.sch" 60
F2 "NCS" I L 3150 4600 60 
F3 "SCLK" I L 3150 4700 60 
F4 "MOSI" I L 3150 4800 60 
F5 "MISO" O L 3150 4900 60 
F6 "Fault" O R 3900 4900 60 
F7 "GND" I L 3150 5200 60 
F8 "relay_on" I L 3150 5100 60 
F9 "+12V_PWR" I L 3150 4300 60 
F10 "+5V" I L 3150 4400 60 
$EndSheet
$Sheet
S 3150 5600 750  1150
U 56F899AD
F0 "FANS" 60
F1 "2xLowSideSwitch8A.sch" 60
F2 "NCS" I L 3150 6000 60 
F3 "SCLK" I L 3150 6100 60 
F4 "MOSI" I L 3150 6200 60 
F5 "MISO" O L 3150 6300 60 
F6 "Fault" O R 3900 6300 60 
F7 "GND" I L 3150 6600 60 
F8 "relay_on" I L 3150 6500 60 
F9 "+12V_PWR" I L 3150 5700 60 
F10 "+5V" I L 3150 5800 60 
$EndSheet
Text HLabel 2350 3200 0    60   Input ~ 0
NCS_CHARGE
Text HLabel 2300 1800 0    60   Input ~ 0
NCS_MAIN
Text HLabel 2300 1900 0    60   Input ~ 0
SCLK
Text HLabel 2300 2100 0    60   Output ~ 0
MISO
Text HLabel 2300 2000 0    60   Input ~ 0
MOSI
Text HLabel 3150 6500 0    60   Input ~ 0
FAN_PWM
Text HLabel 3150 2750 0    60   Input ~ 0
+12V_PWR
Text HLabel 3150 2950 0    60   Input ~ 0
+5V
Text HLabel 3150 3050 0    60   Input ~ 0
+3V3
Text HLabel 3150 2400 0    60   Input ~ 0
GND
Text HLabel 3150 3800 0    60   Input ~ 0
GND
Text HLabel 3150 1350 0    60   Input ~ 0
+12V_PWR
Text HLabel 3150 1550 0    60   Input ~ 0
+5V
Text HLabel 3150 1650 0    60   Input ~ 0
+3V3
Text HLabel 2350 4600 0    60   Input ~ 0
NCS_PRECHARGE
Text HLabel 2350 6000 0    60   Input ~ 0
NCS_FAN
Text HLabel 3150 5200 0    60   Input ~ 0
GND
Text HLabel 3150 4300 0    60   Input ~ 0
+12V_PWR
Text HLabel 3150 4400 0    60   Input ~ 0
+5V
Text HLabel 3150 6600 0    60   Input ~ 0
GND
Text HLabel 3150 5700 0    60   Input ~ 0
+12V_PWR
Text HLabel 3150 5800 0    60   Input ~ 0
+5V
Text HLabel 3900 2000 2    60   Output ~ 0
FaultMain
Text HLabel 3900 3400 2    60   Output ~ 0
FaultCharger
Text HLabel 3900 4900 2    60   Output ~ 0
FaultPrecharger
Text HLabel 3900 6300 2    60   Output ~ 0
FaultFan
Text HLabel 3900 2100 2    60   Output ~ 0
MainOn
Text HLabel 3900 3500 2    60   Output ~ 0
ChargerOn
Text HLabel 2300 2250 0    60   Input ~ 0
Interlock_OK
Text HLabel 2350 3650 0    60   Input ~ 0
Interlock_OK
Text HLabel 2350 5100 0    60   Input ~ 0
Interlock_OK
Wire Wire Line
	2300 2100 3150 2100
Wire Wire Line
	2450 2100 2450 6300
Wire Wire Line
	2450 3500 3150 3500
Wire Wire Line
	2300 2000 3150 2000
Wire Wire Line
	2500 2000 2500 6200
Wire Wire Line
	2500 3400 3150 3400
Wire Wire Line
	2300 1900 3150 1900
Wire Wire Line
	2550 1900 2550 6100
Wire Wire Line
	2550 3300 3150 3300
Wire Wire Line
	3150 3200 2350 3200
Wire Wire Line
	3150 1800 2300 1800
Wire Wire Line
	2450 4900 3150 4900
Wire Wire Line
	2500 4800 3150 4800
Wire Wire Line
	2550 4700 3150 4700
Wire Wire Line
	3150 4600 2350 4600
Wire Wire Line
	2450 6300 3150 6300
Wire Wire Line
	2500 6200 3150 6200
Wire Wire Line
	2550 6100 3150 6100
Wire Wire Line
	3150 6000 2350 6000
Wire Wire Line
	2300 2250 3150 2250
Wire Wire Line
	2350 3650 3150 3650
Wire Wire Line
	2350 5100 3150 5100
Connection ~ 2550 1900
Connection ~ 2500 2000
Connection ~ 2450 2100
Connection ~ 2550 3300
Connection ~ 2550 4700
Connection ~ 2500 3400
Connection ~ 2450 3500
Connection ~ 2500 4800
Connection ~ 2450 4900
$EndSCHEMATC
