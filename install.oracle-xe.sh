#!/bin/bash

# add oracle repository
wget http://oss.oracle.com/el4/RPM-GPG-KEY-oracle -O- | apt-key add -
echo "deb http://oss.oracle.com/debian unstable main non-free" > /etc/apt/sources.list.d/oracle.list
 
# update repository
apt-get update
 
# install oracle
apt-get install -y oracle-xe
