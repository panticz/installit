#!/bin/bash

# add repository
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo apt-get update -qq

# install wine
sudo apt-get install -y wine1.5
