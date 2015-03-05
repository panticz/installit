#!/bin/bash

# install libcairo2
wget http://mirrors.kernel.org/ubuntu/pool/main/c/cairo/libcairo2_1.13.0~20140204-0ubuntu1.1_amd64.deb -P /tmp
sudo dpkg -i /tmp/libcairo2_*_amd64.deb

# download and install mysql-workbench
wget http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community-6.2.4-1ubu1404-amd64.deb -P /tmp
sudo dpkg -i /tmp/mysql-workbench-community-*-1ubu1404-amd64.deb

# fix possible dependency errors
sudo apt-get install -f -y
