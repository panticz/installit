#!/bin/bash

# download link
if [ "$1" == "-e" ]; then
  # Java EE
  URL=http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-javaee-linux.sh
else
  # default, Java SE
  URL=http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-javase-linux.sh
fi

# install Java JDK
wget -q https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# download and install netbeans from homepage
wget -q ${URL} -O /tmp/netbeans-linux.sh
sudo bash /tmp/netbeans-linux.sh --silent

# cleanup
rm /tmp/netbeans-linux.sh
