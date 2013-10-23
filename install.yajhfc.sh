#!/bin/bash

# add repository
sudo apt-add-repository "deb http://download.yajhfc.de/repository/apt/ stable/"
 
# add repository key
wget -q http://download.yajhfc.de/JonasWolz.pub -O - | sudo apt-key add -
 
# update repository list
sudo apt-get update -qq
 
# install yajhfc
sudo apt-get install -y yajhfc yajhfc-faxprinter

# install apps
sudo apt-get install -y libtiff-tools gs

# fix installation
sudo apt-get install -f

# disable autostart
sudo mv /etc/xdg/autostart/yajhfc-autostart.desktop /etc/xdg/autostart/yajhfc-autostart.desktop.disabled

# rename menu entry
sudo sed -i 's|YajHFC|FAX Client|g' /usr/share/applications/yajhfc.desktop

# TODO: rename YajHFC printer to FAX
