#!/bin/bash

URL=https://downloads.sourceforge.net/project/projectlibre/ProjectLibre/1.7/projectlibre_1.7.0-1.deb

# install Java JRE
wget -q https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# download
wget -q ${URL} -O /tmp/${URL##*/}

# install
sudo dpkg -i /tmp/${URL##*/}
