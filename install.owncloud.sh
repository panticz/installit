#!/bin/bash

echo 'deb http://download.opensuse.org/repositories/isv:ownCloud:community/Debian_7.0/ /' > /etc/apt/sources.list.d/owncloud.list
wget -q http://download.opensuse.org/repositories/isv:ownCloud:community/Debian_7.0/Release.key -O - | apt-key add -
apt-get update
apt-get install -y owncloud
