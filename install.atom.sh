#!/bin/bash

wget https://atom.io/download/deb -qO /tmp/atom-amd64.deb2
sudo dpkg -i /tmp/atom-amd64.deb

apm install atom-beautify
