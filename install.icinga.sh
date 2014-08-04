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
icinga-cgi icinga/adminpassword-repeat string icingaadmin
icinga-cgi icinga/adminpassword string icingaadmin
icinga-cgi icinga/httpd select apache2
EOF

# install the latest version 
if [ "$1" == "-n" ]; then
  # add debmon.org Icinga repository
  echo "deb http://debmon.org/debmon debmon-wheezy main" > /etc/apt/sources.list.d/debmon.list
  wget -q http://debmon.org/debmon/repo.key -O - | apt-key add -
  apt-get update
fi

# install icinga
apt-get install -y icinga

# fix installation problems on latest version 
if [ "$1" == "-n" ]; then
  apt-get install -f
fi

# disable double log output to syslog
sed -i 's|use_syslog=1|use_syslog=0|g' /etc/icinga/icinga.cfg

# show 1000 results by default
sed -i 's|result_limit=50|result_limit=1000|g' /etc/icinga/cgi.cfg

# redirect to icinga if standalone webserver
if [ $(head -1 /var/www/index.html | grep -c 'It works!') -eq 1 ]; then
mv /var/www/index.html /var/www/index.html.$(date -I)
cat <<EOF> /var/www/index.html
<html>
<head>
<script type="text/javascript">
<!--
window.location = "/icinga/"
//-->
</script>
</head>
<body>
<a href="/icinga/">Icinga</a>
</body>
</html>
EOF
fi

# restart icinga
/etc/init.d/icinga restart
