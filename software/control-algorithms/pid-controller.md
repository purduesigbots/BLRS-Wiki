---
description: >-
  A bang-bang control only uses the current value, a PID control schemes also
  may utilize information about the past values and predicted future values to
  optimize control
---

# PID Controller

## Theory

Consider a kitchen stove which is to be heated to 350 degrees Fahrenheit. Initially, the stove begins at room temperature, hopefully less than 100 F, and so must obviously become warmer. Bang-bang control might naively try to turn the stove heat fully on if the temperature is less than 345 F and turn it fully off if the temperature is greater than 355 F. While this might appear to keep the temperature within a +/- 5 degree range of the target, it is entirely possible that the temperature could exceed these bounds, as turning the heating coils "off" will probably still contribute a fair amount of heat to the stove temperature while the coils cool down, leading to wild temperature oscillations.

One might try to improve this scheme by adding additional [intermediate states](../finite-state-machine.md) with the oven elements on at some partial amount, but this is difficult to maintain and adapt. A more intelligent scheme will use the other information that every analog sensor tells a smart controller:

* **History** - Analog sensors have past values that provide a story of how the system reacted to previous changes \(the _integral_ term\). This is generally determined by adding input values to a running total.
* **Future** - The current rate of change of an analog sensor is often useful in predicting the next few values \(the _derivative_ term\). This is generally computed by finding the difference between the last two input values.

In the kitchen oven case, derivative control would be important to prevent oscillating around the target value; the heater can be turned down before the target temperature is reached when derivative control predicts that the temperature will reach the desired set-point soon. Likewise, if the temperature is not rising as quickly as it should, perhaps because the door is open, the heater temperature will increase as the offsets from the set-point accumulate in the integral term.

## Tuning

For any PID controller, the exact impact of the three terms \(**proportional**, **integral**, and **derivative**\) must be assessed for each implementation. Each term must be multiplied by a constant which is generally only determined by experimentation with the system at hand to determine the best response. Constant choice must balance several factors:

* **Settling time** - For many choices of constants, the system will oscillate one or more times around the target. If the oscillations stop quickly, this is usually not an issue, but sustained oscillation is seldom intended.
* **Overshoot** - PID controllers will usually overshoot the target slightly and come back to the desired value. While such behavior is often mechanically useful to remove gear or chain backlash, too much overshoot will lead to oscillations.
* **Steady-state error** - Some small offset from the target will usually remain due to a variety of possible reasons.
* **Rise time** - The rate at which the controller reaches the target must be carefully monitored. Setting a hard limit on the output rate of change is often acceptable, but some constant choices may limit it implicitly.

Generally speaking, you want to first tune proportion \(P\), then derivative \(D\), and then finally integral \(I\). Some of these values might not be used if the values that come behind it make the controller smooth enough. 

## Refinements

Naive PID controllers can suffer from **integral windup** if some external condition prevents the setpoint from being reached for an extended period of time, causing a huge value to load into the integral term and leading to undesired behavior. For example, if a PID controller is supposed to raise a robot arm, and the robot is disabled for ten minutes, integral windup would accumulate and cause wild oscillations. While the most intuitive method would be to only use the last N input values, a more memory-efficient method is to multiply the integral term by a constant slightly less than one before each accumulation, so the controller "forgets" old integrated error values.

For even better PID control, if some other information about the process is known that allows more accurate estimation of future values, that equation can be substituted for the derivative term. In the stove example mentioned above, one might install a second sensor to measure the room temperature and use Newton's Law of Cooling to estimate the rate at which heat would be lost to the environment based on the current temperature.

## In - Practice

PID controllers have been used by Purdue SIGBots for almost every lift mechanism and even the CC/CV algorithm. A detailed understanding of this control structure is thus invaluable to writing a consistent autonomous routine and a driver-friendly operator control.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) \(Purdue SIGBots\)

