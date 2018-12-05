#!/bin/bash
# Setup the github/mit-racecar/ ROS structure
# Usage installBaseRACECAR.sh <dirName>
# dirName defaults to racecar-ws
# Fetches RACECAR ROS components, installs dependencies, and then catkin_make the workspace

WHEREAMI=$PWD
source /opt/ros/kinetic/setup.bash
source jetsonUtilities/jetson_variables
# Is this the matching release?
L4TVERSION=28.2.1

echo "L4TVERSION: $L4TVERSION"
echo "Running: $JETSON_L4T"


if [ ! $JETSON_L4T == $L4TVERSION ] ; then
  echo "This Jetson is running $JETSON_L4T."
  echo "This installer is for version: $L4TVERSION."
  echo "Please check tags/releases for a corresponding installer."
  echo "Installation terminated"
fi

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

# Read in the base racecar rosinstall file; No ZED
wstool init src  "$WHEREAMI"/baseRacecar.rosinstall
# The IMU is the only default sensor for now ...
cp "$WHEREAMI"/data/sensors.launch.xml "$DEFAULTDIR"/src/racecar/racecar/launch/includes/common/sensors.launch.xml
# Package without the urg_node from the Hokuyo
cp "$WHEREAMI"/data/package.xml "$DEFAULTDIR"/src/racecar/racecar/package.xml
cp "$WHEREAMI"/data/CMakeLists.txt "$DEFAULTDIR"/src/racecar/racecar/CMakeLists.txt

# Install prerequisite packages
echo "Installing prerequisites"
source devel/setup.bash
# Install the rosdeps -a = all -y = no questions -r = skip errors (for openCV in ZED_Wrapper)
rosdep install -a -y -r
# jstest-gtk is added for testing the joystick
sudo apt-get -y install \
    jstest-gtk 

echo "Catkin Make"
# On the Jetson, there's currently an issue with using the dynamic runtime
# Typically this reports as "cannot find -lopencv_dep_cudart" in the error log
catkin_make config --cmake-args -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF
catkin_make

