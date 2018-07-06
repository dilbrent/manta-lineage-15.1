#!/bin/sh

# Colorize and add text parameters
red=$(tput setaf 1) # red
grn=$(tput setaf 2) # green
cya=$(tput setaf 6) # cyan
txtbld=$(tput bold) # Bold
bldred=${txtbld}$(tput setaf 1) # red
bldgrn=${txtbld}$(tput setaf 2) # green
bldblu=${txtbld}$(tput setaf 4) # blue
bldcya=${txtbld}$(tput setaf 6) # cyan
txtrst=$(tput sgr0) # Reset

export KERNELDIR=`readlink -f .`;
export PARENT_DIR=`readlink -f ..`;
export ANY_KERNEL=/home/khaon/android/kernel/AnyKernel2;
export ARCH=arm;
export CCACHE_DIR=/home/khaon/.ccache/kernels;
export PACKAGEDIR=/home/khaon/android/Packages/kernels;
export CROSS_COMPILE="ccache /home/khaon/android/toolchains/linaro-4.7.4/bin/arm-cortex_a15-linux-gnueabihf-";
export MKBOOTIMG=/home/khaon/android/kernel/mkbootimg_tools/mkboot;
export MKBOOTIMG_TOOLTS_ZIMAGE_MANTA_FOLDER=/home/khaon/android/kernel/mkbootimg_tools/manta_temasek;
echo "${txtbld} Remove old zImage ${txtrst}";

# Clean Package directory and switch to khaon-new branch
make mrproper;
mkdir -p $PACKAGEDIR;
mv -f $PACKAGEDIR/* $PACKAGEDIR/old_releases;

echo "${bldblu} Make the kernel ${txtrst}";
make khaon_manta_defconfig;
make -j24;

if [ -e $KERNELDIR/arch/arm/boot/zImage ]; then

	echo " ${bldgrn} Kernel built !! ${txtrst}";

	export curdate=`date "+%m-%d-%Y"`;
	echo "${txtbld} Make AnyKernel flashable archive ${txtrst} "
	echo "";
 
    cd $PACKAGEDIR;
	rm UPDATE-AnyKernel2-khaon-kernel-manta-marshmallow-*.zip;
	cd $ANY_KERNEL;
	cp $KERNELDIR/arch/arm/boot/zImage zImage;
	zip -r9 $PACKAGEDIR/UPDATE-AnyKernel2-khaon-kernel-manta-"${curdate}".zip * -x README UPDATE-AnyKernel2.zip .git *~;
	cd $KERNELDIR;
else
	echo "KERNEL DID NOT BUILD! no zImage exist"
fi;
