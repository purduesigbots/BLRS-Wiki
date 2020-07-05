---
description: The VEX Gyro returns the rate of rotation around the veritcal axis.
---

# Gyroscope

{% hint style="warning" %}
The Gyroscope is no longer sold on the VEX storefront. Check out the [V5 Inertial Sensor \(IMU\)](imu.md) for the most up to date sensor carried by VEX.
{% endhint %}

![](https://phabricator.purduesigbots.com/file/data/p7jm7bskc4bq23bdhvxn/PHID-FILE-w3fvfl5l6ijotesvazfz/vex_gyro.jpg)

The **VEX Yaw-Rate Gyro**, or simply the **VEX Gyro**, is an analog gyroscope which returns a voltage between 0 and +5 V approximately proportional to the **rate** of rotation around the vertical axis through the sensor. The full-scale range is about +/- 1000 degrees per second, a huge limit that compresses the full-scale range and reduces resolution. While acceptable for coarse positioning, use of a digital gyroscope leads to more precise readings.

The VEX Gyro is highly vulnerable to [Line Noise](../../general/line-noise.md) and should be shielded or placed far from [motors](../vex-electronics/motors.md). All gyroscopes must be placed at the robot's center of rotation for optimal results. Dynamic calibration is therefore a must before each run.

## Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

