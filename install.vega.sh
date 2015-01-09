#!/bin/bash

sudo apt-get install libwebkitgtk-1.0

wget -q https://support.subgraph.com/downloads/VegaBuild-linux.gtk.x86_64.zip -O /tmp/VegaBuild-linux.gtk.x86_64.zip
sudo unzip /tmp/VegaBuild-linux.gtk.x86_64.zip -d /usr/share/

sudo ln -s /usr/share/vega/Vega /usr/local/bin/vega

cat <<EOF> /usr/share/applications/vega.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Vega
Comment=Vega Vulnerability Scanner
Exec=vega
Icon=/usr/share/vega/icon.xpm
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true
EOF
