# installRACECARJ
<em>January, 2018</em>

Scripts in this repository will install ROS and the MIT RACECAR packages on a NVIDIA Jetson Development Kit.

This version is for L4T 28.1
The scripts assume that the Jetson has been freshly flashed with L4T 28.1 using JetPack 3.1.
JetPack must also install:
<ul>
<li>CUDA 8.0</li>
<li>cuDNN 6.0</li>
<li>OpenCV4Tegra 2.4.13</li>
</ul>

<h2>MIT RACECAR Configuration Installation</h2>

The MIT RACECAR supported here is version 2.5. The hardware configuration includes a Stereolabs ZED camera and Hokuyo UST-10LX scanning range finder. 

The file installMITRACECAR.sh will install the MIT RACECAR software. Before running installMITRACECAR.sh, the Stereolabs ZED camera driver must be installed. The ZED camera driver is available at: https://www.stereolabs.com/developers/

Note that this repository is in development, and is subject to change soon.

The installation script:

$ ./installMITRACECAR.sh racecar-ws

Does the following:

<ul>
<li>L4T 28.1 does not have a cdc-acm driver. The script installs a pre-built cdc-acm driver. <em>The driver expects a stock kernel (4.4.38-tegra)</em></li>
<li>Because the electronic speed controller and the IMU both report as ttyACM, a udev rule is installed which names them as vesc and imu respectively.</li>
<li>ROS is configured and rosbase is installed</li>
<li>One of the dependencies is missing in the package specifications, so ros-kinetic-opencv3 is installed.</li>
<li>The MIT RACECAR packages are installed.</li>
</ul> 

### Note
The ROS environment variables ROS_MASTER_URI and ROS_IP are initialized in the file ~/.bashrc

You will need to modify these environment variables to match your needs and network layout.

### Release Notes
January 2018
Initial Release
* L4T 28.1 (JetPack 3.1)
* CUDA 8.0
* cuDNN 6.0.12
* OpenCV4Tegra 2.4.13


## License
MIT License

Copyright (c) 2017 Jetsonhacks

Copyright (c) 2018 Kangalow LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


