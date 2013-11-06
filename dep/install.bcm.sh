#!/bin/bash

sudo echo "deb http://www.betavine.net/repository/debian lucid main" > /etc/apt/sources.list.d/betavine.list
sudo apt-get update -qq
sudo apt-get install -y bcm
