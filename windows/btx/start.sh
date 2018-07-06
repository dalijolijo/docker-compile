#!/bin/bash

cd /usr/src
git clone https://github.com/LIMXTEC/BitCore.git
cd BitCore
cd depends
make GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CXX_FOR_TARGET=i686-w64-mingw32-g++ CC_FOR_TARGET=i686-w64-mingw32-gcc
cd ..
./autogen.sh
CONFIG_SITE=$PWD/depends/i686-w64-mingw32/share/config.site ./configure --prefix=/
make
mkdir /usr/src/result
make install DESTDIR=/usr/src/result
