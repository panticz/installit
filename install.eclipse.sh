#/bin/bash

# download link
if [ "$(uname -m)" == "x86_64" ]; then
  # 64 bit
  URL=http://mirror.netcologne.de/eclipse/technology/epp/downloads/release/kepler/R/eclipse-jee-kepler-R-linux-gtk-x86_64.tar.gz
else
  # 32 bit
  URL=http://mirror.netcologne.de/eclipse/technology/epp/downloads/release/kepler/R/eclipse-jee-kepler-R-linux-gtk.tar.gz
fi

# install Java JDK
wget http://installit.googlecode.com/hg/install.java-jdk.sh -O - | bash -

# download new eclipse release
wget ${URL} -P /tmp

# backup old release
[ -d /usr/lib/eclipse/ ] && sudo mv /usr/lib/eclipse/ /usr/lib/eclipse.$(date -I)

# install new release
sudo tar xzf /tmp/eclipse-jee-*-linux-gtk*.tar.gz -C /usr/lib/

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
rm /tmp/eclipse-jee-juno-SR2-linux-gtk*.tar.gz
