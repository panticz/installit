#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install debconf
apt-get install -y debconf-utils

# create answer file
debconf-set-selections <<\EOF
oracle-java8-installer shared/accepted-oracle-license-v1-1 select true
EOF

# ensure that add-apt-repository is installed
apt-get install -y software-properties-common

# add repository
add-apt-repository -y ppa:webupd8team/java

# update repository
apt-get update -qq

#  bypass the apt-cacher-ng proxy
echo 'Acquire::HTTP::Proxy::download.oracle.com "DIRECT";' > /etc/apt/apt.conf.d/99_oracle

# install
apt-get install -y oracle-java8-installer

# set Java environment variables
apt-get install -y oracle-java8-set-default

# set java 8 as default java version
update-java-alternatives -s java-8-oracle

# move java desktop symbols
[ -f /usr/share/applications/JB-mission-control-jdk8.desktop ] && sed -i 's|Categories=Development;Java;|Categories=Application;Network;|g' /usr/share/applications/JB-mission-control-jdk8.desktop
