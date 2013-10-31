#!/bin/bash

# enable multiverse repository
cat <<EOF> /etc/apt/sources.list.d/extra-repository.list
deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs) universe
deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs) multiverse
EOF
apt-get update -qq

# install printer driver
apt-get install -y brother-cups-wrapper-laser

# remove multiverse repository
rm /etc/apt/sources.list.d/extra-repository.list
apt-get update -qq

# create printer
lpadmin -p Brother-MFC-7320 -E -v usb://Brother/MFC-7320 -P /usr/share/ppd/Brother/MFC7220.ppd -o PageSize=A4

# FIXME: set resolution to 1200
# -o Resolution=1200x600dp
