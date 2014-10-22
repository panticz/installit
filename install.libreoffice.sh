#!/bin/bash

# add ppa repository
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo apt-get update -qq

# install
sudo apt-get install -y libreoffice
sudo apt-get install -y libreoffice-gnome libreoffice-help-de libreoffice-l10n-de libreoffice-officebean libreoffice-java-common libreoffice-base
sudo apt-get install -y hunspell-de-de hunspell-en-us hyphen-de mythes-de

# remove unnecessary gnome menu entries
sed -i 's|Education;Science;||' /usr/share/applications/libreoffice-math.desktop

# do we need this?
#sudo apt-get install -y openoffice.org openoffice.org-style-human openoffice.org-java-common
