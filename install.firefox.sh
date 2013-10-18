#!/bin/bash

# add repository if necessary
RELEASE=$(lsb_release -rs | tr -d ".")
if [ ${RELEASE} -le 1104 ]; then
  sudo add-apt-repository -y ppa:mozillateam/firefox-stable
  sudo apt-get update -qq
fi

# install firefox
sudo apt-get install -y firefox

# install language packs
sudo apt-get install -y firefox-locale-de firefox-locale-en
