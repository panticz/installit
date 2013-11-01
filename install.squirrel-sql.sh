#!/bin/bash

# download link
URL=http://switch.dl.sourceforge.net/project/squirrel-sql/1-stable/3.5.0-plainzip/squirrel-sql-3.5.0-standard.tar.gz

# install Java JRE
wget http://installit.googlecode.com/hg/install.java-jre.sh -O - | bash -

# download
wget ${URL} -O /tmp/squirrel-sql-3.5.0-standard.tar.gz

# extract
sudo tar xzf /tmp/squirrel-sql-3.5.0-standard.tar.gz -C /usr/lib/
sudo chown root:root -R /usr/lib/squirrel-sql
sudo chmod +r -R /usr/lib/squirrel-sql
sudo ln -s /usr/lib/squirrel-sql-3.5.0-standard /usr/lib/squirrel-sql

# create starter
cat <<EOF> /tmp/squirrel-sql.desktop
[Desktop Entry]
Name=SQuirreL SQL
Comment=SQuirreL SQL Client
Exec=/usr/lib/squirrel-sql-3.5.0-standard/squirrel-sql.sh
Icon=/usr/lib/squirrel-sql-3.5.0-standard/icons/acorn.xpm
Terminal=false
Type=Application
Categories=GTK;Database;Development;Application
EOF

sudo mv /tmp/squirrel-sql.desktop /usr/share/applications/squirrel-sql.desktop
sudo chmod +r /usr/share/applications/squirrel-sql.desktop

# cleanup
rm /tmp/squirrel-sql-3.5.0-standard.tar.gz
