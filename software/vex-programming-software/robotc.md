---
description: >-
  RobotC is an interpreted C-like programming language available for the VEX PIC
  and VEX Cortex.
---

# RobotC

{% hint style="danger" %}
Robot C is for the older VEX Cortex which is no longer supported.
{% endhint %}

## Details:

* VEX-Supported
* Bytecode interpreted
* Preemptive multitasking
* Proprietary libraries
* Works out-of-box, built-in IDE
* **Superseded by** [**Midnight C**](midnight-c.md)

**RobotC** is an _interpreted_ C-like programming language available for the VEX PIC and [VEX Cortex](../../electronics/vex/legacy/vex-cortex.md). It offers real-time debugging and a relatively simple set of internal libraries mostly based on the use of \(real or virtual\) arrays.

### Features

* Built-in debugger allows pausing and resuming user code and real-time monitoring of variables
* IDE integrates firmware updates, code authoring, compilation, and flashing into one program
* Primitive multi-tasking built in
* Support available on website and from VEX
* Simple and easy to learn, no need for users to interest themselves with technical details

### Shortcomings

* Interpreter emulates an 8-bit processor, substantially slowing user code and preventing any numerically intensive algorithms from being useful
* Library abstracts many details and prevents advanced access or fine-tuning [VEX sensors](../../electronics/vex/vex-sensors/)
* Neither free nor open-source, and only works on Windows
* Lack of support for objects, dynamic allocation, wide integers, or interrupts severely limits code capabilities
* Array-like syntax can be confusing and is rife with opportunities for indexes out of bounds or overflow
* Optimizer is poor and IDE is generally low-quality, with a fixed code style and terrible code completion

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

