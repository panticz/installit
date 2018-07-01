#!/bin/bash

URL=http://download.teamviewer.com/download/linux/teamviewer_amd64.deb

# install required applications
sudo apt-get install -y wget libqt5qml5 libqt5quick5 libqt5webkit5

# download teamviewer
wget -q ${URL} -O /tmp/teamviewer.deb

# fix broken dependencies
sudo apt install -y -f

# install teamviewer
sudo apt install -y /tmp/teamviewer.deb

# clean up
rm /tmp/teamviewer.deb
