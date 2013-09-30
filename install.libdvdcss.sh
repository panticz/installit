#!/bin/bash

# add repository
echo "deb http://download.videolan.org/pub/debian/stable/ /" | sudo tee /etc/apt/sources.list.d/libdvdcss.list

# get keyring
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -

# update repository
sudo apt-get update -qq

# install libdvdcss
sudo apt-get install -y libdvdcss2
