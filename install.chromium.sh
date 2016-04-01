#!/bin/bash

sudo apt-add-repository -y ppa:chromium-daily/stable

# fix not yet availlable Ubuntu Xenial repository
[ -f /etc/apt/sources.list.d/chromium-daily-ubuntu-stable-xenial.list ] && sed -i 's|xenial|devel|' /etc/apt/sources.list.d/chromium-daily-ubuntu-stable-xenial.list

sudo apt-get update -y -qq

sudo apt-get install -y chromium-browser
