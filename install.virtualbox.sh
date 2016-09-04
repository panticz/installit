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

# install repository key
wget -q -O - http://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -

# update repository list
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update -qq

# install
sudo apt-get install -y virtualbox-5.0 --allow-unauthenticated

# install extension pack
VERSION=$(dpkg-query -W -f='${Version}' "virtualbox*" | cut -d "-" -f1)
wget http://download.virtualbox.org/virtualbox/${VERSION}/Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack -P /tmp/
sudo VBoxManage extpack install /tmp/Oracle_VM_VirtualBox_Extension_Pack-${VERSION}.vbox-extpack

# add current user to vboxusers group
sudo adduser ${USER} vboxusers
