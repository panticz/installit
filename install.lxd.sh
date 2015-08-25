#!/bin/bash

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable

sudo apt-get update
sudo apt-get install -y lxd
