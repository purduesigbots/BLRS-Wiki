---
description: >-
  The VEX V5 Optical Sensor is used to determine the color of an object and has
  secondary function to determine the relative motion of an object
---

# Optical Sensor

![V5 Optical Sensor](https://www.vexrobotics.com/media/catalog/product/cache/d64bdfbef0647162ce6500508a887a85/2/7/276-7043.jpg)

The **VEX V5 Optical** Sensor is used to determine the color of an object. It does this by shining an LED light in front of a set of simple cameras. It connects to the [V5 Brain](../../vex-electronics/vex-v5-brain/) through a Smart Port located at the top of the sensor.

When an object passes in front of the sensor, the cameras capture simple data about the object by the reflection of the LED light on the object. The sensor can output RGB values, a Hue value, or a grayscale value. The RGB output gives three separate values; being the Red, Green, and Blue channels. The optimal range for the sensor is between 10mm and 80mm distance between the sensor and the object that it is measuring. It is also important to make sure that light levels remain constant while measuring, make sure to test your optical sensor before operation, as different ambient lights can variareturn different sensor values. When programming, leave a range of output values at which the sensor will react. Due to a large amount of variance that is required with any color sensing, testing in a wide variety of ambient conditions is always needed. Try changing the light level in the testing space and running a large amount of trials with real-world conditions.

The Optical Sensor also has a secondary function, determining the relative motion of an object. It can show movement in one direction in a 2D plane parallel to the sensor(i.e. up, down, left, or right). During testing this has been proven to not be a reliable method of sensing motion.

## Teams Contributed to this Article:

* MTBR (Michigan Task Based Robotics)
* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
