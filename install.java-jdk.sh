#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install debconf
sudo apt-get install -y debconf-utils

# create answer file
sudo debconf-set-selections <<\EOF
oracle-java8-installer shared/accepted-oracle-license-v1-1 select true
EOF

# add repository
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java

# update repository
sudo apt-get update -qq

# install
export dl_direct=DIRECT
sudo -E apt-get install -y oracle-java8-installer
unset dl_direct

# set Java environment variables
sudo apt-get install -y oracle-java8-set-default

# set java 8 as default java version
sudo update-java-alternatives -s java-8-oracle
