#!/bin/bash

# create debconf answer file
debconf-set-selections <<\EOF
acroread acroread/default-viewer boolean false
EOF

# enable partner repository
sudo sed -i "s/# \(deb .* partner\)/\1/" /etc/apt/sources.list
sudo apt-get update -qq

# install acrobat reader
sudo apt-get install -y acroread

# set evince as default pdf viewer
sudo sed -i 's/application\/pdf.*$/application\/pdf=evince.desktop/g' /etc/gnome/defaults.list

# TODO
# disable Firefox PDF plugin
