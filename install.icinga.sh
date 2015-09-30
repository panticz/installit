#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

debconf-set-selections <<\EOF
postfix postfix/mailname string $(hostname)
postfix postfix/main_mailer_type select Internet Site
icinga-common icinga/check_external_commands select false
icinga-cgi icinga/adminpassword-repeat string icingaadmin
icinga-cgi icinga/adminpassword string icingaadmin
icinga-cgi icinga/httpd select apache2
EOF

# install the latest version 
. /etc/os-release
if [ "${ID}" == "debian" ]; then
  # add debmon.org Icinga repository
  DIST=$(grep PRETTY_NAME /etc/os-release | cut -d "(" -f2 | cut -d ")" -f1)
  echo "deb http://debmon.org/debmon debmon-${DIST} main" > /etc/apt/sources.list.d/debmon.list
  wget -q http://debmon.org/debmon/repo.key -O - | apt-key add -
  apt-get update
fi

# install icinga
apt-get install -y icinga

# disable double log output to syslog
sed -i 's|use_syslog=1|use_syslog=0|g' /etc/icinga/icinga.cfg

# show 1000 results by default
sed -i 's|result_limit=50|result_limit=1000|g' /etc/icinga/cgi.cfg

# restart icinga
/etc/init.d/icinga restart

# redirect by default to /icinga/
echo 'RedirectMatch "^/$" "/icinga/"' >> /etc/apache2/conf-available/icinga.conf
