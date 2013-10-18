#/bin/bash

# nvidia graphic driver
sudo apt-get install -y nvidia-current-updates

# configure driver
sudo nvidia-xconfig --no-logo --cool-bits=1

# TODO: options
#--registry-dwords="PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3"
