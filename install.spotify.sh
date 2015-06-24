#!/bin/bash

# add repository
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59 D2C19886

# update
sudo apt-get update -qq

# install spotify
sudo apt-get install -y spotify-client
