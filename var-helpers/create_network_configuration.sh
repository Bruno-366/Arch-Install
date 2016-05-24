#!/bin/bash
# Usage: bash <filename>

function prepare_network_configuration {

         WPA_config_file='/etc/wpa_supplicant/wpa_supplicant.conf'

         echo 'ctrl_interface=/var/run/wpa_supplicant' > "${WPA_config_file}"

         killall wpa_supplicant  # prevent already running errors

         wpa_supplicant -B -i "${Network_interface}" -c  "${WPA_config_file}"
}

function choose_wifi {

         wpa_cli scan
         echo "Scanning..."; sleep 3s
         echo "Choose a WiFi:"

         wpa_cli scan_results
         read WiFi_name
}

function create_network_configuration {

         echo "The following file should ONLY contain ${WiFi_name}'s password"
         echo "Press any key to continue..."
         read
         nano WiFi_password.txt
         
         (wpa_passphrase "${WiFi_name}" < WiFi_password.txt) >> "${WPA_config_file}"
}

prepare_network_configuration
choose_wifi
create_network_configuration
