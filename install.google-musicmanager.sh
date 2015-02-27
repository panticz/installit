#!/bin/bash

# get URL
if [ "$(uname -m)" == "x86_64" ]; then
  # 64 bit
  URL=https://dl.google.com/linux/direct/google-musicmanager-beta_current_amd64.deb
else
  # 32 bit
  URL=https://dl.google.com/linux/direct/google-musicmanager-beta_current_i386.deb
fi

# download
wget ${URL} -P /tmp

# install
sudo dpkg -i /tmp/google-musicmanager-beta_current_*.deb
