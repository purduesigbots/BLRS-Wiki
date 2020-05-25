---
description: >-
  Power consumption refers to the amount of power required by a device to
  function.
---

# Power Consumption

While typically applied in the context of electricity use for VEX applications, the power consumption of a mechanism or other device can also be measured.

## Computing devices

![](https://phabricator.purduesigbots.com/file/data/p646icjf2f4zvllte3ic/PHID-FILE-cdqvqtpitlrm2jrrtak5/power_heat_sink.jpg)

A heat sink is used to safely operate devices with high **power consumption**

Microcontrollers and general purpose computing devices such as the [Netduino](external-boards/netduino.md) and [PandaBoard](external-boards/pandaboard.md) consume electrical power while operating. Most of this power is turned into heat, primarily through gate leakage and switching transients. Power consumption for these devices can range from a few milliwatts to 5-10 watts. Embedded microcontrollers such as the [V5 Brain](vex-electronics/vex-v5-brain/) and [LeafLabs Maple](external-boards/leaflabs-maple.md) consume negligible quantities of power compared to a single actuator, even in run mode.

The VEX platform typically operates on 7.2 V nominal. This works well for devices with 3.3 V and 5 V core voltages, as a step-down now ultimately satisfies all power conversion needs. The table shown below illustrates the power consumption of some common additional computational hardware and the voltage required for supply:

## Actuators

Actuators such as a [VEX Motor](vex-electronics/motors.md) typically draw far more power, from 1.3 watts for a completely unloaded motor to a whopping 25 watts for a [stalled](stalling.md) motor. In most cases, a fraction of the energy consumed is turned into useful mechanical work; the rest is dissipated as reactive power or heat in the motor. VEX actuators are not too efficient, averaging about 20-40% efficiency from power to drive shaft. The power consumption of a VEX motor can be estimated by sensing the current it draws.

Pneumatics are considerably more efficient at converting the stored air pressure to useful force, but eventually exhaust their finite air supplies and waste energy venting unused air to the atmosphere instead of recycling and pumping the excess.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

