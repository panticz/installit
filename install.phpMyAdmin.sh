#!/bin/bash

URL=http://switch.dl.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.0.0/phpMyAdmin-4.0.0-english.tar.bz2

# set variables
FILE=${URL##*/}

# set target
if [ ! -z $1 ]; then
  TARGET=$1
else
  TARGET=/var/www
fi

# set owner
if [ ! -z $2 ]; then
  WWW_USER=$2
else
  WWW_USER=www-data
fi

# download if not already exists
[ ! -f /tmp/${FILE} ] && wget -nv ${URL} -O /tmp/${FILE}

# backup old phpmyadmin installation
[ -d ${TARGET}/phpMyAdmin/ ] && mv ${TARGET}/phpMyAdmin/ ${TARGET}/phpMyAdmin.backup.$(date "+%F_%T")

# extract
tar -xjf /tmp/${FILE} -C ${TARGET}

# rename directory to simply "phpMyAdmin"
mv ${TARGET}/phpMyAdmin-*/ ${TARGET}/phpMyAdmin/

# change owner
chown ${WWW_USER}:${WWW_USER} -R ${TARGET}/phpMyAdmin/
