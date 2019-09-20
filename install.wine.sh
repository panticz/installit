#!/bin/bash

# add repository
sudo apt install -y apt-transport-https
sudo dpkg --add-architecture i386
wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
sudo apt-get update -qq

# pre-answer installation questions
sudo debconf-set-selections <<\EOF
msttcorefonts msttcorefonts/defoma note
ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula boolean true
ttf-mscorefonts-installer msttcorefonts/present-mscorefonts-eula note
EOF

# install wine
if [ "$1" == "-s" ]; then
  # staging release
  sudo apt-get install -y --install-recommends winehq-staging
else
  # stable release
  sudo apt-get install -y --install-recommends winehq-stable
fi

# install latest winetricks
sudo apt-get install -y winetricks
sudo winetricks --self-update
