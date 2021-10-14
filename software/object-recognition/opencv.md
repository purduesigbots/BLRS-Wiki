# OpenCV

## OpenCV

* [Pandaboard](../../electronics/general/external-boards/pandaboard.md)
* [Beagleboard](../../electronics/general/external-boards/beagleboard.md)
* Desktop applications

| Details: |
| -------- |

* **Not VEX-Supported**
* Image and video processing
* Object and motion detection
* 3/D object reconstruction
* Machine learning/clustering
* Stitching and photogrammetry
* GPU/OpenCL support
* Simplified GUI library

**OpenCV** (Open Source Computer Vision Library) is a library of programming functions mainly aimed at real time computer vision, developed by Intel and now supported by Willow Garage. It is free for use under the open source BSD license. The library is cross-platform, and focuses mainly on real-time image processing.

## History

Officially launched in 1999, the OpenCV project was initially an Intel Research initiative to advance CPU-intensive applications, part of a series of projects including real-time ray-tracing and 3D display walls. The main contributors to the project included a number of optimization experts in Intel Russia, as well as Intel’s Performance Library Team. In the early days of OpenCV, the goals of the project were described as:

* Advance vision research by providing not only open but also optimized code for basic vision infrastructure. No more reinventing the wheel.
* Disseminate vision knowledge by providing a common infrastructure that developers could build on, so that code would be more readily readable and transferable.
* Advance vision-based commercial applications by making portable, performance-optimized code available for free—with a license that did not require to be open or free themselves.

The first alpha version of OpenCV was released to the public at the IEEE Conference on Computer Vision and Pattern Recognition in 2000, and five betas were released between 2001 and 2005. The first 1.0 version was released in 2006. In mid-2008, OpenCV obtained corporate support from Willow Garage, and is now again under active development. A version 1.1 "pre-release" was released in October 2008.

The second major release of the OpenCV was in October 2009. OpenCV 2 includes major changes to the C++ interface, aiming at easier, more type-safe patterns, new functions, and better implementations for existing ones in terms of performance (especially on multi-core systems). Official releases now occur every 6 months\[1] and development is now done by an independent Russian team supported by commercial corporations.

## Compatibility

OpenCV was designed to run on personal computers; its optimized algorithms perform the best on NEON. Decent frame rates are possible, and performing the most intensive operations with a customized algorithm such as [AMS](ams.md) can easily increase performance. The [ODROID-XU](../../electronics/general/external-boards/odroid-xu.md) can run OpenCV at full speed without the issues with USB bandwidth that plagued data acquisition on other ARM platforms.

## Installation

These instructions assume a Debian-based Linux system.

1. Install all these packages:

```bash
lang=

sudo apt-get install build-essential cmake pkg-config libpng12-0 libpng12-dev libpng3 libpnglite-dev libgtk2.0-dev zlib1g-dbg zlib1g zlib1g-dev libjasper-dev libjasper-runtime libjasper1 pngtools libtiff4-dev libtiff4 libtiffxx0c2 libtiff-tools libjpeg-turbo8 libjpeg-turbo8-dev ffmpeg libavcodec-dev libavformat-dev libgstreamer0.10-0-dbg libgstreamer0.10-0 libgstreamer0.10-dev libxine1-ffmpeg libxine-dev libxine1-bin libunicap2 libunicap2-dev libdc1394-22-dev libdc1394-22 libdc1394-utils swig libv4l-0 libv4l-dev python-numpy
```

1. Create the folder openCV in a writable location, such as the user home directory.
2. Change to this folder and type:

```bash
lang=

wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.3.1/OpenCV-2.3.1.tar.bz2
tar -xvf OpenCV-2.3.1.tar.bz2
```

to get the recommended stable version of OpenCV _(this should not take too long)_

1. Open up the openCV folder and navigate to the directory that contains INSTALL and CMakeLists.txt, then type:

```bash
lang=

mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_PYTHON_SUPPORT=OFF -D BUILD_TESTS=OFF ..
```

1. Navigate into the release folder and compile OpenCV:

```bash
lang=

make -j2
sudo make install
```

1. Make the new library paths effective with:

```bash
lang=

sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig -v
```

1. Add yourself to the video group (replace _username_ with your user name, **requires reboot** to take effect):

```bash
lang=

sudo adduser username video
```

1. If you intend to use video from a camera, run

```bash
lang=

sudo apt-get install libv4l-dev libv4l-0 v4l-conf v4l-utils
```

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
