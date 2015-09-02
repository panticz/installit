#!/bin/bash

# install required applications
apt-get install -y wget apt-transport-https bc

# add oracle repository
wget http://oss.oracle.com/el4/RPM-GPG-KEY-oracle -O- | apt-key add -
echo "deb https://oss.oracle.com/debian unstable main non-free" > /etc/apt/sources.list.d/oracle.list
 
# update repository
apt-get update
 
# install oracle
apt-get install -y --force-yes oracle-xe
