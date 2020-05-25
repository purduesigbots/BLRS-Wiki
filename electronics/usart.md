---
description: >-
  A universal synchronous/asynchronous receiver and transmitter, or USART for
  short, is a device which can act as a UART or SPI device.
---

# USART

## Usage

USART peripherals typically have a register setting which can select either synchronous \([SPI](spi.md)\) or asynchronous \([UART](uart.md)\) mode. This makes these peripherals very flexible. However, switching back and forth between the two is not recommended, due to initialization timing glitches which may confuse connected devices.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

