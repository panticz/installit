#!/bin/bash

# add partner repository
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

# update
sudo apt-get update -qq

# install
sudo apt-get install -y skype
