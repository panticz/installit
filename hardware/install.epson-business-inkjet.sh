#!/bin/bash

function fix_libxml2() {
   DEBDIR=/tmp/release/deb
   [ -d ${DEBDIR}/ ] && rm -r ${DEBDIR}/
   mkdir ${DEBDIR}/
   dpkg-deb -x /tmp/release/pips-common_3.2.0-3_i386.deb ${DEBDIR}/
   dpkg-deb --control /tmp/release/pips-common_3.2.0-3_i386.deb ${DEBDIR}/DEBIAN
   sed -i 's|libxml2 (>= 2.7.4), ||g' ${DEBDIR}/DEBIAN/control
   dpkg -b ${DEBDIR}/ /tmp/release/pips-common_3.2.0-3_i386.deb
}

# enable universe repository
sudo sed -i "s/# \(deb .* universe\)/\1/" /etc/apt/sources.list

# add support for 32 bit libs
sudo dpkg --add-architecture i386
sudo apt-get update

# install libs
sudo apt-get install -y libxml2:i386
sudo apt-get install -y libatk1.0-0:i386
sudo apt-get install -y libcairo2:i386
sudo apt-get install -y libcupsimage2:i386
sudo apt-get install -y libgtk2.0-0:i386
sudo apt-get install -y libpango1.0-0:i386
sudo apt-get install -y libstdc++6:i386

# download driver package
if [ ! -f /tmp/pips-pxb500-Ubuntu10.04-3.2.0-CG.tgz ]; then
   wget http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/62/55/2b7dee6496e6fdc44d823bd05aaf99d2ea3a38ee/pips-pxb500-Ubuntu10.04-3.2.0-CG.tgz -O /tmp/pips-pxb500-Ubuntu10.04-3.2.0-CG.tgz
fi

# extract
tar xzf /tmp/pips-pxb500-Ubuntu10.04-3.2.0-CG.tgz -C /tmp
bash /tmp/pips-pxb500-Ubuntu10.04-3.2.0-CG.install --noexec --keep --nox11 --target /tmp/release

# fix pips-common package
dpkg -s libxml2 1>/dev/null 2>&1 || fix_libxml2
   
# install driver
sudo dpkg -i --force-architecture /tmp/release/pips-common_3.2.0-3_i386.deb
sudo dpkg -i --force-architecture /tmp/release/pips-ubuntu10.04_3.2.0-3_i386.deb
sudo dpkg -i --force-architecture /tmp/release/pips-pxb500_3.2.0-3_i386.deb

# set owner
sudo chown root:root /usr/lib/cups/filter/pips-wrapper

# create network printer when IP specified
if [ -n "${1}" ]; then
    sudo lpadmin -p Epson_B-310N -v socket://${1}:2501 -E -P /usr/share/cups/model/ekpxb310.ppd
fi
