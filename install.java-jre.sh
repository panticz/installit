#!/bin/bash

# no JRE package available, use JDK package
wget -q --no-check-certificate https://raw.githubusercontent.com/panticz/installit/master/install.java-jdk.sh -O - | bash -
