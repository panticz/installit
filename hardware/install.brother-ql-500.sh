#!/bin/bash

[ ! -d /usr/share/cups/model ] && mkdir /var/spool/lpd
[ ! -d /usr/share/cups/model ] && mkdir /usr/share/cups/model
#ln -s /etc/init.d/cups /etc/init.d/cupsys

# create outdated cupsys init script
cat <<EOF> /etc/init.d/cupsys
#!/bin/bash

/etc/init.d/cups \$@
EOF
chmod a+x /etc/init.d/cupsys

cat <<EOF> /var/lib/dpkg/info/ql570cupswrapper.list
./
./usr/
./usr/local/
./usr/local/Brother/
./usr/local/Brother/PTouch/
./usr/local/Brother/PTouch/ql570/
./usr/local/Brother/PTouch/ql570/cupswrapper/
./usr/local/Brother/PTouch/ql570/cupswrapper/cupswrapperql570pt1
./usr/local/Brother/PTouch/ql570/cupswrapper/brcupsconfpt1
EOF

mkdir -p /var/spool/lpd/ql570

wget http://pub.brother.com/pub/com/bsc/linux/dlf/ql570lpr-1.0.0-1.i386.deb -P /tmp
dpkg -i --force-all /tmp/ql570lpr-1.0.0-1.i386.deb

wget http://pub.brother.com/pub/com/bsc/linux/dlf/ql570cupswrapper-1.0.0-1.debian.i386.deb -P /tmp
dpkg -i --force-all /tmp/ql570cupswrapper-1.0.0-1.debian.i386.deb

# connect and power-on the printer

# delete default printer
lpadmin -x QL-570

# create new printer (example for QL-500)
lpadmin -p Brother_P-Touch -E -v usb://Brother/QL-500 -P /usr/share/cups/model/brql570.ppd
