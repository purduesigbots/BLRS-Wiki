---
description: >-
  A general purpose I/O pin, or GPIO pin for short, is a pin on a
  microcontroller (ref) which can be used for software-controlled input or
  output.
---

# GPIO

![ The GPIO port bank on a PandaBoard](https://phabricator.purduesigbots.com/file/data/x4buotu5l3wgxyvwrsvn/PHID-FILE-c3zkq7wr5xnwh6ownee7/pandaboard_gpio.jpg)

GPIO pins are often shared with other peripherals, such as [UART](uart.md) and [SPI](spi.md) pins.

## Usage as an input

If the internal output driver is placed in a high impedance state, then whatever is connected to the pin will determine its current value. Voltages near the I/O voltage will cause a logic "1", and voltages near 0 V will cause a logic "0". Voltages in between may or may not produce a consistent value, as governed by the logic family of the input device. The high or low value can be read in software, using a function like digitalRead\(\).

Some GPIO pins can handle voltages higher than the I/O voltage. For more information, see [voltage tolerance](5-volt-tolerant.md).

Unused input pins may cause increased [power consumption](power-consumption.md) if the input voltage floats about halfway in between the low and high states, along with spurious value changes. To avoid erratic behavior, set the pin to an output mode or use a pull-up resistor.

## Usage as an output

Each **GPIO** pin also features an output driver, which can set the pin to either a high or low value in software using a function like digitalWrite\(\). A logic "1" is represented by a voltage close to the I/O voltage of the microcontroller, while a logic "0" is near 0 V.

The actual values of these voltages may vary depending on what type of load is connected to the microcontroller. Pins with high [drive strength](output-drive.md) are affected less by the power draw of the connected device. For this reason, devices driven directly by GPIOs should have short wires and low power requirements.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

