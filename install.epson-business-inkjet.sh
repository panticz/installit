#!/bin/bash

# enable universe repository
sudo sed -i "s/# \(deb .* universe\)/\1/" /etc/apt/sources.list

# install libs
sudo apt-get install -y libxml2

# get b500 driver
if [ ! -f /tmp/pips-pxb500-Ubuntu10.04-3.2.0-CG.tgz ]; then
   wget http://a1227.g.akamai.net/f/1227/40484/1d/download.ebz.epson.net/dsc/f/01/00/01/62/55/2b7dee6496e6fdc44d823bd05aaf99d2ea3a38ee/pips-pxb500-Ubuntu10.04-3.2.0-CG.tgz -O /tmp/pips-pxb500-Ubuntu10.04-3.2.0-CG.tgz
fi

# extract
tar xzf /tmp/pips-pxb500-Ubuntu10.04-3.2.0-CG.tgz -C /tmp
bash /tmp/pips-pxb500-Ubuntu10.04-3.2.0-CG.install --noexec --keep --nox11 --target /tmp/release

# fix pips-common package on Ubuntu Oneiric
RELEASE=$(lsb_release -rs | tr -d ".")
if [ ${RELEASE} -lt 1004 ]; then
  DEBDIR=/tmp/release/deb
  [ -d ${DEBDIR}/ ] && rm -r ${DEBDIR}/
  mkdir ${DEBDIR}/
  dpkg-deb -x /tmp/release/pips-common_3.2.0-3_i386.deb ${DEBDIR}/
  dpkg-deb --control /tmp/release/pips-common_3.2.0-3_i386.deb ${DEBDIR}/DEBIAN
  sed -i 's|libxml2 (>= 2.7.4), ||g' ${DEBDIR}/DEBIAN/control
  dpkg -b ${DEBDIR}/ /tmp/release/pips-common_3.2.0-3_i386.deb
fi

# install b500 driver
sudo dpkg -i --force-architecture /tmp/release/pips-common_3.2.0-3_i386.deb
sudo dpkg -i --force-architecture /tmp/release/pips-ubuntu10.04_3.2.0-3_i386.deb
sudo dpkg -i --force-architecture /tmp/release/pips-pxb500_3.2.0-3_i386.deb
 
# create network printer if IP specified
if [ -n "${1}" ]; then
    sudo lpadmin -p Epson_B-500DN -v socket://${1}:2501 -E -P /usr/share/cups/model/ekpxb500.ppd
fi
