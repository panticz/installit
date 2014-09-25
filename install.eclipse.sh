#/bin/bash

# download link
if [ "$(uname -m)" == "x86_64" ]; then
  # 64 bit
  if [ "$1" == "-e" ]; then
    URL=http://mirror.netcologne.de/eclipse/technology/epp/downloads/release/luna/R/eclipse-jee-luna-R-linux-gtk-x86_64.tar.gz
  else
    URL=http://mirror.netcologne.de/eclipse/technology/epp/downloads/release/luna/R/eclipse-java-luna-R-linux-gtk-x86_64.tar.gz
  fi
else
  # 32 bit
    if [ "$1" == "-e" ]; then
    URL=http://mirror.netcologne.de/eclipse/technology/epp/downloads/release/luna/R/eclipse-jee-luna-R-linux-gtk.tar.gz
  else
    URL=http://mirror.netcologne.de/eclipse/technology/epp/downloads/release/luna/R/eclipse-java-luna-R-linux-gtk.tar.gz
  fi
fi

# install Java JDK
wget -q https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# download new eclipse release
wget -q ${URL} -P /tmp

# backup old release
[ -d /usr/lib/eclipse/ ] && sudo mv /usr/lib/eclipse/ /usr/lib/eclipse.$(date -I)

# install new release
sudo tar xzf /tmp/eclipse-*-linux-gtk*.tar.gz -C /usr/lib/

# set owner and permissions
sudo chown -R root:root /usr/lib/eclipse
sudo chmod -R +r /usr/lib/eclipse

# add executable to path
cat <<EOF> /tmp/eclipse
#!/bin/sh
export ECLIPSE_HOME="/usr/lib/eclipse"

\${ECLIPSE_HOME}/eclipse $*
EOF

sudo mv /tmp/eclipse /usr/bin/eclipse
sudo chmod 755 /usr/bin/eclipse

# fix UI bug on Debian Wheezy
. /etc/os-release
if [ "${ID}" == "debian" -a "${VERSION_ID}" == "7" ]; then
  sudo sed -i '3i export SWT_GTK3=0' /usr/bin/eclipse
fi

# create starter
cat <<EOF> /tmp/eclipse.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Eclipse
Comment=Eclipse IDE
Exec=eclipse
Icon=/usr/lib/eclipse/icon.xpm
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true
EOF

sudo mv /tmp/eclipse.desktop /usr/share/applications/eclipse.desktop
sudo chmod +r /usr/share/applications/eclipse.desktop

# configure memory
sudo sed -i 's|-Xmx384m|-Xmx1024m|g' /usr/lib/eclipse/eclipse.ini

# clean up
rm /tmp/eclipse-*-linux-gtk*.tar.gz
