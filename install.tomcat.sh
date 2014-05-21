#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install Java JDK
wget -q https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -

# install tomcat
apt-get install -y tomcat7

# configure JAVA_HOME
echo "JAVA_HOME=/usr/lib/jvm/$(ls /usr/lib/jvm | grep oracle | tail -1)" >> /etc/default/tomcat?

# install authbind
apt-get install -y authbind

# create /etc/authbind/byport/80
touch /etc/authbind/byport/80
chmod 500 /etc/authbind/byport/80
chown tomcat7:tomcat7 /etc/authbind/byport/80

# configure tomcat to port 80
sed -i 's|port="8080"|port="80"|g' /etc/tomcat?/server.xml

# bind to a privileged port
sed -i 's|#AUTHBIND=no|AUTHBIND=yes|g' /etc/default/tomcat?

# restart tomcat
/etc/init.d/tomcat7 restart
