#!/bin/bash

# update repository
apt-get update

debconf-set-selections <<\EOF
lxc lxc/directory string /var/lib/lxc
EOF

# install lxc
apt-get install -y lxc
