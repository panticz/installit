#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
    sudo $0
    exit
fi

# parse download URL from GitLab page
. /etc/os-release 
URL=$(wget -q --no-check-certificate https://about.gitlab.com/downloads/archives/ -O - | grep -i href | grep -i ${ID}-${VERSION_ID} | head -1 | cut -d"\"" -f2)

# download gitlab omnibus package
wget -q --no-check-certificate ${URL} -O /tmp/gitlab_amd64.deb

# install
dpkg -i /tmp/gitlab_amd64.deb

# configure
gitlab-ctl reconfigure
