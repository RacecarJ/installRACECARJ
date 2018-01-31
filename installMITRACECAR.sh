#!/bin/bash
# Install the MIT RACECAR software
# This is for L4T 28.1

# L4T 28.1 does not have a cdc-acm driver
./scripts/installCDCACM.sh
# Setup the UDEV rules for the ESC and IMU
./scripts/installRACECARUdev.sh
# Install ROS
./scripts/installROS.sh
# Then setup the Catkin Workpsace for the RACECAR
./scripts/setupCatkinWorkspace.sh racecar-ws
# One of the dependencies is missing, opencv3 for ros
sudo apt-get install ros-kinetic-opencv3 -y
# And now install the MIT RACECAR packages
./scripts/installMITRACECAR.sh racecar-ws
# Print out a little info at the end
./scripts/echoInfo.sh



