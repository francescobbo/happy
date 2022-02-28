#!/bin/bash

cd tmp

rm -fr build-binutils
mkdir build-binutils

cd build-binutils

printf "${GREEN}Configuring binutils${NC}\n"

../binutils-${BINUTILS_VERSION}/configure \
    --target=$TARGET \
    --prefix="$PREFIX" \
    --with-sysroot \
    --disable-nls \
    --disable-werror || die "Failed"

printf "${GREEN}Building binutils${NC}\n"

make -j$(nproc)

printf "${GREEN}Installing x86_64-elf binutils in /opt/cross/${NC}\n"
sudo make install

cd ../..