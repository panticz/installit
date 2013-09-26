#!/bin/bash

# configure locale
wget -q http://www.panticz.de/sites/default/files/scripts/configure_locale.sh -O - | bash -

# update repository
apt-get update
 
# install debian xen kernel
apt-get install -y kvm libvirt-bin virtinst
 
# configure network bridge
virsh net-autostart default
 
# configure LVM
mkdir /etc/libvirt/storage
cat <<EOF> /etc/libvirt/storage/vg0.xml
<pool type='logical'>
  <name>vg0</name>
  <target>
    <path>/dev/vg0</path>
  </target>
</pool>
EOF

virsh pool-define /etc/libvirt/storage/vg0.xml
virsh pool-autostart vg0
