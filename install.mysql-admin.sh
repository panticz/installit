#!/bin/bash

# add lucid repository
echo "deb http://ubuntu.mirror.cambrium.nl/ubuntu/ lucid main universe" > /etc/apt/sources.list.d/lucid.list
apt-get update -qq

# install
apt-get install -y mysql-admin
apt-get install -y mysql-query-browser

# remove lucid repository
rm /etc/apt/sources.list.d/lucid.list
apt-get update -qq
