#!/bin/sh
# zlib-1.2.8.sh by Dan Peori (danpeori@oopo.net)

## Download the source code.
wget --continue http://zlib.net/fossils/zlib-1.2.8.tar.gz || { exit 1; }

## Unpack the source code.
rm -Rf zlib-1.2.8 && tar xfvz zlib-1.2.8.tar.gz && cd zlib-1.2.8 || { exit 1; }

## Patch the source code.
cat ../../patches/zlib-1.2.8-PPU.patch | patch -p1 || { exit 1; }

## Configure the build.
AR="ppu-ar" CC="ppu-gcc" RANLIB="ppu-ranlib" ./configure --prefix="$PS3DEV/host/ppu" --static || { exit 1; }

## Compile and install.
make -j4 && make install || { exit 1; }
