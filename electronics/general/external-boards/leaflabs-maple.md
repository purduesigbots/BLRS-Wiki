---
description: The LeafLabs Maple is a 32-bit microcontroller platform created by LeafLabs.
---

# Leaflabs Maple

{% hint style="danger" %}
The LeafLabs Maple has reached end of life and is no longer sold or supported.
{% endhint %}

![](https://phabricator.purduesigbots.com/file/data/au545ntykxeyir2styvt/PHID-FILE-7yzxrysy7jougj4f5fbo/processor_maple.jpg)

The leaflabs Maple is programmed in C using a provided library, libmaple [\(ref\)](https://github.com/leaflabs/libmaple), to make programming similar to the [Arduino](arduino.md) environment. Some of the [GPIO](../gpio.md) pins on the Maple are aligned with the Arduino form factor.

### Features

* Fast, powerful 32-bit ARM processor with lots of memory [\(ref\)](http://leaflabs.com/devices/maple)
* Fits the Arduino form factor, so many Arduino shields are usable
* Low [Power Consumption](https://github.com/theol0403/BLRS-Wiki/tree/d5c517253c2e4369a647e51e200d5175ad2be2ea/w/wiki/ee/power_consumption/README.md) for performance, same processor as [VEX Cortex](https://github.com/theol0403/BLRS-Wiki/tree/d5c517253c2e4369a647e51e200d5175ad2be2ea/w/ee/vex_cortex/README.md)
* Programmed in native C code with excellent low-level library
* Extensive peripheral set \([I2C](https://github.com/theol0403/BLRS-Wiki/tree/d5c517253c2e4369a647e51e200d5175ad2be2ea/w/wiki/ee/i2c/README.md), [UART](https://github.com/theol0403/BLRS-Wiki/tree/d5c517253c2e4369a647e51e200d5175ad2be2ea/w/wiki/ee/uart/README.md), [SPI](https://github.com/theol0403/BLRS-Wiki/tree/d5c517253c2e4369a647e51e200d5175ad2be2ea/w/wiki/ee/spi/README.md)\) and large number of GPIOs [\(ref\)](http://leaflabs.com/docs/hardware/maple-ret6.html)
* Unmatched [Analog-Digital Converter](https://github.com/theol0403/BLRS-Wiki/tree/d5c517253c2e4369a647e51e200d5175ad2be2ea/w/wiki/ee/adc/README.md) complement and resolution
* Flexible power supply options and built-in regulators

### Shortcomings

* A little more expensive than other options \(e.g. the [Arduino](arduino.md) or [Netduino](netduino.md)\)
* Not all pins are [5 Volt Tolerant](../5-volt-tolerant.md)
* [Slew Rate](../slew-rate.md) and [Output Drive](../output-drive.md) leave some to be desired \(but are substantially better than [PandaBoard](pandaboard.md)-like alternatives\)

### Versions

The Maple comes in two versions - the Maple rev5 based on the STM32F103RBT6 processor and the discontinued RET6 beta using the STM32F103RET6 processor. The RET6 offers additional peripherals and a much bigger program memory space at the expense of gotchas due to re-use of the rev5 board design; the future Maple II processor may feature this chip.

## Current development

The Maple was used by SIGBOTS for VEX Toss Up on both robots as an I/O expander. Due to the limited [ADCs](../analog-digital-converter.md) and [GPIOs](../gpio.md) available on the [VEX Cortex](../../legacy/vex-cortex.md), there are insufficient ports for extra peripherals such as a serial LCD screen.

The Maple supersedes the somewhat unreliable and slow [Netduino](netduino.md). Although the Maple lacks a floating-point unit, it has enough horsepower to process a Kalman filter for the next generation of digital [gyros](../../vex/vex-sensors/gyroscope.md).

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

