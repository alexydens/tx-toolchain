#!/bin/sh

wget https://ftp.gnu.org/gnu/binutils/binutils-2.43.tar.gz
wget https://ftp.gnu.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.gz

tar -xvf binutils-2.43.tar.gz
tar -xvf gcc-14.2.0.tar.gz

mkdir cross
export PREFIX="$PWD/cross"
export TARGET="x86_64-elf"
export PATH="$PREFIX/bin:$PATH"

mkdir build-binutils
mkdir build-gcc

cd build-binutils
../binutils-2.43/configure \
  --target=$TARGET \
  --prefix="$PREFIX" \
  --with-sysroot \
  --disable-nls \
  --disable-werror
make -j4
make install
cd ..

cd build-gcc
which -- $TARGET-as || echo $TARGET-as not found in PATH
printf "MULTILIB_OPTIONS += mno-red-zone\nMULTILIB_DIRNAMES += no-red-zone\n" >> ../gcc-14.2.0/gcc/config/i386/t-x86_64-elf
cp ../config.gcc ../gcc-14.2.0/gcc/
../gcc-14.2.0/configure \
  --target=$TARGET \
  --prefix="$PREFIX" \
  --disable-nls \
  --enable-languages=c,c++ \
  --without-headers
make -j4 all-gcc
make -j4 all-target-libgcc
make install-gcc
make install-target-libgcc
cd ..
