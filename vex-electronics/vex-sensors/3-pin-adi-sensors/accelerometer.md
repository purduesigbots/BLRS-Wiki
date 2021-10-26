---
description: An Accelerometer measures proper acceleration.
---

# Accelerometer

![](https://phabricator.purduesigbots.com/file/data/tolj2gugcwwaa3alvel5/PHID-FILE-v6yde3okscjogvdjcsbi/vex\_accelerometer.jpg)

While it may seem that acceleration can be used to infer force, this is only valid on movable objects with constant mass and produces a net force estimate, which may be useless if the value of one particular force is to be measured. It is also not feasible to integrate the accelerometer once for velocity and/or twice for position; most accelerometers lack the precision and stability required for this to work. Accelerometers are viable solutions for determining if a robot is leaning to take quick action to prevent tipping over.

## Usage

Most accelerometers, like their cousins the [Gyroscope](gyroscope.md), output an analog voltage. The best models can use a digital protocol like [SPI](../../../electronics/general/spi.md) or [I2C](../../../electronics/general/i2c.md). While not nearly as sensitive to [line noise](../../../electronics/general/line-noise.md) as gyroscopes, accelerometers should still be shielded from noise sources. If a robot or assembly is rigid, it theoretically should not matter where the accelerometer is placed, but most devices tend to perform better at or near the [gyro](gyroscope.md) (but priority must be given to the gyro in this regard).

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
