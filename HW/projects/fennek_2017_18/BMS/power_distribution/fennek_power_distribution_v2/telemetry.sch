EESchema Schematic File Version 4
LIBS:fennek_power_distribution-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x02 P13
U 1 1 592C6B30
P 6000 2750
F 0 "P13" H 6077 2791 50  0000 L CNN
F 1 "SEM_telemetry_supply" H 5950 2900 40  0000 L CNN
F 2 "tera_Connectors_JST:JST_XH_S02B-XH-A_02x2.50mm_Angled" H 6077 2654 50  0001 L CNN
F 3 "" H 6000 2750 50  0000 C CNN
F 4 "05-1252" H 6000 2750 60  0001 C CNN "HPN"
	1    6000 2750
	1    0    0    1   
$EndComp
$Comp
L Device:D_Zener_Small D12
U 1 1 592C6B38
P 5550 2700
F 0 "D12" V 5504 2769 50  0000 L CNN
F 1 "14V" V 5595 2769 50  0000 L CNN
F 2 "tera_diodes:SOD128_with_vias_in_pad" H 5550 2700 50  0001 C CNN
F 3 "" H 5550 2700 50  0000 C CNN
F 4 "21-9008" V 5550 2700 60  0001 C CNN "HPN"
	1    5550 2700
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse_Small F7
U 1 1 592C6B40
P 4650 2500
F 0 "F7" H 4650 2685 50  0000 C CNN
F 1 "1A 12VDC" H 4650 2594 50  0000 C CNN
F 2 "tera_general:Fuse_0805_2012Metric_Pad1.15x1.50mm_HandSolder" H 4650 2500 50  0001 C CNN
F 3 "" H 4650 2500 50  0000 C CNN
F 4 "94-1000" H 4650 2500 60  0001 C CNN "HPN"
	1    4650 2500
	1    0    0    -1  
$EndComp
$Comp
L tera_general:JUMPER3_NO JP1
U 1 1 592C6B55
P 2950 2300
F 0 "JP1" H 2950 2501 50  0000 C CNN
F 1 "SEM_source" H 2950 2410 50  0000 C CNN
F 2 "tera_general:SOLDERJUMPER_3" H 2950 2410 50  0001 C CNN
F 3 "" H 2950 2300 50  0000 C CNN
	1    2950 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2500 5550 2500
Wire Wire Line
	5800 2500 5800 2650
Wire Wire Line
	5550 2500 5550 2600
Connection ~ 5550 2500
Wire Wire Line
	4500 2900 5550 2900
Wire Wire Line
	5800 2900 5800 2750
Wire Wire Line
	5550 2800 5550 2900
Connection ~ 5550 2900
Wire Wire Line
	3400 2900 3500 2900
Wire Wire Line
	3500 2800 3400 2800
Wire Wire Line
	3500 2600 3400 2600
Wire Wire Line
	3400 2600 3400 2500
Wire Wire Line
	2900 2500 2950 2500
Connection ~ 3400 2500
Wire Wire Line
	3300 2250 3300 2300
Wire Wire Line
	3300 2300 3250 2300
Wire Wire Line
	2600 2250 2600 2300
Wire Wire Line
	2600 2300 2650 2300
Wire Wire Line
	2950 2400 2950 2500
$Comp
L power:PWR_FLAG #FLG06
U 1 1 592C6B71
P 2900 2500
F 0 "#FLG06" H 2900 2595 50  0001 C CNN
F 1 "PWR_FLAG" H 2900 2600 15  0000 C CNN
F 2 "" H 2900 2500 50  0000 C CNN
F 3 "" H 2900 2500 50  0000 C CNN
	1    2900 2500
	0    -1   -1   0   
$EndComp
Connection ~ 2950 2500
Text Label 5000 2900 0    40   ~ 0
GND_telemetry
Text Label 5000 2500 0    40   ~ 0
+12V_telemetry
$Comp
L Supply:THD_12-xxxx_single_output U2
U 1 1 592C6B7B
P 4000 2700
F 0 "U2" H 4000 3000 60  0000 C CNN
F 1 "THD_12-4812_single_output" H 4100 2400 60  0000 C CNN
F 2 "traco_power:THD_12-xxxx" H 4000 3150 60  0001 C CNN
F 3 "" H 4000 2700 60  0000 C CNN
F 4 "90-1021" H 4000 2700 60  0001 C CNN "HPN"
	1    4000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2500 4500 2500
Text HLabel 3300 2250 1    50   Input ~ 0
+Vbatt
Text HLabel 2600 2250 1    50   Input ~ 0
Vbatt_Switched
Wire Wire Line
	3400 2800 3400 2900
Connection ~ 3400 2900
Wire Wire Line
	3400 4100 3300 4100
Text HLabel 3300 4100 0    50   Input ~ 0
-Vbatt
NoConn ~ 3500 2700
Wire Wire Line
	5550 2500 5800 2500
Wire Wire Line
	5550 2900 5800 2900
Wire Wire Line
	3400 2500 3500 2500
Wire Wire Line
	2950 2500 3400 2500
Wire Wire Line
	3400 2900 3400 4100
$EndSCHEMATC
