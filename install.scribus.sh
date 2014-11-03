#!/bin/bash
cat <<EOF> /etc/apt/sources.list.d/scribus.list
deb http://debian.scribus.net/debian/ raring main
deb http://debian.tagancha.org/debian/ raring main
EOF

sudo gpg --keyserver wwwkeys.pgp.net --recv-keys EEF818CF
sudo gpg --armor --export EEF818CF | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y --force-yes scribus

sudo apt-get remove qt-at-spi
