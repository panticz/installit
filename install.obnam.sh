#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install the latest version 
if [ "$1" == "-n" ]; then
  # add repository
  echo "deb http://code.liw.fi/debian wheezy main" > /etc/apt/sources.list.d/obnam.list
  wget -q http://code.liw.fi/apt.asc -O - | apt-key add -
  apt-get update
fi

# install obnam
apt-get install -y obnam
