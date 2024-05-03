---
description: >-
  A bang-bang control only uses the current value, a PID control schemes also
  may utilize information about the past values and predicted future values to
  optimize control
---

# PID Controller

## Concept

**In Robotics:**

In terms of robotics, this would help robots stop gradually as it reaches a point, instead of having it stop moving its motors or breaking hard as it reaches its target. This is necessary as robots have momentum that can only be gradually slowed down to a halt to maintain accuracy, instead of using a [bang-bang](bang-bang.md) algorithm that does not account for this.

**Real World Usage:**

Consider a kitchen stove which is to be heated to 350 degrees Fahrenheit. Initially, the stove begins at room temperature, hopefully less than 100 F, and so must obviously become warmer. [Bang-bang](bang-bang.md) control might naively try to turn the stove heat fully on if the temperature is less than 345 F and turn it fully off if the temperature is greater than 355 F. While this might appear to keep the temperature within a +/- 5 degree range of the target, it is entirely possible that the temperature could exceed these bounds, as turning the heating coils "off" will probably still contribute a fair amount of heat to the stove temperature while the coils cool down, leading to wild temperature oscillations.

One might try to improve this scheme by adding additional [intermediate states](../general/finite-state-machine.md) with the oven elements on at some partial amount, but this is difficult to maintain and adapt. A more intelligent scheme will use the other information that every analog sensor tells a smart controller:

* **History** - Analog sensors have past values that provide a story of how the system reacted to previous changes (the _**integral**_ term). This is generally determined by adding input values to a running total.
* **Future** - The current rate of change of an analog sensor is often useful in predicting the next few values (the _**derivative**_ term). This is generally computed by finding the difference between the last two input values.

In the kitchen oven case, derivative control would be important to prevent oscillating around the target value; the heater can be turned down before the target temperature is reached when derivative control predicts that the temperature will reach the desired set-point soon. Likewise, if the temperature is not rising as quickly as it should, perhaps because the door is open, the heater temperature will increase as the offsets from the set-point accumulate in the integral term.

## Tuning Terminology

For any PID controller, the exact impact of the three terms (**proportional**, **integral**, and **derivative**) must be assessed for each implementation. Constant choice must balance several factors:

* **Settling time** - The mechanism will sometimes oscillate (go back and forth) one or more times around the target before it finally stops.&#x20;
* **Overshoot** - The distance that a mechanism exceeds over the target value.&#x20;
* **Steady-state error** - The distance between the robot and the target after stopping, which is different from overshoot as it may be a value under the target value.&#x20;
  * This is more common on a drive train, while overshoot is more common on other mechanisms controlled by PID.&#x20;
* **Rise time** - The speed at which the mechanism reaches its maximum velocity.&#x20;

Some of these values might not be used if the values that come before it make the controller smooth enough. Most of the time spent coding PID will most likely not be spent on the algorithm itself, but rather refining these constants to reduce the behavior described above.&#x20;

So practically speaking, how do we modify each of the terms when observing how the robot moves?&#x20;

## Tuning PID

It must be noted that while these are not completely accurate descriptions of what each of the variables do, this is a very surface level way to abstract a subsystem's movement and its relation to each variable. Note that in other articles, P, I, and D may be referred to as kP, kI, and kD as the k simply indicates that the variables are intended to be constants.&#x20;

* **The Proportional (P) Value:**
  * Assuming we have our PID algorithm written properly, **we first start with increasing P which we can define as how aggressively we want the motors to slow down as it gets to the target area, and also speed up on release.** For example, if the robot does not slow down fast enough we may want to lower P, but if it slows down too quickly we may want to increase P. There may be some instances where P may be enough for a certain movement.&#x20;
  * Sometimes the robot might not be consistent enough on just P as the steady state error may be too high, the overshoot/settling time may be too high, but that is where the other constants are useful.&#x20;
  * In a PID loop, the P values will always be non-zero.&#x20;
* **The Derivative (D) Value:**
  * **Increasing D helps to the slow down the robot as it approaches its final destination.** Note that this is in complete contrast to the integral constant (I) and should be used if the robot is overshooting near the end, or to make control of the robot in its final position more consistent.&#x20;
  * For example, if the robot slows down too much when trying to get to its target position, increasing D may help compensate it. This is a symptom that may occur if P is decreased too much in an effort to prevent overshooting.&#x20;
* **The Integral (I) Value:**&#x20;
  * **Increasing I helps to speed up the robot slightly faster it reaches its final destination, and to some degree counteracts D.** It's useful if the robot has a slow settling time as it speeds up the rate at which it approaches the target value.&#x20;
  * This might seem counterintuitive to use if we are using D as well, but it might be beneficial to use all 3 constants to create optimal movement that is both fast and consistent.&#x20;
  * For example, if the robot slows down too much when trying to get to its target position, increasing I may help compensate it.&#x20;
* **General Tuning Tips:**
  * Be sure to only adjust one constant at a time between testing.&#x20;
  * For drives it is common practice to start with tuning first P, then D, and finally I.&#x20;
  * For other mechanisms that may be velocity controlled, first start with P, then I, and then D.&#x20;
  * Remember, you may not use all three constants. Sometimes a P, PD, or PI combination may be enough to achieve quick and consistent motion.&#x20;

## Example:

Check out this [VEX Forum thread](https://www.vexforum.com/t/a-pid-controller-in-robotc/20105) for generalized PID code made in RobotC.

## Refinements

Naive PID controllers can suffer from **integral windup** if some external condition prevents the setpoint from being reached for an extended period of time, causing a huge value to load into the integral term and leading to undesired behavior. For example, if a PID controller is supposed to raise a robot arm, and the robot is disabled for ten minutes, integral windup would accumulate and cause wild oscillations. While the most intuitive method would be to only use the last N input values, a more memory-efficient method is to multiply the integral term by a constant slightly less than one before each accumulation, so the controller "forgets" old integrated error values.

For even better PID control, if some other information about the process is known that allows more accurate estimation of future values, that equation can be substituted for the derivative term. In the stove example mentioned above, one might install a second sensor to measure the room temperature and use Newton's Law of Cooling to estimate the rate at which heat would be lost to the environment based on the current temperature.

## SIGBots Usage

PID controllers have been used by Purdue SIGBots for almost every lift mechanism and even the CC/CV algorithm. A detailed understanding of this control structure is thus invaluable to writing a consistent autonomous routine and a driver-friendly operator control. It remains a fundemental part of [ARMS](https://github.com/purduesigbots/ARMS), a PROS template written by BLRS software developers.&#x20;

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
