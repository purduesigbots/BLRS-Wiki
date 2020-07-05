---
description: >-
  This page refers to the electrical engineering concept of output drive. For
  information about mechanical drive strength, it may be better to read the
  pages on force and torque or gear ratios.
---

# Output Drive

**Output drive**, or **drive strength**, is a measure of the amount of power a microcontroller's [GPIO](general/gpio.md) pin can safely deliver to its attached load.

Digital pins are generally not designed to drive powerful loads such as [VEX motors](vex/vex-electronics/motors.md). However, even a device as small as an ordinary LED can pose issues for some chips. **Output drive** current is closely related to the resistance of the final output MOSFET inside the microcontroller. Larger \(and therefore more expensive to incorporate\) output drive circuits have higher drive strengths.

General-purpose computing devices such as the [PandaBoard](general/external-boards/pandaboard.md) and [BeagleBoard](general/external-boards/beagleboard.md) typically have very poor output drives, often less than 4 mA per pin. Most devices such as the [Netduino](general/external-boards/netduino.md) and [VEX Cortex](https://github.com/theol0403/BLRS-Wiki/tree/d5c517253c2e4369a647e51e200d5175ad2be2ea/w/ee/vex_cortex/README.md) fall in the range from 5-16 mA per pin. If more current is required, a dedicated switching MOSFET or a logic buffer chip can be appended onto the output pin and used to drive the load.

Total output drive per chip is typically limited by the power dissipation excess output current will cause. Driving 100 mA of loads from an Atmel AVR chip, even if spread out safely over several pins, will exceed the maximum allowed current through the positive power pin and may overload the power supply. Chips can usually sink more current through the common ground pin than source from the positive supply, allowing larger loads to be operated per pin if operated in active-low or open-drain mode.

## Applications

Pins with high output drive can often drive LEDs directly with a current-limiting resistor, allowing simple and low part count methods of indicating status. However, most modern logic input devices such as sensor control pins and [UART](uart.md) ports require a very small current, a value that any pin can comfortably provide. Lower-impedance inputs, like those of legacy TTL chips, often will not function properly on outputs with low output drive.

Output drive also affects [slew rate](slew-rate.md), as a pin with a higher output drive typically has a lower output impedance and therefore a shorter time constant.

The best known platforms for good output drives are the [Arduino](general/external-boards/arduino.md) and Netduino Plus 2, exceeding 20 mA per pin. The [Netduino](general/external-boards/netduino.md), [LeafLabs Maple](general/external-boards/leaflabs-maple.md) and VEX Cortex fall between 4 and 16 mA depending on the pin. The expansion ports on a PandaBoard or BeagleBoard run at very low voltages and are not designed to source or sink more than [4 mA](https://groups.google.com/forum/#!topic/pandaboard/LTyPKrzQM2I). A good compromise might be the [Raspberry PI](general/external-boards/raspberry-pi.md) or BeagleBone, which have 3.3 V I/O and slightly improved output drive of between 4 and 8 mA.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

