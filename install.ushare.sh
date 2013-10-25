#!/bin/bash

# install
sudo apt-get install -y ushare
 
# change rc order
sudo update-rc.d -f ushare remove
sudo update-rc.d ushare defaults 99
 
# configure network
sudo echo "post-up route add -net 239.0.0.0 netmask 255.0.0.0 eth0" >> /etc/network/interfaces
 
# OPTIONAL: configure ushare
sudo sed -i '22s|USHARE_DIR=|USHARE_DIR=/media/mp3,/media/video,/media/images|g' /etc/ushare.conf
 
# restart services
sudo service ushare networking
sudo service ushare restart
