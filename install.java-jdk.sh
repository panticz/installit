#!/bin/bash

# install debconf
sudo apt-get install -y debconf-utils

# create answer file
sudo debconf-set-selections <<\EOF
oracle-java6-installer shared/accepted-oracle-license-v1-1 select true
EOF

# add repository
sudo add-apt-repository -y ppa:webupd8team/java

# update repository
sudo apt-get update -qq

# install
sudo apt-get install -y oracle-java7-installer

# set java 7 as default java version
sudo update-java-alternatives -s java-7-oracle
