#!/bin/bash

# add repository
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

# update
sudo apt-get update

# install spotify
sudo apt-get install -y spotify-client
