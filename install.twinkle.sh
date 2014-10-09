#!/bin/bash

# use precise, trusty seams to by broken
echo "deb http://ubuntu.mirror.cambrium.nl/ubuntu/ precise main universe" > /etc/apt/sources.list.d/twinkle.list
apt-get update
#wget http://mirrors.kernel.org/ubuntu/pool/universe/t/twinkle/twinkle_1.4.2-2.1_amd64.deb -P /tmp/
#dpkg -i /tmp/twinkle_1.4.2-2.1_amd64.deb
apt-get install twinkle/precise
# apt-get install twinkle
# libboost-regex1.46.1 libccgnu2-1.7-0 libccrtp1-1.8-0 libqt3-mt libzrtpcpp-1.4-0
rm /etc/apt/sources.list.d/twinkle.list
apt-get update
