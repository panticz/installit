#!/bin/bash

sudo apt-get install -qq -y python-software-properties pkg-config

if [ "$1" == "-u" ]; then
    # add unstable repository
    sudo add-apt-repository -y ppa:team-xbmc/unstable
    
    RELEASE=$(lsb_release -rs | tr -d ".")
    if [ ${RELEASE} -gt 1110 ]; then
        # downgrade to oneiric (lastest available release)
        sudo sed -i "s|$(lsb_release -cs)|oneiric|g" /etc/apt/sources.list.d/team-xbmc-unstable-*.list
    fi
else
    # add stable repository
    sudo add-apt-repository -y ppa:team-xbmc/ppa

    RELEASE=$(lsb_release -rs | cut -d"." -f1)
    if [ ${RELEASE} -gt 10 ]; then
        # downgrade to maverick (lastest available release)
        sudo sed -i "s|$(lsb_release -cs)|maverick|g" /etc/apt/sources.list.d/team-xbmc-ppa-*.list
    fi
fi

# update
sudo apt-get update -qq

# install xbmc
sudo apt-get install -qq -y xbmc

# install required libraries
sudo apt-get install -qq -y libmad0 libmpeg2-4
