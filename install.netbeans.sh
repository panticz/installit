#!/bin/bash

# download link
URL=http://download.netbeans.org/netbeans/7.3.1/final/bundles/netbeans-7.3.1-javase-linux.sh

# install Java JDK
wget http://installit.googlecode.com/hg/install.java-jdk.sh -O - | bash -

# download and install netbeans from homepage
wget ${URL} -O /tmp/netbeans-linux.sh
sudo bash /tmp/netbeans-linux.sh --silent

# cleanup
rm /tmp/netbeans-linux.sh
