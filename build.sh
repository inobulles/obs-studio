#!/bin/sh
set -e

build="build/"

# setup

if [ -d $build ]; then
	echo -n "Build directory ($build) already found. Are you sure you would like to remove it? "
	read _
fi

rm -rf $build
mkdir $build
cd $build

# compile

options="
	-DENABLE_PIPEWIRE:BOOL=OFF
	-DBUILD_BROWSER:BOOL=OFF
	-DBUILD_VST:BOOL=OFF
	-DENABLE_WAYLAND:BOOL=OFF
	-DENABLE_JACK:BOOL=OFF
	-DUNIX_STRUCTURE:BOOL=ON"

# cmake -GNinja .. $options
cmake .. $options

echo -n "Build environment setup. Would you like to start build? "
read _

numthreads=$(sysctl -n hw.ncpu)
# ninja -j$numthreads
make -j$numthreads

# package