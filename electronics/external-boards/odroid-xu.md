---
description: >-
  The ODROID-XU is a low-power single-board computer based on the Samsung Exynos
  5 Octa system on a chip.
---

# ODROID-XU

[![](https://phabricator.purduesigbots.com/file/data/wq3qd7bzvomweuord2j7/PHID-FILE-ugin4mlcjor6byhfwdcc/processor_odroidxu.jpg)](https://phabricator.purduesigbots.com/file/data/wq3qd7bzvomweuord2j7/PHID-FILE-ugin4mlcjor6byhfwdcc/processor_odroidxu.jpg)

| **Architecture:** 32-bit [Cortex-A15](http://www.arm.com/products/processors/cortex-a/cortex-a15.php/) |
| :--- |
| **Processor:** [Exynos 5 Octa](http://www.samsung.com/global/business/semiconductor/minisite/Exynos/products5octa.html/) _\(quad-core\)_ |
| **Languages:** C, C++, Many others |
| **Clock:** 1.6 GHz |
| **Vcore:** 1.2 V |
| **Vio:**1.8 V |
| **Power:** 7 W |
| **Flash:** MicroSD Card |
| **RAM:** 2048 MB |
| **GPIO:** 10? _\(none_ [_5 Volt Tolerant_](/w/wiki/ee/5_volt_tolerant/)_\)_ |
| **Peripherals:** 2x USB 3.0, 4x USB 2.0, Mini-HDMI, DisplayPort, 3.5mm audio out, Ethernet, [UART](/w/wiki/ee/uart/) |

The ODROID-XU is the first development board for the ARM Cortex-A15 platform available for sale, featuring the big.LITTLE architecture [\(ref\)](http://www.arm.com/products/processors/technologies/biglittleprocessing.php) which allows an outstanding standby power usage of less than 3 W, yet unprecedented quad-core Cortex-A15 power on demand at a unit cost of only $170 before shipping.

## Features

[![](https://phabricator.purduesigbots.com/file/data/gg75v57orkupbru5zg7s/PHID-FILE-dmmfjwsqa3zwnpfznzre/processor_odroidxu_ports.jpg)](https://phabricator.purduesigbots.com/file/data/gg75v57orkupbru5zg7s/PHID-FILE-dmmfjwsqa3zwnpfznzre/processor_odroidxu_ports.jpg)

 A diagram of the **ODROID-XU** with all ports labelled

The ODROID-XU is smaller than many competing platforms at about 95 x 70 mm [\(ref\)](http://www.hardkernel.com/renewal_2011/products/prdt_info.php?g_code=G137510300620&tab_idx=2) and comes with its own protective plastic case. At low speeds, four ARM Cortex-A7 cores at 1.2 GHz handle system tasks with a low power consumption of under 3 W; when these cores surpass a predefined CPU usage threshold, four ARM Cortex-A15 cores transparently take over at runtime to boost performance. A small variable speed cooling fan operates whenever the Cortex-A15 cores switch on, which can be quite noisy at high loads. The ODROID-XU lacks a hard drive but can be equipped with either a microSD card [\(ref\)](http://www.amazon.com/SanDisk-Ultra-Class-Memory-SDSDU-016G-U46/dp/B007BJHETS/ref=sr_1_4/187-6017561-5043339?ie=UTF8&qid=1382319410&sr=8-4&keywords=sandisk+ultra) or a much faster eMMC module [\(ref\)](http://www.hardkernel.com/renewal_2011/products/prdt_info.php?g_code=G137454882497).

Unlike competing platforms such as the [BeagleBoard](/w/wiki/ee/beagleboard/) and [PandaBoard](/w/wiki/ee/pandaboard/), the ODROID-XU ships with a mostly ready-to-run version of Ubuntu [\(ref\)](http://forum.odroid.com/viewforum.php?f=61&sid=a7e701b4e15d534864cff67192073c71) which has well-implemented drivers for the on-board peripherals. No USB bandwidth issues plague the ODROID-XU in stark contrast to the USB implementations on other ARM development boards. The onboard USB 3.0 port is up to the challenge of a high-performance USB flash drive or a Microsoft [Kinect](/w/wiki/ee/kinect/).

## Usage

The ODROID-XU's stellar performance combined with only marginally higher power consumption allows it to easily supersede past development boards used by Purdue SIGBots. Starting with VEX Toss Up, Purdue SIGBots is using two ODROID-XU units, one on [Atlas](/w/wiki/past_robots/atlas/) and one on [Prometheus](/w/wiki/past_robots/prometheus/), to handle the algorithms required for Microsoft Kinect data processing for [Object Recognition](/w/cs/object_recognition/). Two additional cores, double the RAM, and a much higher clock speed allow for simultaneous processing of the 3-D image with the color channel, and the USB 3.0 port opens up a possible increased image capture resolution.

[![](https://phabricator.purduesigbots.com/file/data/xh3tb6te4ek7cvfwlkl7/PHID-FILE-z4y4vfmjfgp4s4pejjrk/power_supply.jpg)](https://phabricator.purduesigbots.com/file/data/xh3tb6te4ek7cvfwlkl7/PHID-FILE-z4y4vfmjfgp4s4pejjrk/power_supply.jpg)

 An **ODROID-XU** in use powered from a SIGBOTS [Power Supply](/w/wiki/ee/power_supply/) when testing the Kinect.

