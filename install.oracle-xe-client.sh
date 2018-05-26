#!/bin/bash

# add support for i386 architecture
sudo dpkg --add-architecture i386
sudo apt-get update

# download packages
wget -q \
  https://oss.oracle.com/debian/dists/unstable/main/binary-i386/libaio_0.3.104-1_i386.deb \
  https://oss.oracle.com/debian/dists/unstable/non-free/binary-i386/oracle-xe-client_10.2.0.1-1.2_i386.deb \
  -P /tmp

# install packages
sudo dpkg -i /tmp/oracle-xe-client_10.2.0.1-1.2_i386.deb  /tmp/libaio_0.3.104-1_i386.deb
