#!/bin/bash

main() (
	# Sorted by likelyhood:

	case 0 in 
	$(exists /bin/iwconfig)) iwconfig ;;
	$(exists /bin/iwconfig)) ;;
	$(exists /bin/iwconfig)) ;;
	esac
)

exists() (
	test -x "${1}" ; echo $?
)

main;

echo "Choose a network interface: "
read  REPLY
echo $REPLY > "${1}"
