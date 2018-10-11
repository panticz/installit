#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install required packages
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

# install Docker repository key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# OPTIONAL: disable APT proxy for Docker repository
# echo 'Acquire::HTTP::Proxy::apt.dockerproject.org "DIRECT";' > /etc/apt/apt.conf.d/99_dockerproject

# update package list
sudo apt-get update

# install Docker
sudo apt-get install docker-ce
