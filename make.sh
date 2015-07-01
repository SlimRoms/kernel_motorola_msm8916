#!/bin/bash

# Stupid shell script to compile kernel, nothing fancy

# Exports all the needed things Arch, SubArch and Cross Compile
export ARCH=arm
echo 'exporting Arch'
export SUBARCH=arm
echo 'exporting SubArch'
export CROSS_COMPILE=/home/prbassplayer/lp5.1/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.8/bin/arm-linux-androideabi-
echo 'exporting Cross Compile toolchain (Google's 4.8 arm-linux-androideabi-)'

# Make sure build is clean!
echo 'Cleaning build'
make clean

# Generates a new .config and exist
if [ "$1" = "config" ] ; then
    echo 'Making defconfig for moto_msm8916'
    make slim_surnia_defconfig
    exit
fi

# Lets go!
echo 'Lets start!'
make -j$1
