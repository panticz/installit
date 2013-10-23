#!/bin/bash

# parse download link
URL=$(wget -q http://www.tipp10.com/de/download/getfile/5/ -O - | grep getfile | tail -1 | cut -d"\"" -f 2)

# download
wget "http://www.tipp10.com${URL}" -O /tmp/tipp10.deb

# install
sudo dpkg -i /tmp/tipp10.deb
