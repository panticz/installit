#!/bin/bash

sudo apt-get install libmono-i18n4.0-all
wget -q https://github.com/OpenRA/OpenRA/releases/download/release-20161019/openra_release.20161019_all.deb -O /tmp/openra_release_all.deb
sudo dpkg -i /tmp/openra_release_all.deb
sudo apt-get install -f
