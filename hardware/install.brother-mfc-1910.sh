#!/bin/bash

# Check for newer packages
# http://support.brother.com/g/b/downloadlist.aspx?c=as_ot&lang=en&prod=mfc1910w_eu_as&os=128

IP=192.168.1.4

# Install printer
wget -q http://download.brother.com/welcome/dlf101543/mfc1910wlpr-3.0.1-1.i386.deb -P /tmp
wget -q http://download.brother.com/welcome/dlf101542/mfc1910wcupswrapper-3.0.1-1.i386.deb -P /tmp
dpkg -i /tmp/mfc1910*.deb
lpadmin -p Brother-MFC-1910 -E -v socket://${IP}:9100  -P /usr/share/ppd/brother/brother-MFC1910W-cups-en.ppd -o PageSize=A4

# Install scanner
wget -q http://download.brother.com/welcome/dlf006645/brscan4-0.4.3-3.amd64.deb -P /tmp
dpkg -i /tmp/brscan4-0.4.3-3.amd64.deb
brsaneconfig4 -a name=MFC-1910W2 model=MFC-1910W ip=${IP}
