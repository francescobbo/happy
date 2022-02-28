#!/bin/bash

printf "${GREEN}Checking dependencies for Debian system...${NC}"

deps=("build-essential" "bison" "flex" "texinfo")
missing=()

for d in ${deps[@]}; do
    dpkg -S $d &>/dev/null || missing+=($d)
done

if [ ${#missing[@]} == "0" ]; then
    echo " all installed"
else
    echo " missing ${missing} packages"
    printf "${GREEN}Installing ${missing}..."
    sudo apt-get install -y $missing || die "Could not install dependencies"
fi