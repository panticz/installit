#!/bin/bash

# get URL
URL=https://dl.google.com/linux/direct/google-musicmanager-beta_current_amd64.deb

# download
wget ${URL} -qO /tmp/google-musicmanager-beta_current_amd64.deb

# install
sudo dpkg -i /tmp/google-musicmanager-beta_current_amd64.deb
