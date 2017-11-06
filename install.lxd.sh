#!/bin/bash

# add LXD PPA repository
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable
sudo apt-get update

# install LXD
sudo apt-get install -y lxd

# initialize LXD
sudo lxd init --auto
