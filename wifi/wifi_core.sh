#!/bin/bash

killall wpa_supplicant
wpa_supplicant -B  -c "${WPA_config_file}" -i "${1}" 
