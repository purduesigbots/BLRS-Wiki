# Sensors and Odometry in Autonomous

You can't really have good software without sensors, and the quality of the readings from your sensors is often the determining factor in having competitive code. As a result, it's important to ask for sensor placement on the robot to avoid being completely at the mercy of mechanics and electronics.

## Drives

Drivetrain sensing is one of the most difficult problems in autonomous coding. Driving in auton is way easier when you know exactly where the robot is, but getting an accurate 2D state for the robot is a difficult problem for even professional robotics engineers. There are a couple of techniques for doing this within the realm of VEX.

### Internal Encoders on the Drivetrain

Easiest and most common option. VEX V5 Motors contain internal encoders. By using the motors on the Drivetrain we can get encoder data from the robot. Simple enough, but full of issues.

Wheel slip is the biggest problem - even with proper slewing, the wheels tend to slip when the robot is told to start moving. This causes the encoders to return inaccurate values.

Slop is another problem - the wheels, chain, and motors all have some wiggle room in them that means that the robot can usually move by an inch or so without any noticeable difference in the encoder readings.

Wheel scrub is another problem - when using omni wheels, the robot often doesn't turn perfectly on a point, which causes the turning readings to be off.

See the photos of [Plutarch](https://phabricator.purduesigbots.com/w/wiki/past_robots/plutarch) for an example of this.

### Encoders on the powertrain, gyroscope for turns

This is basically the same as above, but with a gyroscope sensor for turns instead of taking the difference in encoder readings. This improves turns quite a bit - you don't have to worry about wheel scrub with this. The VEX gyro tends to drift though, so the heading won't be accurate for any more than a couple of movements before it's off by quite a lot. This can be improved a lot with a nicer gyro, see BNS' worlds winning skills run in Starstruck [https://www.youtube.com/watch?v=td6PAnRBzfM](https://www.youtube.com/watch?v=td6PAnRBzfM). 

This isn't ideal, but it's easy and low profile so it's been used on every robot but [Potato](https://phabricator.purduesigbots.com/w/wiki/past_robots/potato).

In 2019 VEX released the [V5 Inertial Sensor](https://www.vexrobotics.com/276-4855.html) SIGBots plans to acquire this sensor for use in robots. The sensor combines both a a 3-axis accelerometer as well as a 3-axis gyroscope. The combination of these two devices in one sensor allows for effective and accurate navigation, as well as controlling any change in the motion of a robot. The sensor is yet to be fully tested but the general consensus is that this new sensor drifts less and is more accurate.

### 3 Unpowered Encoder Wheels

This is probably ideal for VEX components. Used to great success by the 2018 world skills and match champion 5225a \([https://www.youtube.com/watch?v=4dshnlTWivc](https://www.youtube.com/watch?v=4dshnlTWivc)\), this allows the robot to track its forward/backward, side-to-side, and turning movement with just encoders. By having the encoders on dedicated, unpowered wheels, slip is nearly eliminated and the readings are much more accurate.

The only downside is that the assembly takes up a lot of space, and it may not handle going over bumps well. Other than that, it provides all of the required info about the robot's position and eliminates the issues seen in the above two examples.

This has been used by SIGBots in [Forknerv2](https://phabricator.purduesigbots.com/w/wiki/past_robots/forknerv2/) and Big Chungus

## Lifts

### Potentiometers

Potentiometers are sensors that return absolute position and have a range of ~270 degrees, which in theory makes them perfect for lifts. However, in practicality, the tend to be very inconsistent and can suffer from issues like non-linearity \(a movement of 20 degrees can return either 15 or 25 degrees depending on where in the pot's range you are\) and generally breaking and failing to ever again return a value. Some teams have used 3rd party potentiometers \(such as those found on electric guitars\) to reduce friction and improve reliability.

One important thing to remember about potentiometers is that they have a hard stop limit at 270 degrees, making them impossible to use on shafts that rotate past that limit.

**Rotating a potentiometer past its hard limit will break the potentiometer.**

### Encoder and Limit Switches

The encoder/limit switch combo is a way of emulating the absolute position returned by a potentiometer, but without many of the drawbacks of potentiometers \(bad reliability in particular\). This setup is much more reliable, but does not have as much resolution as a potentiometer \(360 ticks in a revolution compared to 4095 in 270 degrees\) and is more bulky, which has traditionally been the reason for not using this setup.

