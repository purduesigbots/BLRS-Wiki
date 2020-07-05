---
description: >-
  This article discusses the control scheme. For information about digital
  communication emulation, see Bit-bang.
---

# Bang Bang

## Bang-bang control

A **bang-bang control** scheme utilizes a few discrete states, similar to what one might obtain if a [finite state machine](../finite-state-machine.md) were used directly, to control a device based on sensor readings. Robots using this scheme have a characteristic "zig-zag" or "wiggle" behavior as the robot rapidly switches between states.

While adequate in some situations, bang-bang control is inadequate for more difficult tasks like line-following and lift mechanism control.

### Example

```c
// Port where line sensor is plugged in
#define LINE_SENSOR 4
// Line threshold value
#define LINE_THRESHOLD 1512

void autonomous() {
    // DO NOT RUN THIS CODE. Use a PID controller for line following instead.
    while (1) {
        if (analogRead(LINE_SENSOR) < LINE_THRESHOLD) {
            // If line is seen, turn right
            setDrive(60, 0);
        } else {
            // If line is not seen, turn left
            setDrive(0, 60);
        }
        // There are only two discrete output value combinations, so this is a bang-bang controller
        // If this were to be run, the robot would rapidly wiggle along the line, moving very
        // slowly and stressing the drive train...
        delay(20);
    }
}
```

### Advantages

* Easy to code and easy to debug
* Generally does not require calibration or adjustment for the environment
* Useful for managing systems from a digital sensor

### Disadvantages

* Does not effectively use information from an analog sensor
* Slower reaction time than a [PID controller](pid-controller.md)
* Does not use information from the past or predicted future inputs to make decisions
* Systems may wear out due to rapid fluctuations in output

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

