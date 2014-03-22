#!/bin/bash

URL=http://registrationcenter.intel.com/irc_nas/3914/l_lpk_p_11.1.2.005.tgz

# download
wget ${URL} -O /tmp/l_lpk.tgz

# extract
tar -xzf /tmp/l_lpk.tgz -C /tmp/

# copy linpack to /usr/share directory
cp -a /tmp/linpack_11.1.2/benchmarks/linpack/ /usr/share/

# create soft links to executables
ln -sf /usr/share/linpack/runme_xeon64 /usr/sbin/
ln -sf /usr/share/linpack/xlinpack_xeon64 /usr/sbin/

# adjust path in runme_xeon64
sed -i s'|./xlinpack_$arch lininput_$arch|/usr/sbin/xlinpack_$arch /usr/share/linpack/lininput_$arch|g' /usr/sbin/runme_xeon64
