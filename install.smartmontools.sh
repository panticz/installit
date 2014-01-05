#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
sudo $0
  exit
fi

apt-get install -y smartmontools --no-install-recommends
