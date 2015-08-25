#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable

# use Ubunut Trusty repository on Utopic
sed -i 's|utopic|trusty|g' /etc/apt/sources.list.d/ubuntu-lxc-ubuntu-lxd-stable-utopic.list

sudo apt-get update
sudo apt-get install -y lxd lxcfs
