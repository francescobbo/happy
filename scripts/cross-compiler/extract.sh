#!/bin/bash

cd tmp

printf "${GREEN}Extracting source packages${NC}\n"

tar xf binutils.tar.gz
tar xf gcc.tar.gz

cd gcc-${GCC_VERSION}
tar xf ../gmp.tar.bz2
tar xf ../isl.tar.bz2
tar xf ../mpc.tar.gz
tar xf ../mpfr.tar.gz

mv gmp-* gmp
mv isl-* isl
mv mpc-* mpc
mv mpfr-* mpfr

cd ../..