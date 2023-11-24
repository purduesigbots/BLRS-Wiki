---
description: Shooting things and busting encoders
---

# Flywheel

A flywheel is a mechanism that is designed to store rotational energy as efficiently as possible. This is done by spinning a wheel or disk at very high speeds with very little friction. In VEX, the main application is to launch objects long distances. They are often chosen over other shooting mechanisms for their ability to shoot at variable distances and with variable forces.

To control any type of flywheel, you have a few options. You can either max out the voltage/velocity, but if you would not like the maximum force of your motor, it is highly recommended to use a PID controller to keep the speed of your flywheel consistent. Without a PID controller, your flywheel will be in a loop of over and undershooting the speed, causing inaccurate results. 

## Single Flywheel

A single flywheel is by far the most common flywheel used in Vex because of its consistency and accuracy. Single flywheels use a single wheel spinning at high RPMs with a back plate (most commonly Lexan or ABS). The back plate is formed around the wheel and tuned for the right amount of compression (varies based on the object being fired) and cut to the desired launch angle of the object. The biggest benefits of single flywheels over double flywheels are their consistency, reduced use of motors, and distance because of greater backspin. They're consistent because of their back spin with the plate, and only tuning of one motor.

Single flywheels were the dominant design of Nothing But Net. Below is a picture of 1104M in the world finals with a single flywheel (3/6 finals teams in NBN were 1104 with essentially the same robot).

![1104M in Nothing But Net](<../../.gitbook/assets/image (46) (2) (1).png>)

[\
](https://photos.google.com/share/AF1QipNNjcP0x0m8bZmBkSu5inbOiscVHZwB8Fp6W825U3eTzoIW0\_acUYFtxjSFceFQ4w/photo/AF1QipNV5kItJyJIBCltrm17i8POyO5yCpN8sWXEORM2?key=UjBoUlJTVjR3djlObzFjQlRzREdSd2dYeHlYdnRn)This flywheel spun at extremely high RPMs and had the majority of the wheel’s mass on the very outside of the wheel which increased its moment of inertia thus making it easier to fire several balls in succession. This was paired with a ratchet and pawl that allowed the wheel to coast with no motor power and maintain most of its speed.

Single flywheels were also common in Turning Point where the main goal was precision and power. Robots like 169A chose flywheels because they are very consistent, and allowed for quick double shots (especially later in the season). 169A’s robot is shown below.

![Team 169A Turning Point](<../../.gitbook/assets/image (43).png>)

\
This robot used many mechanics similar to what 1104 did in NBN. The biggest innovation of this robot was the addition of an angle-changing hood. This hood allowed for the robot to shoot 2 flags(of different heights) very quickly and very accurately.

\
Both above robots can be found in CAD designs [here](../../vex-cad/remembering-the-best/). (Courtesy of Zach from 929)

## Double Flywheel

A Double flywheel is similar to a single flywheel but instead of a backboard has another rotating wheel. These wheels are often placed horizontally next to each other (but have also been done vertically). They are much more advanced and allow for more tuning, most commonly changing the speed of a wheel to adjust the projectile’s path. When vertical, the wheels can have different speeds that allow for more/less backspin to make the object fly at different distances. Double flywheels are larger, and heavier, but most importantly need more compression because of the reduced contact time with the ball. This means that they take longer to spin up and put more strain on the motor. Another aspect of a Double flywheel, is that if you want one motor, you need a gear train to make sure that the send wheel is spinning in the opposite direction.&#x20;

Below is VCAT Robotic’s nothing-but-net early season 15” VexU robot. It is one of the better-known double flywheels. They did however change the design soon after this to use a single flywheel.

![VCAT Early Season Nothing But Net 15" Robot](<../../.gitbook/assets/image (47).png>)

### Teams Contributed to this Article:

* [91A](https://www.vexmen.com/about/) VEX-Men

