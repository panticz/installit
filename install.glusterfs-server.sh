#!/bin/bash

# add repository
echo "deb http://download.gluster.org/pub/gluster/glusterfs/3.3/3.3.1/Debian/squeeze.repo squeeze main" >> /etc/apt/sources.list.d/glusterfs.list

# add key
wget -O - http://download.gluster.org/pub/gluster/glusterfs/3.3/3.3.1/Debian/gpg.key | apt-key add -

apt-get update

# install glusterfs server
apt-get install -y glusterfs-server
