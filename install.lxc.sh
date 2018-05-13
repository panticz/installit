#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install lxc
apt-get install -y software-properties-common
add-apt-repository -y ppa:ubuntu-lxc/lxd-stable

# fix dist name
for FILE in $(find /etc/apt/sources.list.d/ -name "*lxc*.list"); do
  sed -i 's|jessie|trusty|g;s|utopic|trusty|g' ${FILE}
done

apt-get update
apt-get install -y lxc lxcfs python-lxc

if [ "$1" == "-b" ]; then
  # install required packages
  apt-get install -y bridge-utils

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
  [ -f /etc/default/lxc-net ] && sed -i 's|USE_LXC_BRIDGE="true"|USE_LXC_BRIDGE="false"|g' /etc/default/lxc-net
  
  # disable network managed by NetworkManager when installed
  [ -f /etc/NetworkManager/NetworkManager.conf ] && sed -i 's|managed=true|managed=false|g' /etc/NetworkManager/NetworkManager.conf
fi

# allow all user to list the containers
[ -d /etc/sudoers.d/ ] && echo "ALL ALL=NOPASSWD: /usr/bin/lxc-ls" >> /etc/sudoers.d/lxc
