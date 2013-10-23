#!/bin/bash

if [ ! -z $1 ]; then
    USER=$1
else
    USER=$(cat /etc/passwd | grep 1000 | cut -d":" -f1)
fi

# add repository if necessary
RELEASE=$(lsb_release -rs | tr -d ".")
if [ ${RELEASE} -ge 1110 ]; then
cat << EOF | sudo tee -a  /etc/lightdm/lightdm.conf
autologin-user=${USER}
autologin-user-timeout=0
EOF
else
cat << EOF | sudo tee -a /etc/gdm/custom.conf
[daemon]
TimedLoginEnable=false
AutomaticLoginEnable=true
TimedLogin=${USER}
AutomaticLogin=${USER}
TimedLoginDelay=30
DefaultSession=gnome
EOF
fi
