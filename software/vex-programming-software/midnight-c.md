---
description: >-
  The Midnight C platform, often referred to in the past as the "Makefile", is a
  cross-platform method of compiling native C code for the VEX Cortex.
---

# Midnight C

{% hint style="danger" %}
Midnight C is for the older VEX Cortex which is no longer supported
{% endhint %}

**Features -**

* **Not VEX-Supported**
* Native code compilation
* 32- and 64-bit types
* Partial multitasking
* Uses [Eclipse](https://www.eclipse.org) IDE
* Interrupt control
* Pointer and [register](../general/register-programming.md) control
* Purdue Robotics OS

The **Midnight C** platform, often referred to in the past as the **"Makefile"**, is a cross-platform method of compiling native C code for the [VEX Cortex](../../vex-electronics/legacy/vex-cortex.md). It supplanted [Robotc](robotc.md) during VEX Gateway as the primary language for programming the Cortex. Initial versions used the EasyC runtime library to interface with VEX parts, making it fully [EasyC](easyc.md) compatible; the development of the Purdue Robotics OS brought a more powerful API compatible with a variety of existing environments.

## Installation

Midnight C is compatible with Windows, Mac OS X, and Linux.

Firmware (Mastercode) reflashing for Midnight C is performed using the same procedure as reflashing EasyC firmware.

## Features

* Uses the GNU GCC compiler for ARM
* Can use any standard C syntax, library, data type, or function
* Powerful, high-speed library implementation surpasses I/O and interrupt performance of even the EasyC library
* Low-level access available to system registers, allowing the implementation of protocols such as [SPI](../../electronics/general/spi.md) or [I2C](../../electronics/general/i2c.md)
* Midnight-C IDE (based on the Eclipse IDE) handles routine compilation and upload tasks
* Vast improvements in size and speed

## Shortcomings

* Initial setup still needs work
* Not supported by VEX

## Object-oriented programming

**C++** support is also available; if a file is created with a .cpp extension, it will be compiled using arm-none-eabi-g++. The code used must have entry points from one of the built-in C files through a C++ function exposed via extern 'C' { ... }. Otherwise, any standard C++ construct or syntax can be used; the API header files have the appropriate declarations for use of the standard C functions. _**Beware of code size**_ - while using C++ itself imposes only a small penalty, any function in the C++ standard library (e.g. new, std::) will often add _50-100 KB_ to the hex file.

Please note that object-oriented principles tend to encourage practices such as dynamic memory allocation and excessive indirection which may conflict with the embedded system goals of speed and program size. When possible, use C code.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
