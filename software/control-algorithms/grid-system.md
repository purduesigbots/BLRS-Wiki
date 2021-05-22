---
description: >-
  A grid system is a mechanism for plotting a robot's estimated position on a
  Cartesian grid-like map of the field.
---

# Grid System

Most grid system implementations are meant to be used to return to a specified absolute position after some sequence of possibly variable offsets. It is very useful in dynamic autonomous strategies, but can accumulate error over time.

## Implementation

The easiest way to implement a grid system would be to modify the estimated position by the expected amount of the last move after each move completes; however, this only updates per-move and goes horribly wrong when encountering a disturbance. In essence, this is a simplistic form of dead reckoning; while many teams find it easy to go straight for a certain distance, offset problems often pop up during turns.

More clever methods utilize the [encoder](../../vex-electronics/vex-sensors/3-pin-adi-sensors/encoder.md) and [Gyro](../../vex-electronics/vex-sensors/3-pin-adi-sensors/gyroscope.md) information already captured by the platform to determine the offset from the last position at a fairly high rate; this works well but is subject to gyro drift. To do so, the distance traveled would be multiplied by the sine and cosine of the current angle respectively to determine the offsets from the old location. The evils of [Debugging](../general/debugging.md) code often are required here due to the extreme difficulty of computing accurate sine and cosine of a differential quantity without rounding off in an integer representation.

## History

A variety of implementations of a grid system were used VEX Gateway; the most recent incarnation tracks position and angle with reasonable accuracy. However, none of them were actually utilized in a match, as the dynamic [Red/Green Buoy](../object-recognition/red-green-buoy.md) algorithm failed to detect a full intake condition and so never triggered a return-to-home strategy.

The upgrade to [PROS](../vex-programming-software/pros/) and a full multi-tasking environment brought the accuracy and precision of mapping software to astounding levels, as mapping could run in the background with no discernible timing [Jitter](../../electronics/general/jitter.md) and use the super-accurate new Pololu MinIMU-9 digital gyro. If Sacks had not been present in VEX Sack Attack, mapping could have been used for an entire autonomous mode; the disturbances caused by Sacks, however, accumulated errors in mapping that made it less useful than a well-designed [finite state machine](../general/finite-state-machine.md).

### Contributing Teams to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

