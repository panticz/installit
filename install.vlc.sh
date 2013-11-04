#!/bin/bash

sudo apt-get install -y vlc
sudo apt-get install -y vlc-plugin-pulse
sudo apt-get install -y mozilla-plugin-vlc

# set vnc as default media player
sudo sed -i 's|totem.desktop|vlc.desktop|g' /etc/gnome/defaults.list
