---
description: >-
  The PandaBoard is a low-power, open-source (ref) single-board computer based
  on the Texas Instruments OMAP4430 system on a chip.
---

# Pandaboard

![](https://phabricator.purduesigbots.com/file/data/3a6ppzzjxb5hcjzsof7t/PHID-FILE-gqs4l6fjjznsjnrcyvrp/pandaboard_es_omap4460.jpg)

| **Architecture:** 32-bit [Cortex-A9](http://www.arm.com/products/processors/cortex-a/cortex-a9.php/) |
| :--- |
| **Processor:** [TI OMAP4430](http://www.ti.com/product/omap4430/) _\(dual-core\)_ |
| **Languages:** C, C++, Many others |
| **Clock:** 1 GHz |
| **Vcore:** 1.2 V |
| **Vio:** 3.3 V |
| **Power:** 5 W |
| **Flash:** SD/MMC Card |
| **RAM:** 1024 MB |
| **GPIO:** 20? _\(none_ [_5 Volt Tolerant_](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/5_volt_tolerant/README.md)_\)_ |
| **Peripherals:** USB On-The-Go, 2x USB 2.0, 2x HDMI, 3.5mm audio out, [UART](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/uart/README.md), JTAG debug |

The Pandaboard is a community supported development platform [\(ref\)](http://omappedia.org/wiki/PandaBoard) and is available for a somewhat subsidized [\(ref\)](http://omappedia.org/wiki/PandaBoard_FAQ#Is_TI_subsidizing_the_PandaBoard.3F) cost of $174. A newer version, the PandaBoard ES [\(ref\)](http://pandaboard.org/content/pandaboard-es), has been available for $182 since November 16, 2011 with the CPU and GPU on the OMAP4460 platform running at higher clock rates.

## Features

[![](https://phabricator.purduesigbots.com/file/data/ekqyy5ciw6h2wp4wedd5/PHID-FILE-dgtlep4zogo2gehfknzd/pandaboard_ports.png)](https://phabricator.purduesigbots.com/file/data/ekqyy5ciw6h2wp4wedd5/PHID-FILE-dgtlep4zogo2gehfknzd/pandaboard_ports.png)

The PandaBoard measures about 100 x 110 mm [\(ref\)](http://pandaboard.org/content/platform) and features a dual-core 1 GHz CPU, a dedicated GPU, a DSP for audio and video processing, and 1 GB of RAM. It lacks a hard drive or solid-state drive, starting an operating system and primarily running from an SD/MMC card.

The board includes wired Ethernet as well as WiFi and Bluetooth connectivity. The board can output video signals via the two HDMI interfaces [\(ref\)](http://pandaboard.org/sites/default/files/board_reference/EA1/Panda_Board_Spec_REVEA1_04.pdf), and can also take input signals from one of the ports. It has two USB host ports and one USB On-The-Go port, supporting USB 2.0. Android and Ubuntu [\(ref\)](http://omappedia.org/wiki/Ubuntu_Pre-built_Binaries_Guide) will operate on the board, without many of the [BeagleBoard](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/beagleboard/README.md)'s unusual driver issues.

The GPIO connectors follow the standard Linux format, where one can export pins to userspace via the file system in /sys and control them using any programming language.

## Usage

[![](https://phabricator.purduesigbots.com/file/data/sqc64rm7l2tooprf4i3i/PHID-FILE-6hnmau75gozlbepdnsv5/pandaboard_inuse.jpg)](https://phabricator.purduesigbots.com/file/data/sqc64rm7l2tooprf4i3i/PHID-FILE-6hnmau75gozlbepdnsv5/pandaboard_inuse.jpg)

The **PandaBoard** in its protective shell as seen on Honey Badger

With the PandaBoard's low [Power Consumption](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/power_consumption/README.md) and high performance, algorithms such as [Opencv](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/cs/opencv/README.md) and [AMS](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/cs/ams/README.md) can be run at productive frame rates. The dual-core architecture lends itself better to performing multiple tasks than the BeagleBoard, even though the board is a bit larger. For [Object Recognition](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/cs/object_recognition/README.md), it was used on [Honey Badger](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/past_robots/honeybadger/README.md) and [Coby](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/past_robots/coby/README.md) during VEX Gateway.

The PandaBoard returned in VEX Sack Attack on [Artemis](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/past_robots/artemis/README.md) as the frontend for another object recognition algorithm. As the dark green sacks were difficult to distinguish from the environment, the PandaBoard was assigned to hunt opposing teams' robots using their colored VEX flags. Acrylic cases with built-in cooling fans were installed to prevent CPU clocks from throttling due to excessive heat dissipation.

However, [ODROID-XU](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/ee/odroid/README.md). The PandaBoard has gained a second life for [testing](https://github.com/theol0403/BLRS-Wiki/tree/1a2da1c73039274a2ed05a8c941d9ebf94bcac97/w/wiki/cs/behind_the_scenes/README.md) and as a new version of the Lab Status Monitor.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

