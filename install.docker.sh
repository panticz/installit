#!/bin/bash

# install required packages
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# install Docker repository key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# install Docker
sudo apt-get install -y docker-ce
