#!/bin/bash

# install required libs
sudo apt-get install -y libc6-i386 lib32asound2 lib32z1 ia32-libs

if [ "$(uname -m)" == "x86_64" ]; then
﻿  # 64 bit
﻿  URL=http://www.teamviewer.com/download/version_8x/teamviewer_linux_x64.deb
else
﻿  # 32 bit
﻿  URL=http://www.teamviewer.com/download/version_8x/teamviewer_linux.deb
fi

# download
wget ${URL} -P /tmp

# install
sudo dpkg -i /tmp/teamviewer_linux*.deb

# clean up
rm /tmp/teamviewer_linux*.deb

# remove teamviewer autostart service at login
sudo teamviewer --daemon disable
