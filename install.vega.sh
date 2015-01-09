#!/bin/bash

# install Java JDK
wget -q https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

sudo apt-get install libwebkitgtk-1.0

# download link
if [ "$(uname -m)" == "x86_64" ]; then
  # 64 bit
  URL=http://support.subgraph.com/downloads/VegaBuild-linux.gtk.x86_64.zip
else
  # 32 bit
  URL=http://support.subgraph.com/downloads/VegaBuild-linux.gtk.x86.zip
fi

# download new eclipse release
wget -q ${URL} -P /tmp

# extract
sudo unzip /tmp/VegaBuild-linux.gtk.*.zip -d /usr/share/

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
