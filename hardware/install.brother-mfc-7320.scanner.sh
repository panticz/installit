#!/bin/bash

# patch udev rules
cat <<EOF>> /lib/udev/rules.d/40-libsane.rules
ATTRS{idVendor}=="04f9", ENV{libsane_matched}="yes"
EOF

# restart udev
sudo service udev restart

# download driver
wget http://pub.brother.com/pub/com/bsc/linux/dlf/brscan3-0.2.11-4.i386.deb -P /tmp

# install driver
sudo dpkg -i /tmp/brscan3-0.2.11-4.i386.deb
