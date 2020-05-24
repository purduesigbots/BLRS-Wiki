# Midnight C

{% hint style="warning" %}
Note: Midnight C is no longer updated. Please check the PROS Docs at the top of the page for documentation on the most current version of PROS.
{% endhint %}

**Features -** 

* **Not** [**VEX-supported**](http://www.vexrobotics.com/)
* Native code compilation
* 32- and 64-bit types
* Partial multitasking
* Uses [Eclipse](https://phabricator.purduesigbots.com/w/cs/eclipse/) IDE
* Interrupt control
* Pointer and [register](https://phabricator.purduesigbots.com/w/wiki/cs/register_programming/) control
* [Purdue Robotics OS](https://phabricator.purduesigbots.com/w/wiki/cs/pros/)

The **Midnight C** platform, often referred to in the past as the **"Makefile"**, is a cross-platform method of compiling native C code for the [VEX Cortex](https://phabricator.purduesigbots.com/w/wiki/ee/cortex/). It supplanted [Robotc](https://phabricator.purduesigbots.com/w/wiki/cs/robotc/) during VEX Gateway as the primary language for programming the Cortex. Initial versions used the EasyC runtime library to interface with VEX parts, making it fully [Easyc](https://phabricator.purduesigbots.com/w/wiki/cs/easyc/) compatible; the development of the [Purdue Robotics OS](https://phabricator.purduesigbots.com/w/pros/) brought a more powerful API compatible with a variety of existing environments.

## Installation

Midnight C is compatible with Windows, Mac OS X, and Linux.

Firmware \(Mastercode\) reflashing for Midnight C is performed using the same procedure as [reflashing EasyC firmware](https://phabricator.purduesigbots.com/w/wiki/ee/cortex/).

## Features

* Uses the GNU GCC compiler [\(ref\)](http://gcc.gnu.org/) for ARM
* Can use any standard C syntax, library, data type, or function
* Powerful, high-speed library implementation surpasses I/O and interrupt performance of even the EasyC library
* Low-level access available to system registers, allowing the implementation of protocols such as [SPI](https://phabricator.purduesigbots.com/w/wiki/ee/spi/) or [I2C](https://phabricator.purduesigbots.com/w/wiki/ee/i2c/)
* Midnight-C IDE \(based on the [Eclipse IDE](https://phabricator.purduesigbots.com/w/wiki/cs/eclipse/)\) handles routine compilation and upload tasks
* [Vast improvements](https://phabricator.purduesigbots.com/w/wiki/cs/pros/) in size and speed

## Shortcomings

* Initial setup still needs work
* Not supported by VEX

## Object-oriented programming

**C++** support is also available; if a file is created with a .cpp extension, it will be compiled using arm-none-eabi-g++. The code used must have entry points from one of the built-in C files through a C++ function exposed via extern 'C' { ... }. Otherwise, any standard C++ construct or syntax can be used; the API header files have the appropriate declarations for use of the standard C functions. _**Beware of code size**_ - while using C++ itself imposes only a small penalty, any function in the C++ standard library \(e.g. new, std::\) will often add _50-100 KB_ to the hex file.

Please note that object-oriented principles tend to encourage practices such as dynamic memory allocation and excessive indirection which may conflict with the embedded system goals of speed and program size. When possible, use C code.

