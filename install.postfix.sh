#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
sudo $0
  exit
fi

# pre-configure
debconf-set-selections <<\EOF
postfix postfix/mailname string mx
postfix postfix/main_mailer_type select Internet Site
EOF
 
# install
apt-get install -y postfix
 
# post-configure
cp /etc/postfix/main.cf  /etc/postfix/main.cf.$(date -I)
postconf -e 'myhostname = example.com'
postconf -e 'relayhost = smtp.gmail.com'
postconf -e 'smtp_sasl_security_options = noanonymous'
postconf -e 'smtp_sasl_password_maps = hash:/etc/postfix/sasl_password'
postconf -e 'smtp_sasl_auth_enable = yes'
postconf -e 'message_size_limit = 0'
 
# configure smtp
#cp /tmp/etc/postfix/sasl_password /etc/postfix/
echo 'smtp.gmail.com you@gmail.com:password' > /etc/postfix/sasl_password
postmap /etc/postfix/sasl_password
 
# restart
/etc/init.d/postfix restart
