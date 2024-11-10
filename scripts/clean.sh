#!/bin/sh

cd tx-toolchain/x86_64-efi
rm -rf binutils-2.43.tar.gz gcc-14.2.0.tar.gz
rm -rf binutils-2.43 gcc-14.2.0
rm -rf cross
rm -rf build-binutils build-gcc
cd ..

cd tx-toolchain/bochs-x86_64
rm -rf bochs-2.8.tar.gz
rm -rf bochs-2.8
cd ..
