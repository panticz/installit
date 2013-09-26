#!/bin/bash

# configure locale
wget -q http://www.panticz.de/sites/default/files/scripts/configure_locale.sh -O - | bash -

# update repository
apt-get update

debconf-set-selections <<\EOF
lxc lxc/directory string /var/lib/lxc
EOF

# install lxc
apt-get install -y lxc
