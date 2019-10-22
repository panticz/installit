#!/bin/bash

# install Java
wget https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# download Jameica
URL=http://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux64.zip
wget ${URL} -qP /tmp

# install Jameica
sudo unzip /tmp/jameica-linux*.zip -d /opt/

# download Hibiscus
wget http://www.willuhn.de/products/hibiscus/releases/current/hibiscus.zip -qP /tmp

# install Hibiscus
sudo unzip /tmp/hibiscus.zip -d /opt/jameica/plugins/

# create start entry
cat << EOF | sudo tee /usr/share/applications/jameica.desktop
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Hibiscus
Type=Application
Terminal=false
Exec=/opt/jameica/jameica.sh
Icon=/opt/jameica/jameica-icon.png
Categories=Office;Finance;
EOF
