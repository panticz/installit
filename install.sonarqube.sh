#!/bin/bash

# install Java
wget -q --no-check-certificate https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# install SonarQube
echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" > /etc/apt/sources.list.d/sonar.list
sudo apt-get update
sudo apt-get install -y --force-yes sonar

# autostart SonarQube
sudo update-rc.d sonar defaults
