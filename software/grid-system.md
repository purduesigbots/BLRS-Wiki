---
description: >-
  A grid system is a mechanism for plotting a robot's estimated position on a
  Cartesian grid-like map of the field.
---

# Grid System

Most grid system implementations are meant to be used to return to a specified absolute position after some sequence of possibly variable offsets. It is very useful in [dynamic autonomous](https://phabricator.purduesigbots.com/w/autonomous_code/) strategies, but can accumulate error over time.

## Implementation

The easiest way to implement a grid system would be to modify the estimated position by the expected amount of the last move after each move completes; however, this only updates per-move and goes horribly wrong when encountering a disturbance. In essence, this is a simplistic form of dead reckoning; while many teams find it easy to go straight for a certain distance, offset problems often pop up during turns.

More clever methods utilize the [encoder](https://phabricator.purduesigbots.com/w/ee/vex_shaft_encoder/) and [Gyro](https://phabricator.purduesigbots.com/w/ee/gyro/) information already captured by the platform to determine the offset from the last position at a fairly high rate; this works well but is subject to gyro drift. To do so, the distance traveled would be multiplied by the sine and cosine of the current angle respectively to determine the offsets from the old location. The evils of [Debugging](https://phabricator.purduesigbots.com/w/debugging/#floating%20point) code often are required here due to the extreme difficulty of computing accurate sine and cosine of a differential quantity without rounding off in an integer representation.

## History

A variety of implementations of a grid system were used [VEX Gateway](https://phabricator.purduesigbots.com/w/eng/vex_gateway/); the most recent incarnation tracks position and angle with reasonable accuracy. However, none of them were actually utilized in a match, as the dynamic [Red/Green Buoy](https://phabricator.purduesigbots.com/w/red_green_buoy/) algorithm failed to detect a full [intake](https://phabricator.purduesigbots.com/w/eng/intake/) condition and so never triggered a return-to-home strategy.

The upgrade to [PROS](https://phabricator.purduesigbots.com/w/pros/) and a full multi-tasking environment brought the accuracy and precision of mapping software to astounding levels, as mapping could run in the background with no discernible timing [Jitter](https://phabricator.purduesigbots.com/w/ee/jitter/) and use the super-accurate new Pololu MinIMU-9 digital gyro. If [Sacks](https://phabricator.purduesigbots.com/w/eng/sacks/) had not been present in [VEX Sack Attack](https://phabricator.purduesigbots.com/w/eng/vex_sack_attack/), mapping could have been used for an entire autonomous mode; the disturbances caused by Sacks, however, accumulated errors in mapping that made it less useful than a well-designed [finite state machine](https://phabricator.purduesigbots.com/w/finite_state_machine/).

