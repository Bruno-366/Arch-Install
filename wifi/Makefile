#Settings: net_if.txt wifi_name.txt wpa_supplicant.conf

# 
#	commands                output                       dependencies
# 

Settings/net_if.txt:
	./net_if.sh             Settings/net_if.txt

# Please see Note 0
Settings/wifi_name.txt:         Settings/net_if.txt
	./wifi_conf_init.sh     Settings/wpa_supplicant.conf
	./wifi_core.sh          Settings/wpa_supplicant.conf Settings/net_if.txt
	./wifi_name.sh          Settings/wifi_name.txt

Settings/wpa_supplicant.conf:   Settings/wifi_name.txt
	./wifi_conf_finalize.sh Settings/wpa_supplicant.conf Settings/wifi_name.txt
	
connect:                        Settings/wpa_supplicant.conf Settings/net_if.txt
	./wifi_core.sh          Settings/wpa_supplicant.conf Settings/net_if.txt
	./net_ip.sh             Settings/net_if.txt


# Note 0:
# Do not call this target directly as
# wifi_conf_init.sh generates wpa_supplicant.conf
# and therefore target wpa_supplicant.conf won't run.
