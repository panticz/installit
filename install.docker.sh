#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install required packages
apt-get install -y apt-transport-https ca-certificates software-properties-common

# install Docker repository key
wget https://yum.dockerproject.org/gpg -qO- | apt-key add -

# add Docker repository
add-apt-repository deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"

# disable APT proxy for Docker repository
echo 'Acquire::HTTP::Proxy::apt.dockerproject.org "DIRECT";' > /etc/apt/apt.conf.d/99_dockerproject

# update package list
apt-get update

# install Docker
apt-get -y install docker-engine
