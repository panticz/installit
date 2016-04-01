#!/bin/bash

# install required applications 
sudo apt-get install -y software-properties-common

# add ansible repository
sudo apt-add-repository -y ppa:ansible/ansible

# fix not yet availlable Ubuntu Xenial repository
[ -f /etc/apt/sources.list.d/ansible-ubuntu-ansible-xenial.list ] && sed -i 's|xenial|devel|' /etc/apt/sources.list.d/ansible-ubuntu-ansible-xenial.list

# update package list
sudo apt-get update

# install Ansible
sudo apt-get install -y ansible
