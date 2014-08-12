#!/bin/bash

# add repository
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo dpkg --add-architecture i386
sudo apt-get update -qq

# install wine
if [ "$1" == "-n" ]; then
  # development release
  sudo apt-get install -y wine1.7
else
  # stable release
  sudo apt-get install -y wine1.6
fi
