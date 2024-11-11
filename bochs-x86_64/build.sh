wget https://downloads.sourceforge.net/project/bochs/bochs/2.8/bochs-2.8.tar.gz
tar xzvf bochs-2.8.tar.gz

cd bochs-2.8

./configure --enable-smp \
  --enable-cpu-level=6 \
  --enable-all-optimizations \
  --enable-x86-64 \
  --enable-pci \
  --enable-vmx \
  --enable-debugger \
  --enable-disasm \
  --enable-debugger-gui \
  --enable-logging \
  --enable-fpu \
  --enable-3dnow \
  --enable-sb16=dummy \
  --enable-cdrom \
  --enable-x86-debugger \
  --enable-iodebug \
  --enable-avx \
  --enable-large-ramfile \
  --disable-plugins \
  --disable-docbook \
  --with-x --with-x11 --with-term --with-sdl2

make && make install
