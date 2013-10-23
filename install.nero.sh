#!/bin/bash

URL=$1
FILE=${URL##*/}

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
