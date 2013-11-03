#!/bin/bash

# add repository
sudo apt-add-repository -y ppa:ehoover/compholio
sudo apt-add-repository -y ppa:mqchael/pipelight

# update repository
sudo apt-get update

# install pipelight
sudo apt-get install -y pipelight
