#!/bin/bash

debconf-set-selections <<\EOF
mysql-server-5.1 mysql-server/root_password_again string root
mysql-server-5.1 mysql-server/root_password string root
EOF
 
# install
sudo apt-get -y install mysql-server
