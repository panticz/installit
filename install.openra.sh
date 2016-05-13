#!/bin/bash

wget -q https://github.com/OpenRA/OpenRA/releases/download/release-20160508/openra_release.20160508_all.deb -O /tmp/openra_release_all.deb
dpkg -i /tmp/openra_release_all.deb
apt-get install -f
