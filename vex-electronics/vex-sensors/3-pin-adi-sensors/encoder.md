---
description: The VEX Encoder helps to determine the rotation of a shaft.
---

# Encoder

![](../../../.gitbook/assets/opticalshaftencoder\_render.png)

The [**VEX Quadrature Encoder**](https://www.vexrobotics.com/276-2156.html), or simply the **VEX Shaft Encoder**, is a two-port device which counts the number of times that a spinning axle has rotated. Both ports are outputs and output periodic pulses corresponding to movements of the shaft in question. This sensor must not be confused with the discontinued "VEX Optical Shaft Encoder" which is not a quadrature device and only counts rotation in one direction.

## Notable Traits

As with [potentiometers](potentiometer.md), using these encoders requires advance planning. As seen from the image above, these items take up a significant amount of space, measuring more than 3/4″ thick. On a chassis they are typically installed in between the wheel’s supporting c-channels (the structure of one side of the chassis is something like: c-channel, wheel, encoder, c-channel, with spacers & shaft collars thrown in as needed). These sensors come in a handy 2-pack because teams often use one on each side of the robot’s chassis to help keep the robot driving straight in autonomous mode, in addition to knowing how far it has gone.

The chassis is not the only place to use these sensors, but it is the most popular.

### Lots of Ports

Once there are a lot of sensors on the robot, the analog & digital ports can fill up fast. 4 shaft encoders will take up 8 ports.

## How it works

[![](https://phabricator.purduesigbots.com/file/data/paq4de3gkt25tgfelzkx/PHID-FILE-lhgjpb2ysj3h7ff4s6y2/shaft\_encoder\_insides.png)](https://phabricator.purduesigbots.com/file/data/paq4de3gkt25tgfelzkx/PHID-FILE-lhgjpb2ysj3h7ff4s6y2/shaft\_encoder\_insides.png)

Inside the red box is an infrared light and a sensor on opposite sides of a wheel with lots of little holes/slots in it (image at right). The sensor can tell when light is shining through the holes and when it is not, and thus can count the number of “clicks” that have gone past its viewing window. One full revolution includes 360 clicks (not 90 clicks, as described on the downloadable info sheet).

The reason that these encoders have 2 wires (the older model had only one sensor/one wire) is that the second wire—attached to a second sensor inside the device—allows the [V5 Brain](../../vex-electronics/vex-v5-brain/) to know which direction the wheel is spinning. One could use these sensors with just one wire plugged in—simulating the older version of the component—if (a) it is not important what direction the wheel is moving, (b) it will only move in one direction during usage, AND (c) the robot has so many sensors and gizmos that there are no more digital ports on the [V5 Brain](../../vex-electronics/vex-v5-brain/).

Underneath it all, these shaft encoders are indeed digital sensors. When the infrared light makes it from the light to the light sensor through one of the open slots, the encoder spits out a 0 (LOW). When the light is blocked it spits out a 1 (HIGH). The [V5 Brain](../../vex-electronics/vex-v5-brain/) keeps track of these 1s and 0s to generate a running count of clicks. Combined with information from the second wire to the [V5 Brain](../../vex-electronics/vex-v5-brain/) (which gets data from the second infrared sensor inside the device), it knows what direction the shaft/wheel/encoder is moving: the [V5 Brain](../../vex-electronics/vex-v5-brain/) knows whether to add to its click count or subtract from it.

## Relative vs. Absolute Position

There’s an important distinction to be made here between encoders and potentiometers; understanding it will help discern which sensor is needed for the task at hand.

Shaft encoders (and IMEs) count the number of “clicks” that the robot has moved—relative to its starting position. Think of it like a car’s trip-counter, which can be set to 0 whenever is necessary. The trip counter displays how many miles (or kilometers) have been travelled since the button was pressed: it is the current position RELATIVE TO the starting position. A shaft encoder is like a trip counter for the robot—it can be set to 0 whenever and, unlike a car’s trip counter, it has the added ability to count backwards, all the way into the negative numbers. And like the trip counter, the encoder can count up very high, until it gets to the maximum set by the manufacturer.

When the robot is turned off, it’s like disconnecting the car’s battery: when it is turned back on, the trip counter/click counter is reset to 0 automatically.

Encoder ==> Relative position

Now think about GPS. The satellite system will give an ABSOLUTE location on the globe of where the car is via latitude & longitude numbers. A potentiometer is more like GPS. It has a value of 0 at its lowest point and a value of 4095 at its highest point; that’s it. When it’s attached to a robot’s movement arm, the potentiometer returns a number from 0 to 4095 that represents the arm’s exact location.

If the car was left alone and turned off, the GPS will give me the same location as when the car was left. The potentiometer is the same way. If the robot was turned off with its arm in a specific place, and the last reading it gives is 1000, when the robot is turned back on it will still read 1000 (provided the arm hasn't moved when it was off). It does not reset to 0, ever.

Potentiometer ==> Absolute position

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
