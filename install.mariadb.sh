#!/bin/bash

apt-get install python-software-properties

apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
add-apt-repository 'deb http://mirror.netcologne.de/mariadb/repo/10.1/debian wheezy main'
apt-get update

apt-get install -y mariadb-server
