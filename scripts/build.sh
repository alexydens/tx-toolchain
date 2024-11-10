#!/bin/sh

cd tx-toolchain/x86_64-elf/
sh build.sh
cd ../..

cd tx-toolchain/bochs-x86_64/
sh build.sh
cd ../..
