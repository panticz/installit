#!/bin/bash

# add repository
sudo add-apt-repository -y ppa:nilarimogard/webupd8

# update package list
sudo apt-get update -q

# install pulseaudio equalizer
sudo apt-get install -y pulseaudio-equalizer
