#!/bin/bash

# TODO:
# install german spell check

# add repository if necessary
RELEASE=$(lsb_release -rs | tr -d ".")
if [ ${RELEASE} -le 1104 ]; then
  sudo add-apt-repository -y ppa:mozillateam/thunderbird-stable
  sudo apt-get update -qq
fi

# install thunderbird
sudo apt-get install -y thunderbird

# install language packs
sudo apt-get install -y thunderbird-locale-de thunderbird-locale-en hunspell-de-de hunspell-en-us

# do we need this?
#sudo apt-get install -y thunderbird-gnome-support

# install lightning
sudo apt-get install -y xul-ext-lightning

# set thunderbird as default email client
sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t string -s /desktop/gnome/url-handlers/mailto/command 'thunderbird "%s"'
