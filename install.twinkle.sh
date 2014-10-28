#!/bin/bash

RELEASE=$(lsb_release -rs | tr -d ".")
if [ ${RELEASE} -ge 1404 ]; then
  # use precise, trusty seams to by broken
  apt-get remove -y twinkle
  echo "deb http://ubuntu.mirror.cambrium.nl/ubuntu/ precise main universe" > /etc/apt/sources.list.d/twinkle.list
  apt-get update
  apt-get install -y twinkle/precise
  echo "twinkle hold" | sudo dpkg --set-selections
  rm /etc/apt/sources.list.d/twinkle.list
  apt-get update
else
  apt-get install -y twinkle
fi
