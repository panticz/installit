#!/bin/bash

# add skype repository
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list

# add repository key
wget https://repo.skype.com/data/SKYPE-GPG-KEY -qO- | sudo apt-key add -

# update
sudo apt-get update -qq

# install requirements
sudo apt install -y apt-transport-https

# install skype
sudo apt install -y skypeforlinux
