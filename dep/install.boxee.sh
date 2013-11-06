#!/bin/bash

wget http://dl.boxee.tv/boxee-0.9.20.10356.i486.deb -P /tmp
sudo dpkg -i /tmp/boxee-*.deb
sudo apt-get install -f -y
