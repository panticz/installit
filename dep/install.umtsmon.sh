#!/bin/bash
 
apt-get install libqt3-mt
 
wget http://ovh.dl.sourceforge.net/project/umtsmon/umtsmon/0.10alpha2/umtsmon-0.10alpha2.i386.tar.gz -P /tmp/
tar xzf /tmp/umtsmon-*.i386.tar.gz  -C /tmp/
mkdir /usr/share/umtsmon/translations/
cp /tmp/umtsmon-*/i18n/umtsmon_*.qm /usr/share/umtsmon/translations/
cp /tmp/umtsmon-*/umtsmon /usr/sbin/
cp /tmp/umtsmon-*/umtsmon-128x128.png /usr/share/icons/
cp /tmp/umtsmon-*/umtsmon.desktop /usr/share/applications
