#!/bin/bash

# install Java
wget https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# download Jameica
if [ "$(uname -m)" == "x86_64" ]; then
  # 64 bit
  URL=http://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux64.zip
else
  # 32 bit
  URL=http://www.willuhn.de/products/jameica/releases/current/jameica/jameica-linux.zip
fi
wget ${URL} -P /tmp

# install Jameica
sudo unzip /tmp/jameica-linux*.zip -d /opt/

# download Hibiscus
wget http://www.willuhn.de/products/hibiscus/releases/current/hibiscus.zip -P /tmp

# install Hibiscus
sudo unzip /tmp/hibiscus.zip -d /opt/jameica/plugins/

# create start entry
cat << EOF | sudo tee /usr/share/applications/Hibiscus.desktop
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
