#!/bin/bash

killall dhcpcd
dhcpcd -4 "${1}"
