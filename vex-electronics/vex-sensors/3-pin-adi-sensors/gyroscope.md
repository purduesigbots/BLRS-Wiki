---
description: >-
  The VEX Yaw Rate Gyroscope returns the rate of rotation around the vertical
  axis.
---

# Gyroscope

{% hint style="warning" %}
The Gyroscope is no longer sold on the VEX storefront. Check out the [V5 Inertial Sensor (IMU)](../smart-port-sensors/imu.md) for the most up to date sensor carried by VEX.
{% endhint %}

![](https://phabricator.purduesigbots.com/file/data/p7jm7bskc4bq23bdhvxn/PHID-FILE-w3fvfl5l6ijotesvazfz/vex\_gyro.jpg)

The **VEX Yaw Rate Gyroscope**, or simply the **VEX Gyro**, is an analog gyroscope which returns a voltage between 0 and +5 V approximately proportional to the **rate** of rotation around the vertical axis through the sensor. The sensor can detect a rotation of up to +/- 1000 degrees per second. While the Yaw Rate Gyroscope is acceptable for coarse positioning, use of a digital gyroscope may lead to more precise readings. When powered, the Yaw Rate Gyroscope becomes illuminated by a bright green light, which can be seen next to the "PWR" marking.

In [VEXCode](../../../software/vex-programming-software/vex-coding-studio-vcs.md), the Yaw Rate Gyroscope returns the angle of rotation in degrees. However, in [PROS](../../../software/vex-programming-software/pros/), the Yaw Rate Gyroscope returns the angle of rotation in decidegrees (tenths of a degree). This means that rather than receiving a reading of 360 degrees, it will return 3600 decidegrees instead. Additionally, the sensor measures heading from -3600 decidegrees to 3600 decidegrees. This differs from how the [V5 Inertial Sensor](../smart-port-sensors/imu.md) works when measuring heading, since it only has a range from 0 degrees to 360 degrees.

The VEX Yaw Rate Gyroscope is highly vulnerable to [Line Noise](../../../electronics/general/line-noise.md) and should be shielded or placed far from [motors](../../vex-electronics/motors.md). All gyroscopes must be placed at the robot's center of rotation for optimal results. Dynamic calibration is therefore a must before each run.

## Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
* [904U](https://www.youtube.com/channel/UCKvtsL9hJ\_x7bqrpl3nJ3Gg/) (B.E.S.T.I.E. Robotics)
