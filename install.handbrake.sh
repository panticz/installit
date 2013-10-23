#!/bin/bash

sudo apt-add-repository -y ppa:stebbins/handbrake-snapshots
sudo apt-get update -qq
sudo apt-get install -y handbrake-cli handbrake-gtk
