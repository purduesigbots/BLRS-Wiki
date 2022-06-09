---
description: The physics behind VEX motors
---

# DC Motor Basics

Direct Current (DC) Motors like the [ones used on VEX robots](../../vex-electronics/vex-electronics/motors.md) move in accordance with a few physics equations. An understanding of these equations will help clarify the relationship between the values commanded to the motor from software and the physical movement of the motor.

## Prerequisites

* A basic understanding of electronics (really just [Ohm's Law](https://en.wikipedia.org/wiki/Ohm's\_law))

## Velocity

The velocity of the motor roughly correlates to the voltage that is commanded to it.

The full equation is:

$$
\omega  = K_v * (V - I * R)
$$

The angular velocity of the motor, or $$\omega$$, is equal to the motor's velocity constant, $$K_v$$, multiplied by the difference between the voltage commanded to the motor, $$V$$, and the actual voltage drop across the motor, $$I * R$$.&#x20;

Those familiar with electronics will probably be asking - why wouldn't $$V$$ be equal to $$I * R$$ here, like Ohm's Law says? This is because the commanded voltage is distributed across two outputs of sorts with the motor:

* The DC voltage drop based on the current, $$I$$, and relatedly, the torque provided by the motor (see Torque)
* The "back-EMF" (**E**lectro**M**otive **F**orce). This is the voltage drop accross the motor corresponding to the velocity of the motor. The faster the motor is spinning, the more back-EMF is produced.

We can rewrite the equation above to show the commanded voltage as the sum of these two voltages:

$$
V = I * R + \frac{\omega}{K_v} = Volt Drop + backEMF
$$

This back-EMF component, interestingly, is also the explanation for how electric generators work. Traditionally a voltage is provided to a motor to make it spin. This relation works in the opposite direction too though - so manually turning a motor will produce a voltage on the motor. The faster you spin the motor, the larger the voltage produced. On the VEX Cortex you could observe this by spinning a 393 motor fast enough to turn on the Cortex LEDS while there wasn't a battery plugged in.

## Torque

The second kind of output from a DC motor is **torque**. Torque is the rotational force provided by the motor. A motor on the drivetrain for a heavy robot will need to produce a lot of torque to get the robot moving, while a motor on a flywheel should produce relatively little.

The torque that a motor produces is directly related to its current draw:

$$
\tau = K_t * I
$$

The torque, $$\tau$$, is equal to the current drawn by the motor, $$I$$, multiplied by a torque constant, $$K_t$$. &#x20;

## Combining the Two

If we substitute our torque equation into the voltage/velocity equation, we get:

$$
V = \frac{\tau}{K_t} * R + \frac{\omega}{K_v}
$$

The voltage provided to the motor will become a mix of torque and velocity. If the motor is stuck by some external force and cannot move at any velocity, then all of the provided voltage will go toward providing as much torque to try to get the motor moving.

## Determining the Constants

### Torque Constant (K\_t)

The torque constant of a motor is equal to the torque provided by the motor divided by the current draw of the motor **while stuck and under stall**.&#x20;

The following PROS code will find $$K_t$$:&#x20;

```
void motorKt() {
	okapi::Motor m(5);
	m.setGearing(okapi::AbstractMotor::gearset::blue);
	m.moveVoltage(12000);
	while (true) {
		double kt = m.getTorque() / (m.getCurrentDraw() / 1000);
		printf("%f %d %f\n", m.getTorque(), m.getCurrentDraw(), kt);

		pros::delay(10);
	}
}
```

The $$K_t$$ value for a motor with a Blue (600RPM) gearset is roughly: **0.198**.

### Resistance (R)

The motor's resistance, $$R$$, is equal to the voltage provided to a motor divided by its current draw **while under stall**.&#x20;

The following PROS code will find $$R$$:

```
void motorR() {
	okapi::Motor m(5);
	m.setGearing(okapi::AbstractMotor::gearset::blue);
	m.moveVoltage(12000);
	while (true) {
		double r = (double)m.getVoltage() / (double)m.getCurrentDraw();
		printf("%d %d %f\n", m.getVoltage(), m.getCurrentDraw(), r);

		pros::delay(10);
	}
}
```

The R value for a 600RPM V5 Motor is roughly **3.84** Ohms.

### Velocity Constant (K\_v)

The velocity constant of a motor can be calculated after finding the resistance. Command a voltage to the motor (while it is not connected to anything or under stall) and measure the velocity and current draw of the motor. Plug those values into the [combined equation](dc-motor-basics.md#combining-the-two) and solve for K\_v.

The following PROS code will find $$K_v$$:&#x20;

```
void motorKv() {
	pros::Motor m(5);
	m.set_gearing(MOTOR_GEARSET_06);
	const double r = MOTOR_BLUE_R;
	m.move_voltage(12000);
	while (true) {
		double vel = m.get_actual_velocity();
		double kv = (vel * 0.1047) /
		            ((m.get_voltage() / 1000) - 
		             (m.get_current_draw() / 1000) * r);
		printf("%f %d %f\n", vel, m.get_current_draw(), kv);

		pros::delay(10);
	}
}
```

A 600RPM V5 Motor has a K\_v value of roughly **6.68**.

### Converting Constants for Other Gearsets

The $$R$$ value is consistent for each gearset -- the $$R$$ value should be roughly the same for a 100RPM V5 motor and a 600RPM motor. The $$K_v$$ and $$K_t$$ values, on the other hand, will scale according to the gearset used. A 100RPM motor has **6** times the torque and **1/6** the velocity of a 600RPM motor, so its $$K_t$$ value will be 6 times as large and its $$K_v$$value will be 1/6th as large compared to the 600RPM motor's constants.

## Contributing Teams to this Article

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
