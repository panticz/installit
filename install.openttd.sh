#!/bin/bash

if [ "$1" == "-n" ]; then
  # install latest version from homepage
  if [ "$(uname -m)" == "x86_64" ]; then
    # 64 bit
    URL=http://binaries.openttd.org/releases/1.4.1/openttd-1.4.1-linux-ubuntu-trusty-amd64.deb
  else
    # 32 bit
    URL=http://binaries.openttd.org/releases/1.4.1/openttd-1.4.1-linux-ubuntu-trusty-i386.deb
  fi
  
  # download
  wget ${URL} -P /tmp
  
  # install
  sudo dpkg -i /tmp/openttd-*-linux-ubuntu-*.deb
else
  # installed version provided by the distribution
  sudo apt-get install -y openttd
fi
 
# install music
sudo apt-get install -y openttd-opensfx openttd-openmsx timidity
