#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

debconf-set-selections <<\EOF
postfix postfix/mailname string icinga
postfix postfix/main_mailer_type select Internet Site
icinga-common icinga/check_external_commands select false
icinga-cgi icinga/adminpassword-repeat string t00r
icinga-cgi icinga/adminpassword string t00r
icinga-cgi icinga/httpd select apache2
EOF

# add debmon icinga repository
#wget http://debmon.org/debmon/repo.key -O - | apt-key add -
#echo "deb http://debmon.org/debmon debmon-wheezy main" > /etc/apt/sources.list.d/debmon-wheezy.list
#apt-get update

# install icinga
apt-get install -y icinga

# disable double log output to syslog
sed -i 's|use_syslog=1|use_syslog=0|g' /etc/icinga/icinga.cfg

# restart icinga
/etc/init.d/icinga restart
