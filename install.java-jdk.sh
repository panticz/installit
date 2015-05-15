#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install debconf
apt-get install -y debconf-utils

# create answer file
debconf-set-selections <<\EOF
oracle-java8-installer shared/accepted-oracle-license-v1-1 select true
EOF

# ensure that add-apt-repository is installed
. /etc/os-release
if [ "${ID}" == "debian" ]; then
  # debian
  apt-get install -y python-software-properties
else
  # ubuntu
  apt-get install -y software-properties-common
fi

# add repository
add-apt-repository -y ppa:webupd8team/java

# fix distribution name on Debian
for FILE in $(find /etc/apt/sources.list.d/ -name "*webupd8team*.list"); do
  sed -i 's|squeeze|trusty|g;s|wheezy|trusty|g;s|jessie|trusty|g' ${FILE}
done

# update repository
apt-get update -qq

#  bypass the apt-cacher-ng proxy
echo 'Acquire::HTTP::Proxy::download.oracle.com "DIRECT";' > /etc/apt/apt.conf.d/99_oracle

# install
apt-get install -y oracle-java8-installer

# set Java environment variables
apt-get install -y oracle-java8-set-default

# set java 8 as default java version
update-java-alternatives -s java-8-oracle
