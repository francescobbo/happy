#!/bin/bash

mkdir -p tmp

printf "${GREEN}Downloading binutils ${BINUTILS_VERSION}${NC}\n"
curl -o tmp/binutils.tar.gz -C - https://ftp.gnu.org/gnu/binutils/binutils-${BINUTILS_VERSION}.tar.gz
printf "${GREEN}Downloading gcc ${GCC_VERSION}${NC}\n"
curl -o tmp/gcc.tar.gz -C - https://ftp.gnu.org/gnu/gcc/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.gz
printf "${GREEN}Downloading libgmp ${GCC_VERSION}${NC}\n"
curl -o tmp/gmp.tar.bz2 -C - https://ftp.gnu.org/gnu/gmp/gmp-${GMP_VERSION}.tar.bz2
printf "${GREEN}Downloading libisl ${GCC_VERSION}${NC}\n"
curl -o tmp/isl.tar.bz2 -C - https://gcc.gnu.org/pub/gcc/infrastructure/isl-${ISL_VERSION}.tar.bz2
printf "${GREEN}Downloading libmpc ${GCC_VERSION}${NC}\n"
curl -o tmp/mpc.tar.gz -C - https://ftp.gnu.org/gnu/mpc/mpc-${MPC_VERSION}.tar.gz
printf "${GREEN}Downloading libmpfr ${GCC_VERSION}${NC}\n"
curl -o tmp/mpfr.tar.gz -C - https://ftp.gnu.org/gnu/mpfr/mpfr-${MPFR_VERSION}.tar.gz
