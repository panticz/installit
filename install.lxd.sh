#!/bin/bash

apt-get install -y software-properties-common
add-apt-repository -y ppa:ubuntu-lxc/lxd-stable

apt-get update
apt-get install -y lxd
