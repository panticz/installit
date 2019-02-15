#!/bin/bash

sudo apt-get install -y ipmitool

# enable modules for local ipmi access
cat <<EOF>> /etc/modules
ipmi_devintf
ipmi_msghandler
ipmi_poweroff
ipmi_si
ipmi_watchdog
EOF
