#!/bin/bash

if [ "$1" == "-n" ]; then
  # install latest version from homepage
  wget http://binaries.openttd.org/releases/1.4.0/openttd-1.4.0-linux-ubuntu-trusty-amd64.deb -P /tmp
  sudo dpkg -i /tmp/openttd-*-linux-ubuntu-*.deb
else
  # installed version provided by the distribution
  sudo apt-get install -y openttd
fi
 
# install music
sudo apt-get install -y openttd-opensfx openttd-openmsx timidity
