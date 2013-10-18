#!/bin/bash

# TODO:
# rename to install.puppet-client.sh

# install
apt-get install -qq -y puppet
 
# configure to autostart puppet on boot
sed -i 's|START=no|START=yes|g' /etc/default/puppet
