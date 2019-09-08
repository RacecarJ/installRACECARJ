#!/bin/bash
# Download the Stereolabs SDK for the Jetson TX2 (JetPack 3.1 version, CUDA 8.0)
# Then run the installer
echo " "
echo "Downloading and installing the Stereolabs ZED SDK version 2.2.1"
echo "Installer will be placed in ~/ZED unless specified on command line"
echo " "
DEFAULTDIR=~/ZED
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR=~/"$CLDIR"
fi
mkdir -p "$DEFAULTDIR"
cd "$DEFAULTDIR"


wget https://stereolabs.sfo2.cdn.digitaloceanspaces.com/zedsdk/2.8/ZED_SDK_JP3.3_v2.8.3.run
chmod +x ZED_SDK_JP3.3_v2.8.3.run
./ZED_SDK_JP3.3_v2.8.3.run


