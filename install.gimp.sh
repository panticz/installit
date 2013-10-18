#!/bin/bash

# add repository
RELEASE=$(lsb_release -rs | tr -d ".")
if [ ${RELEASE} -ge 1204 ]; then
  sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
fi

# update
sudo apt-get update

# install gimp
sudo apt-get install -y gimp
