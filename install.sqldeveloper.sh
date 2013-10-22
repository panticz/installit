#!/bin/bash

if [ -z "$1" ]; then
  echo "Please enter the url to download"
  exit
else
  URL=$1
fi

FILE=${URL##*/}
[ -n "$2" ] && USER=$2

# install Java JRE
wget http://installit.googlecode.com/hg/install.java-jre.sh -O - | bash -

# get file
if [ ${URL:0:4} == "http" ]; then
  wget ${URL} -O /tmp/${FILE}
else
  cp ${URL} /tmp/${FILE}
fi

# extract
sudo unzip /tmp/${FILE} -d /usr/share/
sudo chmod +x /usr/share/sqldeveloper/sqldeveloper.sh
rm /tmp/sqldeveloper-*-no-jre.zip

# create startet
cat << EOF | sudo tee -a "/usr/share/applications/Oracle SQL Developer.desktop"
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Oracle SQL Developer
Type=Application
Terminal=false
Exec=/usr/share/sqldeveloper/sqldeveloper.sh
Icon=/usr/share/sqldeveloper/icon.png
Categories=Application;Development;
EOF

# create config dir
[ ! -d /home/${USER}/.sqldeveloper ] && mkdir /home/${USER}/.sqldeveloper
cat <<EOF> /home/${USER}/.sqldeveloper/jdk
/usr/lib/jvm/java-7-oracle/
EOF

# set owner
chown -R ${USER}:${USER} /home/${USER}/.sqldeveloper/

# cleanup
rm /tmp/${FILE}
