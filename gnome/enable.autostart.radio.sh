#!/bin/bash

USER=$1
URL=$2

cat <<EOF> /home/${USER}/.radio.sh
#!/bin/bash

sleep 15
vlc --qt-start-minimized ${URL}
EOF

chown ${USER}.${USER} /home/${USER}/.radio.sh
chmod +x /home/${USER}/.radio.sh


# add to autostart
mkdir -p /home/${USER}/.config/autostart
chown ${USER}.${USER} /home/${USER}/.config -R

cat <<EOF>> /home/${USER}/.config/autostart/.radio.sh.desktop
[Desktop Entry]
Type=Application
Exec=/home/${USER}/.radio.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[de_DE]=/home/${USER}/.radio.sh
Name=/home/${USER}/.radio.sh
EOF

chown ${USER}.${USER} /home/${USER}/.config/autostart/.radio.sh.desktop

# FIXME: find vlc config file
chown ${USER}.${USER} /home/${USER} -R
