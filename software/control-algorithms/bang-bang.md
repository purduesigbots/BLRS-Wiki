---
description: >-
  This article discusses the control scheme. For information about digital
  communication emulation, see Bit-bang.
---

# Bang Bang

## Bang-bang control

A **bang-bang control** scheme utilizes a few discrete states, similar to what one might obtain if a [finite state machine](../general/finite-state-machine.md) were used directly, to control a device based on sensor readings. Robots using this scheme have a characteristic "zig-zag" or "wiggle" behavior as the robot rapidly switches between states. This control scheme is relatively crude in nature and is recommended for teams short on time, for low-accuracy applications, or for teams relatively new to competitive robotics.

#### Real World Application

In the real world, thermostats use a bang-bang algorithm. When the temperature is below a target temperature, the heating system will try to heat the room to that target temperature until the room is at the target temperature. If the room is above the target temperature, the heating system will correspondingly cool the room until the target temperature is met. To prevent oscillations between the heating and cooling state, a threshold can be implemented to create a target area rather than one specific target value. 

#### In Robotics

While adequate in some situations, bang-bang control is inadequate for more difficult tasks like autonomous chassis control and lift mechanism control. Following the thermostat example, the "cooling" and "heating" would be the directions a motor would turn, and a target area would be a target velocity or range of encoder ticks. Bang-Bang control is commonly used with flywheel control as well as line following using a line sensor mounted on the bottom of a chassis. 

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

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
