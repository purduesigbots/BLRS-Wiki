---
description: >-
  Slew rate refers to the maximum rate at which a digital signal (usually a GPIO
  pin) can flip between its high and low states.
---

# Slew Rate

![](https://phabricator.purduesigbots.com/file/data/xrlupzhixcjmziaw2gks/PHID-FILE-ybs5wwbrv5nul2ndlwhk/slew_rate.png)

Diagram showing the difference between an _ideal signal_ \(the red waveform\) and the _actual signal affected by slew rate_ \(green waveform\)

## Factors influencing slew rate

Slew rate is influenced by two primary factors. When a microcontroller attempts to change the value of a GPIO pin, it switches the pin to either its I/O voltage or 0 V. However, if the current voltage on the pin differs from the new voltage, continuity of charge dictates that the voltage cannot change instantaneously. Rather, the voltage changes through an exponential curve, the rate of change depending on the resistance of the switch \(MOSFET\) and the capacitance of the output.

GPIO pins with high [Output Drive](output-drive.md) generally have low switch resistances and therefore a faster slew rate. However, the capacitance of the output depends both on the attached load and the parasitic capacitance inside the microcontroller. Load capacitance mainly comes from long wires or high-impedance inputs.

## Applications

Typical slew rates range from 10 ns to 125 ns. These correspond to maximum signal change rates of 100 MHz and 8 MHz respectively. Generally, communication using a slow protocol such as [UART](uart.md) or [I2C](i2c.md) has few issues with slew rate, but faster protocols such as USB and [SPI](spi.md) may have data corruption if the slew rate is insufficient. Just because a signal can be generated quickly does not mean that the destination can understand it; observe maximum frequency limitations carefully.

The highest slew rates are found among high-speed purpose-built microcontrollers such as the [V5 Brain](../../vex-electronics/vex-electronics/vex-v5-brain/) and [Leaflabs Maple](external-boards/leaflabs-maple.md). A 16 MHz [Arduino](external-boards/arduino.md) cannot obtain a 100 MHz slew rate, and the very low drive strength of high-speed processors such as the [Pandaboard](external-boards/pandaboard.md) leads to slower slew rates.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

