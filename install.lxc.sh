#!/bin/bash

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
