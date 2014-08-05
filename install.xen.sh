#!/bin/bash

if [ "$(lsb_release -is)" == "Ubuntu" ]; then
 # install Ubuntu xen kernel
 apt-get install -y xen-system-amd64 xen-tools
 
  # create network bridge
 sed -i 's|auto eth0|#auto eth0|g' /etc/network/interfaces
 sed -i 's|iface eth0 inet dhcp|#iface eth0 inet dhcp|g' /etc/network/interfaces

 cat <<EOF>> /etc/network/interfaces
auto xenbr0
iface xenbr0 inet dhcp
  bridge_ports eth0
EOF
else 
 # install Debian xen kernel
 apt-get install -y xen-linux-system xen-tools debootstrap
 
 # OPTINAL: install qemu for HVM guests
 . /etc/os-release
 if [ ${VERSION_ID} -lt 7 ]; then
    apt-get install -y xen-qemu-dm-4.0
 fi
 
 # Workaround for wheezy "powernow-k8: transition frequency failed" 
 if [[ "$(uname -r)" == *3.2.0* ]]; then
  echo "blacklist powernow_k8" >> /etc/modprobe.d/blacklist.conf
 fi
fi

# configure grub to start xen kernel
dpkg-divert --divert /etc/grub.d/09_linux_xen --rename /etc/grub.d/20_linux_xen
if [ $(grep -c GRUB_DISABLE_OS_PROBER /etc/default/grub) -eq 0 ]; then
    echo "GRUB_DISABLE_OS_PROBER=true" >> /etc/default/grub
fi
update-grub

# OPTIONAL: configure memory for dom0
if [ $(grep -c GRUB_CMDLINE_XEN /etc/default/grub) -eq 0 ]; then
    echo GRUB_CMDLINE_XEN=\"\" >> /etc/default/grub
fi
sed -i 's|GRUB_CMDLINE_XEN="|GRUB_CMDLINE_XEN="dom0_mem=512M |g' /etc/default/grub
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

# FIX for first generatio Athlon / Opteron AMD CPUs
if [[ $(cat /proc/cpuinfo | grep 'model name' | cut -d':' -f2) =~ AMD.*(Athlon.*64.*Processor|Opteron.*185) ]]; then
   sed -i 's|GRUB_CMDLINE_XEN="|GRUB_CMDLINE_XEN="allow_unsafe |g' /etc/default/grub
   update-grub
fi

# clean up blanks
sed -i 's| "|"|g' /etc/default/grub
