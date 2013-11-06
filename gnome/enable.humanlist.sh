#!/bin/bash

cat <<EOF>> /etc/gdm/gdm.conf-custom
[greeter]
GraphicalTheme=HumanList
EOF
