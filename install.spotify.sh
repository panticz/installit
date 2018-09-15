#!/bin/bash

# add spotify repository key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

# add spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# update repository list
sudo apt-get update -qq

# install spotify
sudo apt-get install -y spotify-client
