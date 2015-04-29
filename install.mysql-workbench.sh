#!/bin/bash

# add repository
. /etc/os-release
echo "deb http://repo.mysql.com/apt/${ID}/ $(lsb_release -cs) workbench-6.3" | sudo tee -a /etc/apt/sources.list.d/mysql.list

# update package list
sudo apt-get update

# install MySQL Workbench Community edition
sudo apt-get install -y mysql-workbench-community
