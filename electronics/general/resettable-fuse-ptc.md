---
description: >-
  A resettable fuse, sometimes known as a PPTC for polymeric positive
  temperature coefficient, is a safety device intended to prevent excessive
  Power Consumption and thus overheating of an electronic de
---

# Resettable Fuse \(PTC\)

![ A selection of resettable fuses similar to the types used for protection of VEX components](https://phabricator.purduesigbots.com/file/data/gdetw4bdg3fbd4s6dr6n/PHID-FILE-4koxfkowdeuljh2ejk5j/pptc_fuse.jpg)

Resettable fuses are devices with a very low resistance when cool, so they have little effect when placed in series with a load. However, when large currents flow through the load, the fuse begins to heat up due to ohmic heating. As the temperature of the fuse increases, the resistance increases slowly. However, at a critical point, the resistance begins to increase rapidly, eventually reaching a point where the fuse develops a resistance in the many thousands of ohms, reducing the current to a safe level and disabling the load. After the current overload dies down, the fuse begins to cool and drops in resistance back to its initial value.

Since cooling occurs at a different rate than heating \(black body radiation compared to ohmic heating\), the fuse may take up to 30 seconds to cool down and over 5 minutes to recover fully, even though it can trip in less than a second.

[Motors](../../vex-electronics/vex-electronics/motors.md) are equipped with a resettable fuse \(1.5 A/269, 1.8 A/393\). Since the stall current of VEX Motors is much higher than the trip current, the fuse will heat up quite rapidly when running at very high power consumption rates, possibly cutting power to the motors during a match. Motors should therefore be designed to run at a point somewhat less than the maximum torque output to avoid this issue, or must be equipped with [Stall Detection](../../software/general/stall-detection.md) to stop the condition before it becomes a problem.

The [VEX Cortex](../../vex-electronics/legacy/vex-cortex.md) has a 4 A resettable fuse controlling each bank of 5 motors \(1-5 and 6-10\). Likewise, the [Power Expander](../../vex-electronics/legacy/power-expander.md) has one 4 A resettable fuse for all four outputs. **No more than two** 2-Wire Motor 393 modules should be used _simultaneously_ on a VEX Power Expander or per group of five motors on the VEX Cortex. Splitting heavy loads across the motor banks \(e.g. plugging the left drive motors into ports 1-3 and the right drive motors into ports 7-9\) will reduce the likelihood of a main fuse trip during a match.

## Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

