#!/bin/bash

# install
sudo apt-get install -y thinkfan

# configure kernel module
echo "options thinkpad_acpi fan_control=1" > /etc/modprobe.d/thinkpad_acpi.conf

# reload kernel module
sudo modprobe -r thinkpad_acpi && sudo modprobe thinkpad_acpi

sudo sed -i 's|START=no|START=yes|' /etc/default/thinkfan
sudo sed -i 's|DAEMON_ARGS="-q"|DAEMON_ARGS="-q -b 1 -s 15"|' /etc/default/thinkfan

cat <<EOF> /etc/thinkfan.conf
hwmon /sys/devices/virtual/hwmon/hwmon0/temp1_input
(0,	0,	65)
(1,	65,	70)
(2,	70,	75)
(3,	75,	80)
(4,	80,	85)
(5,	85,	90)
(7,	90,	32767)
EOF
