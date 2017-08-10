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
Sheet 2 16
Title ""
Date ""
Rev ""
Comp "TERA TU Graz"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3250 2100 550  500 
U 571E6146
F0 "LEM1" 39
F1 "LEM.sch" 39
F2 "+5V" I L 3250 2200 60 
F3 "GND" I L 3250 2500 60 
F4 "Signal" O R 3800 2350 60 
$EndSheet
$Sheet
S 3250 2850 550  500 
U 571E9DC1
F0 "LEM2" 39
F1 "LEM.sch" 39
F2 "+5V" I L 3250 2950 60 
F3 "GND" I L 3250 3250 60 
F4 "Signal" O R 3800 3100 60 
$EndSheet
$Sheet
S 3250 3600 550  500 
U 571E9F88
F0 "LEM3" 39
F1 "LEM.sch" 39
F2 "+5V" I L 3250 3700 60 
F3 "GND" I L 3250 4000 60 
F4 "Signal" O R 3800 3850 60 
$EndSheet
Text HLabel 2950 2200 0    39   Input ~ 0
+5V
Text HLabel 2900 2500 0    39   Input ~ 0
GND
Text HLabel 3800 2350 2    39   Output ~ 0
LEM1_Signal
Text HLabel 3800 3100 2    39   Output ~ 0
LEM2_Signal
Text HLabel 3800 3850 2    39   Output ~ 0
LEM3_Signal
Wire Wire Line
	2950 2200 3250 2200
Wire Wire Line
	3050 2200 3050 3700
Wire Wire Line
	3050 2950 3250 2950
Connection ~ 3050 2200
Wire Wire Line
	3050 3700 3250 3700
Connection ~ 3050 2950
Wire Wire Line
	2900 2500 3250 2500
Wire Wire Line
	3150 2500 3150 4000
Wire Wire Line
	3150 3250 3250 3250
Connection ~ 3150 2500
Wire Wire Line
	3150 4000 3250 4000
Connection ~ 3150 3250
$EndSCHEMATC
