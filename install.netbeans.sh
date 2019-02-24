#!/bin/bash

URL=https://www-us.apache.org/dist/incubator/netbeans/incubating-netbeans/incubating-10.0/incubating-netbeans-10.0-bin.zip

# install required applications
sudo apt -y install wget unzip

# download netbeans package
wget ${URL} -O /tmp/incubating-netbeans-bin.zip

# unip netbeans
sudo unzip -d /opt /tmp/incubating-netbeans-bin.zip

# create netbeans starter
cat <<EOF> /tmp/netbeans.desktop
[Desktop Entry]
Encoding=UTF-8
Name=NetBeans IDE
Exec=/opt/netbeans/bin/netbeans
Icon=/opt/netbeans/nb/netbeans.png
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
EOF

sudo mv /tmp/netbeans.desktop /usr/share/applications/netbeans.desktop
sudo chmod +r /usr/share/applications/netbeans.desktop

# install Java JDK
wget -q https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -
