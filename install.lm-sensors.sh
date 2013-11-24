#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install lm-sensors
apt-get install -y lm-sensors

# install the latest version
if [ "$1" == "-n" ]; then
  wget http://mirrors.kernel.org/ubuntu/pool/universe/l/lm-sensors/lm-sensors_3.3.3-1ubuntu1_amd64.deb -P /tmp/
  dpkg -i /tmp/lm-sensors_*.deb
  rm /tmp/lm-sensors_*.deb
fi

# auto configure
yes | /usr/sbin/sensors-detect
