#!/bin/bash

sudo apt-get install -y debconf-utils

# create answer file
sudo debconf-set-selections <<\EOF
sun-java6-bin shared/accepted-sun-dlj-v1-1 boolean true
msttcorefonts msttcorefonts/defoma note
ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula boolean true
ttf-mscorefonts-installer msttcorefonts/present-mscorefonts-eula note
EOF

sudo apt-get install -y ubuntu-restricted-extras
