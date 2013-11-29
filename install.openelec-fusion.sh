#!/bin/bash

URL=http://www.openelec.tv/get-openelec/download/finish/4-fusion-builds/253-openelec-stable-fusion-x86-64

wget -q ${URL} -O /tmp/OpenELEC-Fusion.x86_64.tar
tar xf /tmp/OpenELEC-Fusion.x86_64.tar -C /tmp/

cp /tmp/OpenELEC*/target/KERNEL /var/lib/tftpboot/openelec/KERNEL
cp /tmp/OpenELEC*/target/SYSTEM /media/openelec/

if [ $(grep openelec /etc/fstab | wc -l) == 0 ]; then
cat <<EOF>> /etc/fstab
/media/openelec       /export/openelec none    bind  0  0
EOF
fi

if [ $(grep openelec /etc/exports | wc -l) == 0 ]; then
cat <<EOF>> /etc/exports
/export/openelec  192.168.2.0/24(rw,nohide,insecure,no_subtree_check,async)
EOF
fi

if [ -f /var/lib/tftpboot/pxelinux.cfg/openelec.conf ]; then
cat <<EOF> /var/lib/tftpboot/pxelinux.cfg/openelec.conf
LABEL linux
   MENU LABEL OpenElec
   KERNEL openelec/KERNEL
   APPEND ip=dhcp boot=NFS=192.168.2.1:/export/openelec disk=NFS=192.168.2.1:/export/openelec/storage overlay ssh
# nosplash
EOF
fi
