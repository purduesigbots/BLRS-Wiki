---
description: >-
  A VEX Power Expander is a device which allows up to four of the VEX Motors on
  a robot to run from a second VEX Battery while still under the control of the
  VEX Cortex or VEX PIC.
---

# Power Expander

{% hint style="danger" %}
The Power Expander is only compatible with the old VEX Cortex system, which is no longer competitive.
{% endhint %}

![](https://phabricator.purduesigbots.com/file/data/u3hkrnhchc6435xhe5yy/PHID-FILE-n6pxgdruiodijd4ojjvh/vex\_power\_expander.jpg)

Power Expanders are highly recommended to remove at least one subsystem from loading the primary VEX Battery, especially when many 2-Wire Motor 393 modules are in use. Power Expanders sit between the motor (or [digital](../../electronics/general/gpio.md)) output controlling the motor and the [VEX Motor Controller](motor-controller.md), isolating the input system's power and injecting its own on the orange conductor.

Power Expanders are relatively lightweight, but have a long, thin form factor that makes it hard to place them, compounded by the short power cable which necessitates a bulky battery to be placed nearly and the rat's nest of eight VEX PWM cables running to and from the device. The weight of an extra battery may load drive motors more than before, but it also might increase traction. With the use of the VEX Power Expander and External Sensors, up to three batteries can be installed on a VEX College Challenge robot.

VEX Power Expanders have been notorious in the past for tripping their internal breakers too quickly; however, this is no more or less likely than tripping a VEX Cortex [Resettable Fuse (PTC)](../../electronics/general/resettable-fuse-ptc.md), and unlike the VEX Cortex internal fuses, the status port can be connected to an analog input to detect this condition. [Stall Detection](../../software/general/stall-detection.md), especially on the Motor 393 outputs, is just as important when using the Power Expander. **No more than two** 2-Wire Motor 393 modules should be used _simultaneously_ on a VEX Power Expander, just like per bank of the VEX Cortex.

## Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
