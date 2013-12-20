#!/bin/bash

sudo gsettings set org.gnome.desktop.screensaver lock-enabled false
sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t boolean -s /apps/gnome-screensaver/idle_activation_enabled false
sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t boolean -s /apps/gnome-power-manager/lock_on_blank_screen false
sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t boolean -s /apps/gnome-power-manager/lock_use_screensaver_settings false
#sudo gsettings set org.gnome.desktop.lockdown disable-lock-screen 'true'
#sudo gsettings set org.gnome.power-manager lock-use-screensaver 'false'
