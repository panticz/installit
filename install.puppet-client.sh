#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install
apt-get install -qq -y puppet
 
# configure to autostart puppet on boot
if [ $(puppet --version | cut -d "." -f1) -ge 3 ]; then
  # puppet 3.x
  /etc/init.d/puppet stop
  puppet agent --enable
else
  # puppet 2.x
  [ -f /etc/default/puppet ] && sed -i 's|START=no|START=yes|g' /etc/default/puppet
fi
