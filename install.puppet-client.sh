#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install
apt-get install -qq -y puppet
 
# configure to autostart puppet on boot
sed -i 's|START=no|START=yes|g' /etc/default/puppet
