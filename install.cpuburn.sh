#!/bin/bash

# set preselection
debconf-set-selections <<\EOF
cpuburn cpuburn/dangerous select 
EOF

apt-get install -y cpuburn
