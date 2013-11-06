#!/bin/bash

gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t string -s /apps/metacity/general/theme Mist
gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t boolean -s /apps/metacity/general/reduced_resources true
