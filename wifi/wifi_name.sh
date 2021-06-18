#!/bin/bash

wpa_cli scan
echo "Scanning..."; sleep 3s

wpa_cli scan_results

echo "Choose a WiFi: "
read  REPLY
echo $REPLY > "${1}"
