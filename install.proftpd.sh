#!/bin/bash

debconf-set-selections <<\EOF
proftpd-basic shared/proftpd/inetd_or_standalone select standalone
EOF

# install
apt-get install proftpd
# ServerType: standalone

# configure 
sed -i 's|# RequireValidShell|RequireValidShell|g' /etc/proftpd/proftpd.conf
sed -i 's|# DefaultRoot|DefaultRoot|g' /etc/proftpd/proftpd.conf
cat <<EOF>> /etc/proftpd/proftpd.conf
<Limit LOGIN>
    DenyGroup !ftpuser
</Limit>
EOF

# create ftpuser group
addgroup ftpuser

# restart
/etc/init.d/proftpd restart
