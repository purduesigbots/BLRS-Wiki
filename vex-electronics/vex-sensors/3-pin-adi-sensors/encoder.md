---
description: The VEX Encoder helps to determine the rotation of a shaft.
---

# Encoder

![](https://phabricator.purduesigbots.com/file/data/54s75mmpwzdb65b4lgyw/PHID-FILE-jcpdq2662cm3q6ec7wk2/optical\_shaft\_encoder-300x300.jpeg)

The [**VEX Quadrature Encoder**](https://www.vexrobotics.com/276-2156.html), or simply the **VEX Shaft Encoder**, is a two-port device which counts the number of times that a spinning axle has rotated. Both ports are outputs and output periodic pulses corresponding to movements of the shaft in question. This sensor must not be confused with the discontinued "VEX Optical Shaft Encoder" which is not a quadrature device and only counts rotation in one direction.

## Plan for it in your design

As with [potentiometers](potentiometer.md), using these encoders requires advance planning. As you can see from the product image above, these items take up space (they’re more than 3/4″ thick). On a chassis they are typically installed in between the wheel’s supporting c-channels (the structure of one side of the chassis is something like: c-channel, wheel, encoder, c-channel, with spacers & shaft collars thrown in as needed). These sensors come in a handy 2-pack because you often use one on each side of your robot’s chassis to help you keep the robot driving straight in autonomous mode, in addition to knowing how far you’ve gone.

The chassis is not the only place to use these sensors, but it is the most popular.L

### Lots of Ports

Once you’ve got a lot of sensors on your robot, the analog & digital ports can fill up fast. 4 shaft encoders = 8 ports; you get the idea.

## How it works

[![](https://phabricator.purduesigbots.com/file/data/paq4de3gkt25tgfelzkx/PHID-FILE-lhgjpb2ysj3h7ff4s6y2/shaft\_encoder\_insides.png)](https://phabricator.purduesigbots.com/file/data/paq4de3gkt25tgfelzkx/PHID-FILE-lhgjpb2ysj3h7ff4s6y2/shaft\_encoder\_insides.png)

Inside the red box is an infrared light and a sensor on opposite sides of a wheel with lots of little holes/slots in it (image at right). The sensor can tell when light is shining through the holes and when it is not, and thus can count the number of “clicks” that have gone past its viewing window. One full revolution includes 360 clicks (not 90 clicks, as described on the downloadable info sheet).

The reason that these encoders have 2 wires (the older model had only one sensor/one wire) is that the second wire—attached to a second sensor inside the device—allows the [V5 Brain](../../vex-electronics/vex-v5-brain/) to know which direction the wheel is spinning. One could use these sensors with just one wire plugged in—simulating the older version of the component—if (a) you don’t care what direction the wheel is moving, (b) you know it will only move in one direction in your usage, AND (c) you have so many sensors and gizmos that you have run out of digital ports on the [V5 Brain](../../vex-electronics/vex-v5-brain/).

Underneath it all, these shaft encoders are indeed digital sensors. When the infrared light makes it from the light to the light sensor through one of the open slots, the encoder spits out a 0 (LOW). When the light is blocked it spits out a 1 (HIGH). The [V5 Brain](../../vex-electronics/vex-v5-brain/) keeps track of these 1s and 0s to generate a running count of clicks. Combined with information from the second wire to the [V5 Brain](../../vex-electronics/vex-v5-brain/) (which gets data from the second infrared sensor inside the device), it knows what direction the shaft/wheel/encoder is moving: the [V5 Brain](../../vex-electronics/vex-v5-brain/) knows whether to add to its click count or subtract from it.

## Relative vs. Absolute Position

There’s an important distinction to be made here between encoders and potentiometers; understanding it will help you figure out which sensor you need for the task at hand.

Shaft encoders (and IMEs) count the number of “clicks” that your robot has moved—relative to its starting position. Think of it like your car’s trip-counter, which you can set to 0 whenever you please. The trip counter tells you how many miles (or kilometers) you’ve travelled since you pressed the button: it’s your current position RELATIVE TO your starting position. A shaft encoder is like a trip counter for your robot—you can set it to 0 whenever you please and, unlike a car’s trip counter, it has the added ability to count backwards, all the way into the negative numbers. And like your trip counter, the encoder can count up very high, until it gets to the maximum set by the manufacturer.

When you turn off the robot, it’s like disconnecting your car’s battery: when you turn it back on, the trip counter/click counter is reset to 0 automatically.

Encoder ==> Relative position

Now think about GPS. If you check your GPS location right now, the satellite system will give an ABSOLUTE location on the globe of where you are via latitude & longitude numbers. A potentiometer is more like GPS. It has a value of 0 at its lowest point and a value of 4095 at its highest point; that’s it. When it’s attached to a robot’s movement arm, the potentiometer returns a number from 0 to 4095 that represents the arm’s exact location.

If I go on holiday and come back to my house, the GPS will give me the same location as when I left. The potentiometer is the same way. If you turn off the robot with its arm in a specific place, and the last reading it gives you is 1000, when you turn the robot back on it will still read 1000 (provided you haven’t moved the arm when it was off). It does not reset to 0, ever.

Potentiometer ==> Absolute position

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
