#!/bin/bash

cd tmp

rm -fr build-gcc
mkdir build-gcc

cd build-gcc

printf "${GREEN}Configuring gcc${NC}\n"

../gcc-${GCC_VERSION}/configure \
    --target=$TARGET \
    --prefix="$PREFIX" \
    --disable-nls \
    --enable-languages=c,c++ \
    --without-headers || die "Failed"

printf "${GREEN}Building gcc${NC}\n"

make -j$(nproc) all-gcc
make -j$(nproc) all-target-libgcc

printf "${GREEN}Installing x86_64-elf gcc in /opt/cross/${NC}\n"
sudo make install-gcc
sudo make install-target-libgcc

cd ../..