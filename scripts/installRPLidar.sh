#!/bin/bash
# install rplidar-ros package
# Uses 1.9 
# Usage installRPLidar.sh <dirName>
# dirName defaults to racecar-ws

WHEREAMI=$PWD
source /opt/ros/kinetic/setup.bash
source jetsonUtilities/jetson_variables

DEFAULTDIR=~/racecar-ws
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR=~/"$CLDIR"
fi
if [ -e "$DEFAULTDIR" ] ; then
  echo "$DEFAULTDIR already exists; no action taken"
  echo "Placing RACECAR code into $DEFAULTDIR" 
else 
  echo "$DEFAULTDIR does not exist; no action taken."
  echo "This script only uses an existing initialized Catkin Workspace for the RACECAR code."
  exit 1
fi
cd "$DEFAULTDIR"

cd src
git clone https://github.com/RacecarJ/rplidar_ros.git
cd rplidar_ros
# Version 1.9; No tagged release
git checkout 36684a01dcee58ada142b9199c04158b1439a84e
cd "$DEFAULTDIR"
cp "$WHEREAMI"/data/rplidar/sensors.launch.xml "$DEFAULTDIR"/src/racecar/racecar/launch/includes/common/sensors.launch.xml

catkin_make
