#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

apt-get install -y curl linux-image-extra-$(uname -r) linux-image-extra-virtual apt-transport-https ca-certificates software-properties-common

curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
add-apt-repository deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"
apt-get update

apt-get -y install docker-engine
