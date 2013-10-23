#!/bin/bash

# add repository
apt-add-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -cs) main"

# update repository
sudo apt-get update -qq
 
# install Dropbox
sudo apt-get install nautilus-dropbox -y --force-yes

# install libs
sudo apt-get install -y python-gpgme

# dowload client
#wget http://www.getdropbox.com/download?plat=lnx.x86 -P /tmp
#su $1 -c tar xzf /tmp/dropbox-lnx.x86-*.tar.gz -C ~/
