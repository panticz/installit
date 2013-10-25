#!/bin/bash

wget http://smartgwt.googlecode.com/files/smartgwt-2.4.zip -P /tmp

sudo unzip /tmp/smartgwt-*.zip -d /usr/share/

sudo ln -s /usr/share/smartgwt-*/ /usr/share/smartgwt
sudo ln -s /usr/share/smartgwt/smartgwt.jar /usr/share/java/
sudo ln -s /usr/share/smartgwt/smartgwt-skins.jar /usr/share/java/
