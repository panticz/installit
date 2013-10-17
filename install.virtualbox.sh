#!/bin/sh

if [ ! -z $1 ]; then
    USER=$1
fi

# install debconf-utils
sudo apt-get install debconf-utils

# add debconf answer
sudo debconf-set-selections <<\EOF
virtualbox virtualbox/group-vboxusers note
EOF

# add key
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

# update repository list
cat << EOF | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib
EOF
sudo apt-get update -qq

# install
sudo apt-get install -y virtualbox-4.2

# add current user to vboxusers group
sudo adduser ${USER} vboxusers
