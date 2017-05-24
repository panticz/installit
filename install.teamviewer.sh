#!/bin/bash

URL=http://download.teamviewer.com/download/teamviewer_i386.deb

# add required 32 bit architecture on a 64 bit system
sudo dpkg --add-architecture i386

# install required applications
sudo apt-get install -y wget

# download teamviewer
wget -q ${URL} -O /tmp/teamviewer.deb

# install teamviewer
sudo apt install -y /tmp/teamviewer.deb

# clean up
rm /tmp/teamviewer.deb
