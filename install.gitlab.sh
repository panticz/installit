#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
    sudo $0
    exit
fi

# install required packages
apt-get install -y ca-certificates curl

# download GitLab installation script
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb | bash

# install GitLab Community Edition
apt-get install -y gitlab-ce

# configure domain
sed -i "s|gitlab.example.com|$($hostname -A)|g" /var/opt/gitlab/gitlab-rails/etc/gitlab.yml
