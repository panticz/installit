#!/bin/bash

# add repository
sudo add-apt-repository -y ppa:pipelight/stable

# update repository
sudo apt-get update

# install pipelight
sudo apt-get install -y pipelight-multi

sudo pipelight-plugin --update
sudo pipelight-plugin --accept --enable silverlight
sudo pipelight-plugin --accept --enable flash
sudo pipelight-plugin --create-mozilla-plugins
