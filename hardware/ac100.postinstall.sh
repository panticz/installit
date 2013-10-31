#!/bin/bash

# update packages
sudo apt-get update
sudo apt-get -y dist-upgrade

# configure german keyboard
sudo sed -i 's|XKBLAYOUT="us"|XKBLAYOUT="de"|g' /etc/default/keyboard



# disable unnececery services 
sudo update-rc.d -f avahi-daemon remove
sudo update-rc.d -f bluetooth remove

sudo mkdir /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/orca-autostart.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/vino-server.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/bluetooth-applet.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/bluetooth-applet-unity.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/jockey-gtk.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/deja-dup-monitor.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/onboard-autostart.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/user-dirs-update-gtk.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/ubuntuone-launch.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/update-notifier.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/gnome-user-share.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/telepathy-indicator.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/gwibber.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/gdu-notification-daemon.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/zeitgeist-datahub.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/pulseaudio-kde.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/print-applet.desktop /etc/xdg/autostart/disabled
sudo mv /etc/xdg/autostart/nautilus-autostart.desktop /etc/xdg/autostart/disabled


# remove unnecessary apps
sudo apt-get remove -y gnome-screensaver
sudo apt-get remove -y gnome-orca onboard
sudo apt-get remove -y brasero
sudo apt-get remove -y zeitgeist
sudo apt-get remove -y rhythmbox
sudo apt-get remove -y unity
sudo apt-get remove -y totem

# install extra apps
sudo apt-get install -y language-pack-de language-pack-gnome-de
sudo apt-get install -y thunderbird-locale-de thunderbird-locale-en hunspell-de-de hunspell-en-us
sudo apt-get install -y openvpn network-manager-openvpn
sudo apt-get install -y language-pack-de-base
sudo apt-get install -y sshfs vlc 




#
# ubuntu 12.04 (gnome)
#
# configure repository
cat <<EOF> /etc/apt/sources.list
deb http://ports.ubuntu.com/ubuntu-ports/ precise main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ precise-security main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports/ precise-updates main restricted universe multiverse
#deb http://ports.ubuntu.com/ubuntu-ports/ precise-proposed main restricted universe multiverse
EOF

# install gnome classic
wget http://installit.googlecode.com/hg/install.gnome-fallback.sh -O - | bash -

gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t boolean -s /apps/gnome-screensaver/idle_activation_enabled false
gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t boolean -s /apps/gnome-power-manager/lock_on_blank_screen false
gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t -s /apps/gnome-power-manager/lock_use_screensaver_settings false
#gsettings set org.gnome.desktop.lockdown disable-lock-screen 'true'
#gsettings set org.gnome.power-manager lock-use-screensaver 'false'

# configure nautilus (broken ?)
sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t string -s /apps/nautilus/preferences/default_folder_viewer 'list_view'
sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t string -s /apps/nautilus/list_view/default_zoom_level smallest
sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.defaults/ -t string -s /apps/nautilus/preferences/show_directory_item_counts never


#
# ubuntu 12.10 (lxdm)
#
# install nvidia driver
if [ $(lsb_release -rs | tr -d ".") -ge 1210 ]; then
    wget http://flie.no-ip.org:7080/ac100/deb/nvidia-tegra-ventana-codecs_16.0.0-0ubuntu1_armhf.deb
    wget https://launchpad.net/ubuntu/+source/nvidia-graphics-drivers-tegra/16.2.0-0ubuntu3/+build/3907865/+files/nvidia-tegra_16.2.0-0ubuntu3_armhf.deb
    sudo dpkg -i nvidia-tegra_16.2.0-0ubuntu3_armhf.deb nvidia-tegra-ventana-codecs_16.0.0-0ubuntu1_armhf.deb
fi

# clean up
sudo apt-get -y autoremove
sudo apt-get clean

echo "*** ac100 postinstall done, reboot in 30 sec ***"
sleep 30

sudo reboot


# todo
# autologin
# remove screen lock
# nvidia tegra graphic
#dpkg -i Downloads/nvidia-tegra_12~beta1-0ubuntu1_armel.deb
