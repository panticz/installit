#!/bin/bash

sudo apt-get install -y gnome-session-fallback
sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y gtk2-engines-pixbuf
sudo /usr/lib/lightdm/lightdm-set-defaults -s gnome-fallback

# show printer symbol in gnome menu
sed -i 's|NotShowIn=KDE;GNOME;|NotShowIn=KDE;|g' /usr/share/applications/system-config-printer.desktop
