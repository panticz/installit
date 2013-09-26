#!/bin/bash

# configure locale
wget -q http://www.panticz.de/sites/default/files/scripts/configure_locale.sh -O - | bash -

# update repository
apt-get update
 
# install debian xen kernel
apt-get install -y xen-linux-system xen-tools debootstrap
 
# OPTINAL: install qemu for HVM guests
apt-get install -y xen-qemu-dm-4.0
 
# configure grub to start xen kernel
mv /etc/grub.d/10_linux /etc/grub.d/25_linux
echo "GRUB_DISABLE_OS_PROBER=true" >> /etc/default/grub
update-grub
 
# OPTIONAL: configure memory for dom0
echo GRUB_CMDLINE_XEN="dom0_mem=512M" >> /etc/default/grub
sed -i 's|(enable-dom0-ballooning yes)|(enable-dom0-ballooning no)|g' /etc/xen/xend-config.sxp
update-grub
 
# configure network bridge
sed -i 's|# (network-script network-bridge)|(network-script network-bridge)|g' /etc/xen/xend-config.sxp
 
# dont save domU, just shutdown
sed -i 's|XENDOMAINS_SAVE=/var/lib/xen/save|XENDOMAINS_SAVE="" |g' /etc/default/xendomains
sed -i 's|XENDOMAINS_RESTORE=true|XENDOMAINS_RESTORE=false |g' /etc/default/xendomains
 
# create dir for domU autostart
[ -d /etc/xen/auto ] || mkdir /etc/xen/auto
 
# set more cpu time for dom0
sed -i '$ i\xm sched-credit -d Domain-0 -w 512' /etc/rc.local

# Workaround for wheezy "powernow-k8: transition frequency failed"
if [[ "$(uname -r)" == *3.2.0* ]]; then
   echo "blacklist powernow_k8" > /etc/modprobe.d/xen-blacklist.conf
fi
