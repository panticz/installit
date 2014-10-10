#!/bin/bash

if [[ $(dpkg-query -W -f='${Version}' mysql-server) =~ 5.5 ]]; then
  # current version compatible with PHP 5.3 and MySQL 5.5
  URL=http://switch.dl.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.2.9.1/phpMyAdmin-4.2.9.1-english.tar.bz2
else
  # older version compatible with PHP 5.2 and MySQL 5
  URL=http://switch.dl.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.0.10/phpMyAdmin-4.0.10-english.tar.bz2
fi

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
