# Rotation Sensor

![V5 Rotation Sensor](<../../../.gitbook/assets/image (50).png>)

### Functionality

The **V5 Rotation Sensor** is an smart sensor to determine the angular position bound by \[0,360), degrees rotated, velocity, and acceleration. It connects to the [V5 Brain](../../vex-electronics/vex-v5-brain/) through a smart port on the side of the sensor, and functions similarly to a[ encoder](../3-pin-adi-sensors/encoder.md) or [potentiometer](../3-pin-adi-sensors/potentiometer.md). Multiple rotation sensors can be used to track robot subsystem locations, as well as the robot position itself. 

### How it Works

The measurement component of the sensor is compromised of two magnets which utilizes the Hall Effect to indicate angular position. A chip inside the rotation sensor (a Cortex M0+) then keeps track of the total rotations which acts as the degrees rotated measurement.

Since the rotation sensor is absolute as it's based on the magnetic field generated, the angular position of the shaft will not reset if the robot loses power. However, since the chip loses power the total number of rotations is not tracked when power is lost.

#### Teams/Individuals Contributed to this Article:

* Alyssa Agarie (Former VEX Competitor)
