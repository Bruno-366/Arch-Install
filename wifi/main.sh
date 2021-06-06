#!/bin/bash

#_PATH=$(dirname $0) # if called from somewhere else

shopt -o expand_aliases
#                                                   script  setting              required_info
alias choose_network_interface='bash             net_if.sh  net_if.txt                              '
alias              choose_wifi='bash          wifi_name.sh  wifi_name.txt                           '
alias        configure_network='bash wifi_conf_finalize.sh  wpa_supplicant.conf  $(< wifi_name.txt) '
alias               wpa_config='bash     wifi_conf_init.sh  wpa_supplicant.conf                     '
alias                wifi_core='bash          wifi_core.sh                       $(< net_if.txt)    '
alias           get_ip_address='bash             net_ip.sh                       $(< net_if.txt)    '

absent() (
         # test if file is empty, or if file doesn't exist
         test -z "$(< $1 )" || ! test -f "$1" 
	 # returns true if file is absent
         echo $?
)

function manager {

         test $? -eq 0 || exit

	 # if any of the following files is absent,
	 # act accordingly, to give said setting a value
	 # (Essentially a Finite-State Machine)
         case 0 in

         $( absent 'net_if.txt' ))  choose_network_interface
         manager ;;

         $( absent 'wifi_name.txt' )) (wpa_config && wifi_core) && choose_wifi
         manager ;; 

         $( absent 'wpa_supplicant.conf' )) wpa_config && configure_network && \
	 wpa_cli reconfigure && get_ip_address ;;

         0) wifi_core && get_ip_address ;;
         esac

}

manager
