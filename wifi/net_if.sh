#!/bin/bash

exists() (
	test -x "${1}" ; echo $?
)

# Sorted by likelyhood:

case 0 in 
$(exists /bin/iwconfig)) iwconfig ;;
$(exists /bin/iwconfig)) ;;
$(exists /bin/iwconfig)) ;;
esac

echo "Choose a network interface: "
read  REPLY
echo $REPLY > "${1}"
