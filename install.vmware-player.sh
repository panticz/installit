#!/bin/bash

URL=https://download3.vmware.com/software/player/file/VMware-Player-14.0.0-6661328.x86_64.bundle

# download
wget -q ${URL} -O /tmp/${URL##*/}

# install
sudo /tmp/${URL##*/} --console --required --eulas-agreed
