#!/bin/bash

if [ ! -z $1 ] {
  URL=$1
  FILE=${URL##*/}
} else {
  # get download URL
  if [ "$(uname -m)" == "x86_64" ]; then
    # 64 bit OS found
    OS="_64"
  fi
  URL=$(wget -q http://www.nero.com/deu/downloads/previous-versions/download-linux4-update.php -O - | egrep "^.*dlLink.*http.*x86${OS}.deb" | cut -d'"' -f2)

  # set file name
  FILE=nerolinux-x86${OS}.deb
}

# get file
if [ ${URL:0:4} == "http" ]; then
  wget ${URL} -O /tmp/${FILE}
else
  cp ${URL} /tmp/${FILE}
fi

# install file
sudo dpkg -i /tmp/${FILE}

# clean up
rm /tmp/${FILE}
