---
description: This guide provides general wiring tips for the legacy cortex system.
---

# VEX Cortex Wiring Guide

{% hint style="danger" %}
These wiring tips are mostly relevant for old VEX Cortex system, which is no longer competitive.
{% endhint %}

The most fundamental part of VEX Electronics is being able to properly wire the robot. There is more than you would think that goes into wiring a VEX robot, and this guide should help walk you through that.

**Fundamentals**

There are a few fundamental things to consider when wiring a robot:

* Don't route analog sensor wires near motor wires \(two wires, the three wire portion from the motor controllers is fine\). This causes a lot of noise in the signal
* Don't zip tie wires to wires without the bundle against a piece of metal, there should be a place to clip the zip tie that won't be at risk of cutting the wire
* Don't route wires over the vexnet key, we need to remove this fairly often
* Make the power switch on the cortex easily accessible if possible, sometimes it's inevitable to bury it in the bot but it's a royal pain in the ass
* Be conscious of center of gravity when finding places for the batteries and route power extenders accordingly.

**Port Mapping**

There are a few aspects of the [VEX Cortex](vex-electronics/vex-cortex.md) to keep in mind when designing a port map:

* There are two current-limiting [PTCs](resettable-fuse-ptc.md) on the motor ports, one that covers ports 2-5 and one that covers ports 6-9.
* Ports 1 and 10 are two wire ports, they do not require a motor controller and have a more linear relationship between PWM and motor velocity. They also have their own H-bridges, which can burn out if a motor shorts out. \(which happens all too often\)
* 12 motors are available but there are only 10 motor ports. At least two y-cables are needed.

As a result of these characteristics, a few guidelines/rules should govern port map design:

* Always split the left and right side motors of a subsystem across the two PTCs. For instance, put the left side drive motors on ports 2/3, and the right side drive motors on ports 8/9. This will lessen the load on the Cortex PTCs when the subsystem is running.
* Traditionally we like to avoid ports 1 and 10 both for consistencies sake and to keep from damaging the internal h-bridges for these ports, so use 4 y-cables when wiring a robot if possible.

**The Power Expander**

The [Power Expander](power-expander.md) should be used on every robot. It adds weight because of the extra battery, but the additional battery life and PTC is worth it.

The power expander should power a non-crucial subsystem ideally. Obviously every part of the robot is preferable to keep on, but consider which motors would be the least crucial to lose if a power expander battery doesn't get plugged in or the power expander PTC trips. This varies from robot to robot but as a general rule, don't put the drivetrain on the power expander.

**Motor Controller Organization**

The main consideration with motor controller organization is future electrical debugging, as motor controllers are likely to burn up at some point in the robot's lifetime, and making sure that they can be easily swapped out in a match is essential. There are two schools of thought on how to best approach this:

**Motor Controller Holder**

In Starstruck, we designed a Motor Controller Holder to group all of the motor controllers in one place to make replacing them easier. This is a nice looking, organized approach, but it is sometimes difficult to trace out which motor controllers go where without labeling. The motor controller can also sometimes be too large to fit next to the Cortex.

An update to the original MCH design has produced smaller, four motor clusters for applying the same concept but helping distinguish between subsystems.

**Subsystem Clusters**

This is a much more freeform style of wiring, which is good for mechanically dense robots and quick wiring jobs at the expense of a lack of organization. Simply group the motor controllers by subsystem \(or side of a subsystem\) wherever possible, and make sure to keep them separated from other subsystems. This makes the wiring easier to trace in case a motor controller dies, and allows for more creative routing of the wires.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

