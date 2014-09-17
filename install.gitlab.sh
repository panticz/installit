#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
    sudo $0
    exit
fi

# download url
URL=https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.2.0-omnibus-1_amd64.deb

# download gitlab omnibus package
wget -q ${URL} -O /tmp/gitlab_amd64.deb

# install
dpkg -i /tmp/gitlab_amd64.deb

# configure
gitlab-ctl reconfigure
