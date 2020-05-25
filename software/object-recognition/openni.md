# OpenNI

## OpenNI

* [Pandaboard](../../electronics/external-boards/pandaboard.md)
* [Beagleboard](../../electronics/external-boards/beagleboard.md)
* Desktop applications

| Details: |
| :--- |


* **Not VEX-supported**
* Object and motion detection
* Kinect video acquisition
* GPU/OpenCL support

**OpenNI** \(Open Natural Interaction Library\) is a library of programming functions mainly aimed at interacting with 3D input devices like the Microsoft Kinect, developed by PrimeSense. It is free for use under the open source Apache license. The library is cross-platform, and focuses mainly on interaction with "natural input" devices such as the human recognition features of the Kinect. Unlike [OpenCV](opencv.md), OpenNI does not have image processing capabilities and is mostly a framework for retrieving data and performing skeletal tracking.

While it is true that OpenNI 2 has been released at this point, they continue to support only the official Microsoft Kinect SDK. For the time being OpenNI 1.X will be the preferred SDK for use on Linux systems.

## Compatibility

OpenNI was designed to run on personal computers, but its algorithms perform acceptably on both ODROID-XU.

## Installation

These instructions assume a Debian-based Linux system.

1. Install all these packages:

```bash
lang=

sudo apt-get install build-essential gcc-multilib libusb-1.0.0-dev git-core doxygen graphviz openjdk-7-jdk freeglut3-dev
```

1. Create the folder kinect in a writable location, such as the user home directory.
2. Change to this folder and type:

```bash
lang=

git clone git://github.com/OpenNI/OpenNI.git
cd OpenNI
git checkout unstable
```

to get the latest version of OpenNI _\(this should not take too long\)_

1. Edit Platform/Linux/Build/Common/Platform.Arm and remove all instances of -mfloat-abi to switch to hard float mode
2. Execute:

```bash
lang=

cd Platform/Linux/CreateRedist
./RedistMaker.Arm
```

If it breaks on a "-j0" problem, change it to "-j4" inside Redist\_OpenNI.py

1. Install OpenNI \(the version number may change\):

```bash
lang=

cd ../Redist/OpenNI-Bin-Dev-Linux-Arm-v1.5.4.0
sudo ./install.sh
```

1. Get the Kinect drivers:

```bash
lang=

cd ../../../../
git clone git://github.com/avin2/SensorKinect.git
cd SensorKinect
```

1. Once again, get rid of the software floating point flags in Platform/Linux/Build/Common/Platform.arm by removing all instances of -mfloat-abi
2. Compile the Kinect drivers \(the version number may change\):

```bash
lang=

cd Platform/Linux/CreateRedist
./RedistMaker
cd ../Redist/Sensor-Bin-Linux-Arm-v5.1.2.1
```

1. Fix the USB drivers by editing Config/GlobalDefaultsKinect.ini and changing ;UsbInterface=2 to UsbInterface=1
2. Install the USB drivers:
3. Add yourself to the video group \(replace _username_ with your user name, **requires reboot** to take effect\):

```bash
lang=

sudo adduser username video
```

## Usage

Initially, OpenNI 1.0 showed great promise, as it efficiently retrieved depth and color images from an attached Kinect using the provided sample code. The nightmarish documentation, however, dissuaded development. OpenNI 2.0 seemed to be a great improvement with its better code structure, but the Kinect drivers were removed and placed in the separate [libfreenect driver](https://github.com/OpenKinect/libfreenect). These two pieces of code did not work well together, causing USB errors, missing depth images, and horrible problems with exposure control.

Ultimately, discontinuing the use of OpenNI altogether and switching to a C-only API with libfreenect directly worked much better. A library call could be used to disable automatic exposure, performance increased, and USB errors largely vanished.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

