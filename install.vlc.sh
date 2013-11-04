#!/bin/bash

if [ "$1" == "-n" ]; then
  sudo add-apt-repository -y ppa:videolan/stable-daily
  sudo apt-get update
fi

sudo apt-get install -y vlc
sudo apt-get install -y vlc-plugin-pulse
sudo apt-get install -y browser-plugin-vlc

# set vnc as default media player
sudo sed -i 's|totem.desktop|vlc.desktop|g' /etc/gnome/defaults.list
