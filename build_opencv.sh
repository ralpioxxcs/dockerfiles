#!/bin/bash
cmake -H. -BRelease \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DWITH_TBB=ON \
    -DWITH_QT=${WITH_QT} \
    -DWITH_V4L=ON

cd Release
realnum=`cat /proc/cpuinfo | grep cores | wc -l `
let bestnum=$realnum+$(printf %.0f `echo "$realnum*0.2"|bc`)
make -j${bestnum}
make install
