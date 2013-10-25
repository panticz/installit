#!/bin/bash

# install dovecot
sudo apt-get install -y dovecot-imapd

# enable secure imap only (Port 993)
sudo sed -i 's|^protocols = imap imaps|protocols = imaps|g' /etc/dovecot/dovecot.conf

# configure ssl
sudo sed -i 's|^#ssl_cert_file|ssl_cert_file|g' /etc/dovecot/dovecot.conf
sudo sed -i 's|^#ssl_key_file|ssl_key_file|g' /etc/dovecot/dovecot.conf
sudo sed -i 's|^#disable_plaintext_auth = yes|disable_plaintext_auth = yes|g' /etc/dovecot/dovecot.conf

# restart
sudo /etc/init.d/dovecot restart

# configure mailbox path
# sudo mail_location = maildir:~/Maildir
