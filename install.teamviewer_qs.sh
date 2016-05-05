#!/bin/bash

wget -q http://download.teamviewer.com/download/teamviewer_qs.tar.gz -O /tmp/teamviewer_qs.tar.gz
sudo tar -C /opt/ -xzf /tmp/teamviewer_qs.tar.gz

cat << EOF | sudo tee -a "/usr/share/applications/teamviewerqs.desktop"
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=TeamViewer QS
Exec=/opt/teamviewerqs/teamviewer
Icon=/opt/teamviewerqs/tv_bin/desktop/teamviewer.png
Type=Application
Categories=Network;
EOF
