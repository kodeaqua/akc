#!/bin/bash
export ANDROID=$HOME/android
export ANY_KERNEL=$ANDROID/AnyKernel3
export ARCH="arm64"
export SUBARCH=$ARCH
export KERNEL_DIR=$(pwd)
export KERNEL_IMAGE=$KERNEL_DIR/arch/$ARCH/boot/Image*
export KBUILD_BUILD_USER=$USER
export KBUILD_BUILD_HOST=$(cat /etc/hostname)
export CROSS_COMPILE=$ANDROID/gcc/bin/aarch64-linux-android-
export USE_CCACHE=1
make clean && make mrproper
make -j$(nproc --all)

if [ -f $KERNEL_IMAGE ]
	then
    	echo "Kernel berhasil di-compile"
        mv $KERNEL_IMAGE $ANY_KERNEL
        cd $ANYKERNEL && 7z a $ANYKERNEL/Kernel.zip $ANYKERNEL
    else
    	echo "Kernel gagal di-compile"
 fi
