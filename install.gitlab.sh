#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
    sudo $0
    exit
fi

# install required packages
apt-get install -y ca-certificates curl cron

#  bypass the apt-cacher-ng proxy
echo 'Acquire::HTTP::Proxy::packages.gitlab.com "DIRECT";' > /etc/apt/apt.conf.d/99_gitlab

# download GitLab installation script
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash

# workaround for PostgreSQL shmmax issue
echo "kernel.shmmax=17179869184" >> /etc/sysctl.d/90-shmmax.conf
/sbin/sysctl -p /etc/sysctl.d/90-shmmax.conf

# install GitLab Community Edition
apt-get install -y gitlab-ce

# configure domain
sed -i "s|gitlab.example.com|$(hostname -A | tr -d ' ')|g" /etc/gitlab/gitlab.rb
gitlab-ctl reconfigure
