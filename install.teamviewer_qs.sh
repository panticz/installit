#!/bin/bash

# create teamviewerqs starter
cat << EOF | sudo tee -a /usr/sbin/teamviewerqs
#!/bin/bash

wget -q http://download.teamviewer.com/download/teamviewer_qs.tar.gz -O - | tar -C /tmp/ -xz
/tmp/teamviewerqs/teamviewer
EOF
sudo chmod a+x /usr/sbin/teamviewerqs

# download icon
wget -q http://www.icons101.com/icon_svg/id_54184/teamviewer.svg -O /tmp/teamviewer.svg
sudo cp /tmp/teamviewer.svg /usr/share/icons/teamviewer.svg

# create starter
cat << EOF | sudo tee -a "/usr/share/applications/teamviewerqs.desktop"
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=TeamViewer QS
Exec=/usr/sbin/teamviewerqs
Icon=/usr/share/icons/teamviewer.svg
Type=Application
Categories=Network;
EOF
