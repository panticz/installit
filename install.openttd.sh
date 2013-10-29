#!/bin/bash

if [ "$1" == "-n" ]; then
  # install latest version from homepage
  wget http://binaries.openttd.org/releases/1.3.2/openttd-1.3.2-linux-ubuntu-precise-amd64.deb -P /tmp
  sudo dpkg -i /tmp/openttd-1.3.2-linux-ubuntu-precise-amd64.deb
else
  # installed version provided by the distribution
  sudo apt-get install -y openttd
fi
 
# install music
sudo apt-get install -y openttd-opensfx openttd-openmsx timidity
