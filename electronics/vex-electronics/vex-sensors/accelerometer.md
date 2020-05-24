# Accelerometer

[![](https://phabricator.purduesigbots.com/file/data/tolj2gugcwwaa3alvel5/PHID-FILE-v6yde3okscjogvdjcsbi/vex_accelerometer.jpg)](https://phabricator.purduesigbots.com/file/data/tolj2gugcwwaa3alvel5/PHID-FILE-v6yde3okscjogvdjcsbi/vex_accelerometer.jpg)

An **accelerometer**, most of which are based from the solid-state piezoelectric principle.

While it may seem that acceleration can be used to infer [force](/w/eng/force_and_torque/), this is only valid on movable objects with constant mass and produces a net force estimate, which may be useless if the value of one particular force is to be measured. It is also not feasible to integrate the accelerometer once for velocity and/or twice for position; most accelerometers lack the precision and stability required for this to work. Accelerometers are viable solutions for determining if a robot is leaning to take quick action to prevent tipping over.

## Usage

Most accelerometers, like their cousins the [Gyroscope](/w/wiki/ee/vex_sensors/gyro/), output an analog voltage. The best models can use a digital protocol like [SPI](/w/spi/) or [I2C](/w/i2c/). While not nearly as sensitive to [line noise](/w/line_noise/) as gyroscopes, accelerometers should still be shielded from noise sources. If a robot or assembly is rigid, it theoretically should not matter where the accelerometer is placed, but most devices tend to perform better at or near the [gyro](/w/gyro/#center%20of%20rotation) \(but priority must be given to the gyro in this regard\).

The [VEX Joystick](/w/ee/vex_joystick/) has a 3-axis accelerometer installed [\(ref\)](http://www.vexrobotics.com/276-2192.html), two axes \(X and Y\) of which are available to the user [VEX Cortex](/w/ee/vex_cortex/) program. VEX also produces a discrete 3-axis accelerometer sensor [\(ref\)](http://www.vexrobotics.com/276-2332.html), but it has found little use compared to the [VEX Gyro](/w/ee/vex_gyro/).

The Pololu MinIMU-9 V2 digital gyro [\(ref\)](http://www.pololu.com/catalog/product/1268) features a 3-axis digital accelerometer and 3-axis digital compass on the same board. While attempts to use a [wp&gt;Kalman filter](/w/wp_kalman_filter/) on this device failed, the accelerometer axes are still available for uses like anti-tip protection.

