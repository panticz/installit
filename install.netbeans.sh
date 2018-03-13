#!/bin/bash

if [ "$1" == "-j" ]; then
  # Java SE only
  URL=http://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-javase-linux.sh
else
  # with all included programming languages
  URL=http://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-linux.sh
fi

# install Java JDK
wget -q https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# download and install netbeans from homepage
wget -q ${URL} -O /tmp/netbeans-linux.sh
sudo bash /tmp/netbeans-linux.sh --silent

# cleanup
rm /tmp/netbeans-linux.sh

# configure java jdk home
echo netbeans_jdkhome="/usr/lib/jvm/default-java" | sudo tee -a /usr/local/netbeans-8.2/etc/netbeans.conf
