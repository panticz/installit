#!/bin/bash

# install required packages
apt-get install -y wget

# add repository key
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -

# add repository
echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
apt-get update

# install jenkins
apt-get install -y jenkins
