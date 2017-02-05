#!/bin/bash

. /etc/os-release
if [ "${ID_LIKE}" == "debian" ]; then
    sudo apt-get install docker-engine git wget
    sudo sed -i 's|ExecStart=/usr/bin/dockerd -H fd://|ExecStart=/usr/bin/dockerd -H fd:// --insecure-registry 172.30.0.0/16|g' /etc/systemd/system/multi-user.target.wants/docker.service
else
    yum install -y docker git wget
    sudo sed -i "s|# INSECURE_REGISTRY='--insecure-registry'|INSECURE_REGISTRY='--insecure-registry 172.30.0.0/16'|g" /etc/sysconfig/docker
fi

systemctl enable docker
systemctl start docker

wget https://github.com/openshift/origin/releases/download/v1.4.1/openshift-origin-client-tools-v1.4.1-3f9807a-linux-64bit.tar.gz -qO /tmp/openshift-origin-client-tools-linux-64bit.tar.gz 
tar xzf /tmp/openshift-origin-client-tools-linux-64bit.tar.gz -C /tmp/
cp /tmp/openshift-origin-client-tools-*/oc /usr/local/bin/

rm -rf /tmp/openshift-origin-client-tools*
