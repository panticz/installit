#!/bin/bash

# use precise, trusty seams to by broken
echo "deb http://ubuntu.mirror.cambrium.nl/ubuntu/ precise main universe" > /etc/apt/sources.list.d/twinkle.list
apt-get update
apt-get install twinkle/precise
rm /etc/apt/sources.list.d/twinkle.list
apt-get update
