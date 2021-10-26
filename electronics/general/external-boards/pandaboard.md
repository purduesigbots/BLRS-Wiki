---
description: >-
  The PandaBoard is a low-power, open-source (ref) single-board computer based
  on the Texas Instruments OMAP4430 system on a chip.
---

# Pandaboard

![](https://phabricator.purduesigbots.com/file/data/3a6ppzzjxb5hcjzsof7t/PHID-FILE-gqs4l6fjjznsjnrcyvrp/pandaboard\_es\_omap4460.jpg)

| **Architecture:** 32-bit [Cortex-A9](http://www.arm.com/products/processors/cortex-a/cortex-a9.php/)                                                                                                        |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Processor:** [TI OMAP4430](http://www.ti.com/product/omap4430/) _(dual-core)_                                                                                                                             |
| **Languages:** C, C++, Many others                                                                                                                                                                          |
| **Clock:** 1 GHz                                                                                                                                                                                            |
| **Vcore:** 1.2 V                                                                                                                                                                                            |
| **Vio:** 3.3 V                                                                                                                                                                                              |
| **Power:** 5 W                                                                                                                                                                                              |
| **Flash:** SD/MMC Card                                                                                                                                                                                      |
| **RAM:** 1024 MB                                                                                                                                                                                            |
| **GPIO:** 20? _(none_ [_5 Volt Tolerant_](../5-volt-tolerant.md)_)_                                                                                                                                         |
| **Peripherals:** USB On-The-Go, 2x USB 2.0, 2x HDMI, 3.5mm audio out, [UART](https://github.com/purduesigbots/BLRS-Wiki/tree/3aeb8702c5b3a6c01813fc864764d2c87eb47766/w/wiki/ee/uart/README.md), JTAG debug |

The Pandaboard is a community supported development platform and is available for a somewhat subsidized cost of $174. A newer version, the PandaBoard ES, has been available for $182 since November 16, 2011 with the CPU and GPU on the OMAP4460 platform running at higher clock rates.

## Features

[![](https://phabricator.purduesigbots.com/file/data/ekqyy5ciw6h2wp4wedd5/PHID-FILE-dgtlep4zogo2gehfknzd/pandaboard\_ports.png)](https://phabricator.purduesigbots.com/file/data/ekqyy5ciw6h2wp4wedd5/PHID-FILE-dgtlep4zogo2gehfknzd/pandaboard\_ports.png)

The PandaBoard measures about 100 x 110 mm and features a dual-core 1 GHz CPU, a dedicated GPU, a DSP for audio and video processing, and 1 GB of RAM. It lacks a hard drive or solid-state drive, starting an operating system and primarily running from an SD/MMC card.

The board includes wired Ethernet as well as WiFi and Bluetooth connectivity. The board can output video signals via the two HDMI interfaces, and can also take input signals from one of the ports. It has two USB host ports and one USB On-The-Go port, supporting USB 2.0. Android and Ubuntu will operate on the board, without many of the [BeagleBoard's](beagleboard.md) unusual driver issues.

The GPIO connectors follow the standard Linux format, where one can export pins to userspace via the file system in /sys and control them using any programming language.

## Usage

[![](https://phabricator.purduesigbots.com/file/data/sqc64rm7l2tooprf4i3i/PHID-FILE-6hnmau75gozlbepdnsv5/pandaboard\_inuse.jpg)](https://phabricator.purduesigbots.com/file/data/sqc64rm7l2tooprf4i3i/PHID-FILE-6hnmau75gozlbepdnsv5/pandaboard\_inuse.jpg)

The **PandaBoard** in its protective shell as seen on Honey Badger

With the PandaBoard's low [Power Consumption](../power-consumption.md) and high performance, algorithms such as [OpenCV](../../../software/object-recognition/opencv.md) and [AMS](../../../software/object-recognition/ams.md) can be run at productive frame rates. The dual-core architecture lends itself better to performing multiple tasks than the BeagleBoard, even though the board is a bit larger. For [Object Recognition](../../../software/object-recognition/), it was used on Honey Badger and Coby (BLRS bots) during VEX Gateway.

The PandaBoard returned in VEX Sack Attack on Artemis as the frontend for another object recognition algorithm. As the dark green sacks were difficult to distinguish from the environment, the PandaBoard was assigned to hunt opposing teams' robots using their colored VEX flags. Acrylic cases with built-in cooling fans were installed to prevent CPU clocks from throttling due to excessive heat dissipation.

However, [ODROID-XU](odroid-xu.md). The PandaBoard has gained a second life for testing and as a new version of the Lab Status Monitor.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
