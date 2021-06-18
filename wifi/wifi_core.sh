#!/bin/bash

killall wpa_supplicant
wpa_supplicant -B  -c "${1}" -i "$(< ${2})" 
