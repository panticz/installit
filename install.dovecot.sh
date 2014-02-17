#!/bin/bash

# ensure that this script is run by root
if [ $(id -u) -ne 0 ]; then
  sudo $0
  exit
fi

# install dovecot
apt-get install -y dovecot-imapd

# enable secure imap only (Port 993)
sed -i 's|#port = 143|port = 0|g' /etc/dovecot/conf.d/10-master.conf

# configure mailbox path
sed -i 's|mbox:~/mail:INBOX=/var/mail/%u|maildir:~/Maildir|g' /etc/dovecot/conf.d/10-mail.conf

# configure ssl
sed -i 's|^#ssl = yes|ssl = yes|g' /etc/dovecot/conf.d/10-ssl.conf
sed -i 's|^#disable_plaintext_auth = yes|disable_plaintext_auth = yes|g' /etc/dovecot/conf.d/10-auth.conf

# restart
/etc/init.d/dovecot restart
