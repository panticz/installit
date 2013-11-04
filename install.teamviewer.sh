#!/bin/bash

# install required libs
RELEASE=$(lsb_release -rs | tr -d ".")
if [ ${RELEASE} -ge 1310 ]; then
  sudo apt-get install -y libxtst6:i386
  sudo apt-get install -y gcc-4.8-base:i386
  sudo apt-get install -y libc6:i386
  sudo apt-get install -y libgcc1:i386
  sudo apt-get install -y libx11-6:i386
  sudo apt-get install -y libxau6:i386  
  sudo apt-get install -y libxcb1:i386
  sudo apt-get install -y libxdmcp6:i386
  sudo apt-get install -y libxext6:i386 
else
  sudo apt-get install -y libc6-i386 lib32asound2 lib32z1 ia32-libs
fi

if [ "$(uname -m)" == "x86_64" -a ${RELEASE} -lt 1310 ]; then
  # 64 bit
  URL=http://download.teamviewer.com/download/version_9x/teamviewer_linux_x64.deb
else
  # 32 bit
  URL=http://download.teamviewer.com/download/version_9x/teamviewer_linux.deb
fi

# download
wget -q ${URL} -P /tmp

# install
sudo dpkg -i /tmp/teamviewer_linux*.deb

# fix possible installation errors
sudo apt-get install -f -y

# clean up
rm /tmp/teamviewer_linux*.deb
