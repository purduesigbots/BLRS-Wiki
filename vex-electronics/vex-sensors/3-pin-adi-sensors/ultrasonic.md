---
description: The VEX Ultrasonic Sensor helps determine how far away an object is.
---

# Ultrasonic

![](https://phabricator.purduesigbots.com/file/data/4fzc76ks6q5j273mqwzw/PHID-FILE-gi5xevx7y6sekffp3dua/ultrasonic\_range\_finder2-300x300.jpg)

The **VEX Ultrasonic Sensor**, or simply the **VEX Sonar**, is a rangefinding device which uses pulses of high-frequency sound to estimate the distance to an object. It connects to the [VEX Cortex](../../legacy/vex-cortex.md) or [V5 Brain](../../vex-electronics/vex-v5-brain/) using two digital ports; one port to send a pulse, and the other to receive it.

Sound travels very slowly compared to the speed of a microprocessor clock; distance can be easily estimated by sending a brief pulse of sound via the ''OUTPUT'' signal, then waiting for the ''INPUT'' signal to change from high to low indicating that the pulse was received back. Calculating the time between, dividing by twice the speed of sound, and scaling to inches or centimeters provides a pretty good estimate of the distance to that object.

Soft or rounded objects do not reflect sound as well and can confuse or elude the VEX Ultrasonic Sensor. Using more than one VEX Ultrasonic Sensor at a time can cause interference.

## Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
