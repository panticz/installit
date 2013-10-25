#!/bin/bash

sudo apt-add-repository -y http://debian.scribus.net/debian

sudo gpg --keyserver wwwkeys.pgp.net --recv-keys EEF818CF
sudo gpg --armor --export EEF818CF | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y --force-yes scribus

sudo apt-get remove qt-at-spi
