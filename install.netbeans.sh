#!/bin/bash

# download link
URL=http://download.netbeans.org/netbeans/7.4/final/bundles/netbeans-7.4-javase-linux.sh

# install Java JDK
wget -q https://raw.github.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# download and install netbeans from homepage
wget -q ${URL} -O /tmp/netbeans-linux.sh
sudo bash /tmp/netbeans-linux.sh --silent

# cleanup
rm /tmp/netbeans-linux.sh
