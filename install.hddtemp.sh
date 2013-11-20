#/bin/bash

debconf-set-selections <<\EOF
hddtemp hddtemp/daemon select false
EOF

apt-get install -y hddtemp
