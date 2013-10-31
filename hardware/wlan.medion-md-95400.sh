#!/bin/bash

# Links
# http://wiki.ubuntuusers.de/Acer_Hotkeys

# NEW

# download source
apt-get install -y acerhk-source linux-headers-generic

# extract
cd /usr/src
sudo tar -xjf acerhk.tar.bz2

# patch
sed -i '561s|KBUILD_CFLAGS|#KBUILD_CFLAGS|g' /usr/src/linux-headers-2.6.32-24-generic/Makefile

# compile and install
cd /usr/src/modules/acerhk
make install



echo "acerhk force_series=95400 autowlan=1" > /etc/modprobe.d/acerhk.conf

echo "options radeon modeset=1 dynpm=1 dynclks=1" > /etc/modprobe.d/radeon.conf

sudo update-initramfs -u



# OLD

# fix audio
echo "acerhk force_series=95400 autowlan=1" >> /etc/modules

# fix wlan
cat <<EOF> /etc/init.d/wirelessled
#!/bin/sh -e
echo 1 > /proc/driver/acerhk/wirelessled
exit 0
EOF
 
chmod 755 /etc/init.d/wirelessled
 
update-rc.d wirelessled defaults 90
