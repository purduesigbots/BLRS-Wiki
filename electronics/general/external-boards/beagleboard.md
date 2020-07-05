---
description: >-
  The BeagleBoard was designed as an educational board with open source software
  development in mind. It has gained popularity in colleges around the world.
---

# Beagleboard

{% hint style="warning" %}
This document is slightly out of date as Beagleboard has launched new products which can be seen [here](https://beagleboard.org/boards).
{% endhint %}

![](https://phabricator.purduesigbots.com/file/data/f5tgcragbcdyp7xa7k3z/PHID-FILE-p6bj57joskwfjd5gegjb/beagle_board_big.jpg)

| **Architecture"** 32-bit [Cortex-A8](http://www.arm.com/products/processors/cortex-a/cortex-a8.php/) |
| :--- |
| **Processor:** [TI OMAP3530](http://www.ti.com/product/omap3530/), TMS320C64x DSP, PowerVR SGX GPU |
| **Languages:** C, C++, Many others |
| **Clock:** 720 MHz |
| **Vcore:** 1.8 V |
| **Vio:** 3.3 V |
| **Power:** 2 W |
| **Flash:** 256MB NAND, SD/MMC Card |
| **RAM:** 256 MB |
| **GPIO:** 20? _\(none_ [_5 Volt Tolerant_](../5-volt-tolerant.md)_\)_ |
| **Peripherals:** USB On-The-Go, USB 2.0, HDMI, 3.5mm audio in/out, [UART](../uart.md) |

### Features

The BeagleBoard measures approximately 7.5 by 7.5 cm and has all the functionality of a basic computer, including an ARM Cortex-A8 CPU, a DSP for accelerated video and audio decoding, and a GPU to provide accelerated 2D and 3D rendering at up to 720p that supports OpenGL ES 2.0. Its design is [available](http://beagleboard.org/hardware/design) under the Creative Commons Share-Alike license.

Android, Angstrom Linux, Arch Linux, Ubuntu, Windows CE, and others have been shown to be usable on the BeagleBoard. An OS can be booted from the Flash memory, the SD card, or the serial connection.

Video output is provided on an HDMI connection. An SD/MMC card slot, a USB port, an RS-232 serial connection, and two stereo headphone jacks for audio input and output are provided. Built-in storage and memory include 256 MB of Flash memory and 256 MB of RAM \(128 MB on earlier models\). The board uses up to 2 W of power and can be powered from the USB connector or a separate 5 V power supply; no additional cooling or heat sinks are usually required.

[![](https://phabricator.purduesigbots.com/file/data/5nmjal24dmluiawbjkod/PHID-FILE-csfsjup2vo6jwawz37dp/beagleboard_described.jpg)](https://phabricator.purduesigbots.com/file/data/5nmjal24dmluiawbjkod/PHID-FILE-csfsjup2vo6jwawz37dp/beagleboard_described.jpg)

## BeagleBoard-xM

[![](https://phabricator.purduesigbots.com/file/data/qyqxcwi6amgd3ujgycy7/PHID-FILE-ywjlyg44gbfzjkwmyixf/beagleboard_xm_rev_b_3.jpg)](https://phabricator.purduesigbots.com/file/data/qyqxcwi6amgd3ujgycy7/PHID-FILE-ywjlyg44gbfzjkwmyixf/beagleboard_xm_rev_b_3.jpg)

| **Architecture"** 32-bit [Cortex-A8](http://www.arm.com/products/processors/cortex-a/cortex-a8.php/) |
| :--- |
| **Processor:** [TI DM3730](http://www.ti.com/product/dm3730/), TMS320C64x DSP, PowerVR SGX GPU |
| **Languages:** C, C++, Many others |
| **Clock:** 1 GHz |
| **Vcore:** 1.8 V |
| **Vio:** 3.3 V |
| **Power:** 2 W |
| **Flash:** SD/MMC Card |
| **RAM:** 512 MB |
| **GPIO:** 20? _\(none_ [_5 Volt Tolerant_](../5-volt-tolerant.md)_\)_ |
| **Peripherals:** USB On-The-Go, 4x USB 2.0, HDMI, 3.5mm audio in/out, [UART](../uart.md) |

### Features

A modified version of the BeagleBoard called the **BeagleBoard-xM** started shipping on August 27, 2010. The BeagleBoard-xM is slightly larger at 8.26 by 8.26 cm and has a faster CPU core, more RAM, an onboard Ethernet jack, and a 4 port USB hub. The BeagleBoard-xM lacks onboard Flash and requires the OS to be stored on a microSD card.

An S-Video port complements the HDMI/DVI-D port and theoretically allows the addition of a second display. A camera port on the xM provides a simple way of importing video via Leopard Board cameras, but such functionality is hardly useful in practice.

## Useful Links

* [BeagleBoard for Beginners](http://elinux.org/BeagleBoardBeginners)
* [BeagleBoard Service Reference Manual](http://beagleboard.org/static/BBxMSRM_latest.pdf)

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

