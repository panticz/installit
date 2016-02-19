#!/bin/bash

# install required applications 
sudo apt-get install -y software-properties-common

# add ansible repository
sudo apt-add-repository -y ppa:ansible/ansible

# update package list
sudo apt-get update

# install Ansible
sudo apt-get install -y ansible
