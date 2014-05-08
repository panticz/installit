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

# WORKAROUND: disable apt proxy
sudo sed -i 's|Acquire::http::Proxy|#DISABLED#Acquire::http::Proxy|g' /etc/apt/apt.conf

# install
sudo apt-get -o Acquire::http:Proxy=DIRECT install -y oracle-java8-installer

# set Java environment variables
sudo apt-get install -y oracle-java8-set-default

# WORKAROUND: enable apt proxy
sudo sed -i 's|#DISABLED#Acquire::http::Proxy|Acquire::http::Proxy|g' /etc/apt/apt.conf

# set java 7 as default java version
sudo update-java-alternatives -s java-8-oracle
