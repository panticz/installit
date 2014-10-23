#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install lxc
apt-get install -y lxc

# disable auto configuration for eth0
sed -i 's|auto eth0|#auto eth0|g' /etc/network/interfaces
sed -i 's|iface eth0 inet dhcp|#iface eth0 inet dhcp|g' /etc/network/interfaces

# create network bridge
cat <<EOF>> /etc/network/interfaces
auto lxcbr0
iface lxcbr0 inet dhcp
  bridge_ports eth0
EOF

# disable auto configuration for network bridge by lxc
sed -i 's|USE_LXC_BRIDGE="true"|USE_LXC_BRIDGE="false"|g' /etc/default/lxc-net

# disable network managed by NetworkManager when installed
[ -f /etc/NetworkManager/NetworkManager.conf ] && sed -i 's|managed=true|managed=false|g' /etc/NetworkManager/NetworkManager.conf

# allow all user to list the containers
echo "ALL ALL=NOPASSWD: /usr/bin/lxc-ls" >> /etc/sudoers.d/lxc
