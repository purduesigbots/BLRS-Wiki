---
description: Fancy Arcade Drive for better robot control
---

# Curvature (Cheesy) Drive

Curvature Drive, or "Cheesy Drive", is a controller mapping for operator control that was first popularized by Team 254, The Cheesy Poofs, of FRC. Curvature Drive applies some math to the joystick inputs from a controller to provide a more intuitive driving experience for new VEX (or FRC) drivers

The original Cheesy Drive implementation (from their [2015 Java Code](https://github.dev/Team254/FRC-2015/blob/9dcc11886a49d29f16e597e317c995ca248efaed/src/com/team254/frc2015/CheesyDriveHelper.java#L24)) essentially does three things:

* The "curvature" naming comes from the algorithm's change to the way that the "turn" joystick input is processed. When you a driving forward or backwards and turning at the same time, the turn input affects the curvature of the movement rather than adding/subtracting linearly from the wheel speeds. The turn output is a sum of the throttle and turn inputs, meaning that the robot will turn faster when it's moving forward at a higher speed. Again, the goal here is more control at low speeds. Note that the turn input is not changed when the robot is turning in place, this just affects the way the robot drives in an "S" shaped path.
* Cheesy Drive also applies some non-linearity to the joystick input so that there is more control at the low speeds. Larger changes in joystick inputs result in smaller changes in real speed when driving slow, but when the joystick is pushed to a high speed, you jump up to full speed faster.
* Third, that turn input is affected by a **negative inertia accumulator**. Most robots have a fair bit of turning inertia, which can make it easy to accidentally overshoot a turn. The negative inertia accumulator acts almost like a reverse [integral controller](../control-algorithms/pid-controller.md) - the longer the robot has been turning (fast) for, the slower the robot will turn.

### Implementation

You can find an implementation of Cheesy Drive, with all three components listed above, in the [Team BLRS Turning Point code](https://github.com/purduesigbots/forkner-public/blob/62e1328b7902715035357622d81e4a35cb15ff2f/src/libforkner/drive.cpp#L363) or in the snippet below. The snippet is platform-agnostic, and should run without modification in either PROS or VEXCode.

{% code fullWidth="false" %}
```cpp
// We apply a sinusoidal curve (twice) to the joystick input to give finer
// control at small inputs.
static double _turnRemapping(double iturn) {
	double denominator = sin(PI / 2 * CD_TURN_NONLINEARITY);
	double firstRemapIteration =
	    sin(PI / 2 * CD_TURN_NONLINEARITY * iturn) / denominator;
	return sin(PI / 2 * CD_TURN_NONLINEARITY * firstRemapIteration) / denominator;
}

// On each iteration of the drive controller (where we aren't point turning) we
// constrain the accumulators to the range [-1, 1].
double quickStopAccumlator = 0.0;
double negInertiaAccumlator = 0.0;
static void _updateAccumulators() {
	if (negInertiaAccumlator > 1) {
		negInertiaAccumlator -= 1;
	} else if (negInertiaAccumlator < -1) {
		negInertiaAccumlator += 1;
	} else {
		negInertiaAccumlator = 0;
	}

	if (quickStopAccumlator > 1) {
		quickStopAccumlator -= 1;
	} else if (quickStopAccumlator < -1) {
		quickStopAccumlator += 1;
	} else {
		quickStopAccumlator = 0.0;
	}
}

double prevTurn = 0.0;
double prevThrottle = 0.0;
std::pair<double, double> cheesyDrive(double ithrottle, double iturn) {
	bool turnInPlace = false;
	double linearCmd = ithrottle;
	if (fabs(ithrottle) < DRIVE_DEADBAND && fabs(iturn) > DRIVE_DEADBAND) {
		// The controller joysticks can output values near zero when they are
		// not actually pressed. In the case of small inputs like this, we
		// override the throttle value to 0.
		linearCmd = 0.0;
		turnInPlace = true;
	} else if (ithrottle - prevThrottle > DRIVE_SLEW) {
		linearCmd = prevThrottle + DRIVE_SLEW;
	} else if (ithrottle - prevThrottle < -(DRIVE_SLEW * 2)) {
		// We double the drive slew rate for the reverse direction to get
		// faster stopping.
		linearCmd = prevThrottle - (DRIVE_SLEW * 2);
	}

	double remappedTurn = _turnRemapping(iturn);

	double left, right;
	if (turnInPlace) {
		// The remappedTurn value is squared when turning in place. This
		// provides even more fine control over small speed values.
		left = remappedTurn * std::abs(remappedTurn);
		right = -remappedTurn * std::abs(remappedTurn);

	} else {
		double negInertiaPower = (iturn - prevTurn) * CD_NEG_INERTIA_SCALAR;
		negInertiaAccumlator += negInertiaPower;

		double angularCmd =
		    abs(linearCmd) *  // the more linear vel, the faster we turn
		        (remappedTurn + negInertiaAccumlator) *
		        CD_SENSITIVITY -  // we can scale down the turning amount by a
		                          // constant
		    quickStopAccumlator;

		right = left = linearCmd;
		left += angularCmd;
		right -= angularCmd;

		_updateAccumulators();
	}

	prevTurn = iturn;
	prevThrottle = ithrottle;
	
	return std::make_pair(left, right);
}

```
{% endcode %}

## Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
