#!/bin/bash
# for wifi in wifi_names do ;

echo "The following file should ONLY contain ${2}'s password" 
echo "Press any key to continue..."
read 
nano WiFi_password.txt
         
(wpa_passphrase "$(< ${2})" < WiFi_password.txt) >> "${1}"
