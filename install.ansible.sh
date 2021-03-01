#!/bin/bash

# install required applications 
sudo apt install -y software-properties-common

# add ansible repository
sudo apt-add-repository --yes --update ppa:ansible/ansible

# install Ansible
sudo apt install -y ansible
