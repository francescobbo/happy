#!/bin/bash

GCC_VERSION="11.2.0"
BINUTILS_VERSION="2.38"
MPFR_VERSION="4.1.0"
GMP_VERSION="6.2.1"
MPC_VERSION="1.2.1"
ISL_VERSION="0.24"

RED='\033[0;31m'
GREEN='\033[1;32m'
NC='\033[0m'

TARGET="x86_64-elf"
PREFIX="/opt/cross/$TARGET"

export PATH="$PATH:/opt/cross/$TARGET/bin"

function die {
    printf "${RED}$1${NC}\n"
    exit -1
}

printf "${GREEN}Detecting OS... ${NC}"

uname="$(uname -s)"
case `uname -s` in
    Linux*)
        if [ -f "/etc/debian_version" ]; then
            os=debian
        else
            os=other
        fi
        ;;
    Darwin*)
        os=mac
        ;;
    *)
        os=other
esac

echo $os
if [ "$os" == "other" ]; then
    die "Cannot continue on this OS"
fi

source ./cross-compiler/dependencies.$os.sh
source ./cross-compiler/download.sh
source ./cross-compiler/extract.sh
source ./cross-compiler/build-binutils.sh
source ./cross-compiler/build-gcc.sh
