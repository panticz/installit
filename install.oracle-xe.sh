#!/bin/bash

# install required applications
apt-get install -y wget apt-transport-https bc

# add oracle repository
wget http://oss.oracle.com/el4/RPM-GPG-KEY-oracle -O- | apt-key add -
echo "deb https://oss.oracle.com/debian unstable main non-free" > /etc/apt/sources.list.d/oracle.list
 
# update repository
apt-get update

# configure kernel parameter
sysctl -w kernel.shmmax=4294967295
sysctl -w kernel.shmall=2097152
 
# install oracle
apt-get install -y --force-yes oracle-xe

# configure profile
cat <<EOF> /etc/profile.d/oracle.sh
#!/bin/bash

export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
#export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export PATH=\$PATH:\$ORACLE_HOME/bin
EOF

chmod a+x /etc/profile.d/oracle.sh
