#!/bin/bash
cmake -H. -BRelease
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DWITH_TBB=ON \
    -DWITH_QT=ON \
    -DWITH_V4L=ON
make -j4
make install
