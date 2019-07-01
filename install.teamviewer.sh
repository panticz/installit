#!/bin/bash

# add teamviewer repository key
wget -qO - https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo apt-key add -

# add teamviewer repository
cat << EOF | sudo tee -a /etc/apt/sources.list.d/teamviewer.list
deb http://linux.teamviewer.com/deb stable main
EOF

# update package list
sudo apt-get update -qq

# install teamviewer
sudo apt-get install -y teamviewer
