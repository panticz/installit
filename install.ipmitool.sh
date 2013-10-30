#!/bin/bash

apt-get install -y ipmitool

cat <<EOF>> /etc/modules
ipmi_devintf
ipmi_msghandler
ipmi_poweroff
ipmi_si
ipmi_watchdog
EOF
