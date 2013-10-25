#!/bin/bash

sudo add-apt-repository ppa:me-davidsansome/clementine
sudo apt-get update
sudo apt-get install clementine

# fix qt-at-spi bug on Ubuntu 11.10
sudo apt-get remove qt-at-spi
