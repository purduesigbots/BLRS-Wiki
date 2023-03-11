---
description: Originally written by Team 5225A, the E-Bots PiLons. Thanks!
---

# Odometry

## Motivation

The Absolute Positioning System (APS) had been a concept that our programmers had thought about and discussed for a few years, mostly hypothetically. The APS is a system that keeps track of the absolute position (i.e. cartesian coordinates) and orientation of the robot during a game autonomous or programming skills run. After the conclusion of the Nothing but Net season, the PiLons programmers decided to start developing it for real. Over the following \~2 years, they went through several iterations of both the tracking algorithm itself (which uses sensors to keep track of position and orientation), and the coupled motion control algorithms (which use the position and orientation information to follow a planned route). Function calls to the motion control algorithms were then used as building blocks for game autonomous and programming skills runs.&#x20;

After the use of this system played a major role in the PiLons becoming the 2018 World Tournament Champions and Robot Skills World Champions, they have had many requests from various other members of the VEX community for information on how their system was made. While they are always tempted to boil it down to "thousands of hours of time and most of \[their] sanity", they also decided to write and release this document as a resource for all.&#x20;

## Units&#x20;

It is recommended to use inches as units for distance (and thus position), as all VEX field measurements are in imperial/customary units. For angles, radians (at least internally) work better because they are the native output of the algorithm, and also the native unit for built-in trigonometric functions. Above all, however, it is extremely important to use the same units everywhere (i.e. if a part of the code uses inches, then everything distance-related is in inches, speed is in inches per second or per millisecond, etc.). Not doing so will require additional unit conversions, which are easy to mess up, and also require more calculations than necessary (this can already push the limits of the Cortex M3).&#x20;

## Definitions and Conventions&#x20;

On this page, a column notation for vectors is used (it looks like a 2x1 matrix); for example, a vector with x-value 𝑎 and y-value 𝑏 would be written as:&#x20;

&#x20;                                                                               $${a}\brack{b}$$                                                                            (1)​

The following variables are used in this document to represent physical parameters and other known values: &#x20;

* $$s_L$$ is the left-right distance from the tracking center to the left tracking wheel&#x20;
* $$s_R$$ is the left-right distance from the tracking center to the right tracking wheel&#x20;
* $$s_S$$is the forward-backward distance from the tracking center to the back tracking wheel
* $$\overrightarrow{d_0}$$ is the previous global position vector&#x20;
* $$\theta_0$$ is the previous global orientation &#x20;
* $$\theta_r$$ is the global orientation at last reset

## Tracking Theory (aka Odometry)&#x20;

This is the core of the position tracking system, providing the rest of the robots’ code with live data on the current position and orientation (represented as a position vector 𝑑 , and orientation 𝜃) of a predefined point on the robot (called the “tracking center”, see Figure 1). Note that the tracking wheels can be placed anywhere along the dotted lines without affecting the math; it is the perpendicular distance to the tracking center that matters, as explained below.&#x20;

![Figure 1: A sample robot base with tracking wheels](<../.gitbook/assets/odom 1 invert.png>)

### Tracking Using Arcs&#x20;

Position tracking works by modelling the robot's motion (i.e. the motion of the tracking center) as an arc over an infinitely short time interval. Figure 2 shows the same robot as above following an arc with a 5' radius for 15°. Note the assumption for this simple example that the robot does not move toward or away from the arc center during the maneuver, and that the tracking wheels are lined up with the center of the robot; it will be shown after that neither of these are necessary. The final robot position is shown in light gray. The left and right wheel paths are both arcs that are concentric with the tracking center's arc. (Concentric means that the arcs have the same center point; this applies in this case, as the robot is effectively rotating around the arc center.)

![Figure 2: A simple example maneuver, with the left and right wheel paths shown](<../.gitbook/assets/odom 2 invert.png>)

There are a few important points to realize from this diagram. Firstly, the arc angle is the same as the change in orientation of the robot. This angle (call it Δ𝜃) can easily be calculated by starting with the arc length formula:&#x20;

&#x20;                                  $$\Delta L = r_L \Delta\theta$$                               $$\Delta R = r_R \Delta\theta$$​                                                (2)                                                                                          &#x20;

&#x20;                                  $$\Delta L =  (r_A+s_L)\Delta\theta$$                  $$\Delta R=(r_A-s_R)\Delta\theta$$                                   &#x20;

&#x20;                                  $$\frac{\Delta L}{\Delta\theta} = r_A+s_L$$                            $$\frac{\Delta R}{\Delta\theta} = r_A-s_L$$​

&#x20;                                   $$r_A = \frac{\Delta L}{\Delta\theta} - s_L$$                             $$r_A = \frac{\Delta R}{\Delta\theta} +s_R$$&#x20;

These two equations can be combined, eliminating the radius (the only unknown):&#x20;

​                                                       $$\frac{\Delta L}{\Delta\theta}-s_L= \frac{\Delta R}{\Delta\theta}+s_r$$                                                                      (3) &#x20;

​                                              $$\Delta L- s_L \Delta\theta = \Delta R + s_R \Delta\theta$$

&#x20;                                              $$\Delta L - \Delta R = \Delta\theta(s_L+s_R)$$​

&#x20;                                                        $$\Delta\theta = \frac{\Delta L - \Delta R}{s_L+s_R}$$&#x20;

Note that this gives a value in radians. Testing it with this example, one gets:&#x20;

&#x20;                                                      $$\Delta\theta= \frac{17.606-13.810}{7.250+7.250}$$

&#x20;                                               $$\Delta\theta=0.2618 \text{ rad}=15.00\degree$$​&#x20;

As can be seen on the diagram, this is correct. This is an example of a "state function"; if any tow  of the following are known (starting orientation, ending orientation, and distance between left and right wheel travel ($$\Delta L - \Delta R$$)), it is possible to find the other one. Since any translation without rotation does not change the _difference_ between these numbers (it changes both by the same amount), this formula applies regardless of where the robot is on the field, or how it got there. This means that orientation can be calculated as an absolute quantity, rather than a relative change from the last arc approximation.&#x20;

Also based on this arc, the translation (change in position) can be calculated. To do this, the radius of the tracking center's arc needs to be known. This can be calculated as the radius of the right side arc plus the offset of the right tracking wheel from the tracking center:&#x20;

&#x20;                                                            $$r_R=\frac{\Delta R}{\Delta\theta}+s_R$$​

A local coordinate system is also needed. Theoretically, any will work, but one that makes the math easier is such that the straight line path from the initial position to the final position is in the positive y direction; this is an offset from the robot's initial "forward" by $$\frac{\theta}{2}$$. Using this convention, the local translation x-coordinate is zero (as we are still ignoring the back wheel), while the y-coordinate is the chord length. The chord length (the straight-line distance between the two endpoints of the arc) is based on the radius and angle change; both are known, therefore the local y-axis translation can be calculated:&#x20;

​                                                    ​       $$\Delta\overrightarrow{d_{ly}} =$$ $${0}\brack{2sin\frac{\Delta\theta}{2}\times(\frac{\Delta R}{\Delta\theta}+s_R)}$$                                                         (5)

Now, it is important to consider what happens if the robot strays from the arc somewhat, resulting in additional translation. This forms a second arc, representing a second component of the robot's movement. This time, the axis is offset from the robot's initial "right" by 𝜃 2 , making it perpendicular to our y component (and thus representative of our local x axis). This arc's radius and chord length can be calculated in much the same as the y component, giving our complete local translation vector:&#x20;

&#x20;                                                          $$\Delta\overrightarrow{d_t}=2sin\frac{\theta}{2} \times{\frac{\Delta S}{\Delta\theta}+s_S}\brack{\frac{\Delta R}{\Delta\theta}+s_R}$$                                                          (6)​

This coordinate system is offset by $$\theta_0+\frac{\Delta\theta}{2}$$ from the global coordinate system. Therefore, by rotating $$\Delta\overrightarrow{d_l}$$ back by that amount, the global translation vector can be calculated. The current position at any time is simply the starting position, plus the summation of all global translation vectors up to that time.&#x20;

### Proof of Axial Position Independence of Tracking Wheels&#x20;

It was mentioned earlier in this document that the tracking wheels can be moved along their line of motion (dotted lines in Figure 1) without affecting the math at all. To demonstrate this, it can be proven mathematically that the rotational motion of an omni wheel does not depend on its position along its line of motion; specifically, it depends only on its line of motion.&#x20;

There are two types of motion that the robot can undergo: translational and rotational. It is trivial to show that the position of the wheel does not matter for translational motion, as the velocity is the same at all points on the robot. However, the proof does get more complicated for rotational motion.&#x20;

As a scenario, this set up is a wheel that is rotating around a point at $${\Delta x}\brack{\Delta y}$$ from the center of the wheel (using the forward direction of the wheel as a positive y-axis), as shown in Figure 3.&#x20;

![Figure 3: Scenario for position independence proof](<../.gitbook/assets/odom 3 invert.png>)

By combining the radius of the arc followed by the wheel with the angular velocity with respect to the rotation center, $$\omega$$, the tangential velocity of the wheel, $$v_t$$, can be found:

&#x20;                                                                            $$v_t=\omega r$$                                                                      (7)

This can then be used to calculate the y-component of the velocity (i.e. what the wheel will measure), $$v_y$$, and simplified using trigonometric ratios:&#x20;

&#x20;                                                                   $$v_y=v_t\times cos\beta$$                                                                  (8)

​                                                                     $$v_y=\omega r\times\frac{\Delta x}{r}$$

&#x20;                                                                       $$v_y=\omega \Delta x$$​

As can be seen, the radius (which is dependent on the y-axis offset of the wheel), cancels out of the equation; the motion of the wheel (as described by its measured velocity) is thus independent of its position along its line of motion.&#x20;

## Tracking Algorithm&#x20;

The algorithm itself consists of a single procedure to perform calculations, which should be called frequently (a cycle period of no more than 10 milliseconds, although it should be noted keeping the cycle time too low will cause undershoots due to the limited resolution of the optical shaft encoders). We recommend using a dedicated runtime task/thread for this process. The procedure can be broken down into a few steps:

1. &#x20;Store the current encoder values in local variables
2. Calculate the change in each encoders’ value since the last cycle, and convert to distance of wheel travel (for example, if the wheel has a radius 2" and turned 5°, then it travelled approximately 0.1745"); call these $$\Delta L, \Delta R,$$ and$$\Delta S$$
3. Update stored "previous values" of encoders
4. Calculate the total change in the left and right encoder values since the last reset, and convert to distance of wheel travel; call these $$\Delta L_r$$ and $$\Delta R_r$$
5. Calculate new absolute orientation $$\theta_1=\theta_r+\frac{\Delta L_r-\Delta R_r}{s_L+s_R}$$ ; please note that the second term will be in radians, regardless of the units of other variables&#x20;
6. Calculate the change in angle $$\Delta\theta=\theta_1-\theta_0$$&#x20;
7. If $$\Delta\theta=0$$ (i.e. $$\Delta L=\Delta R$$), then calculate the local offset $$\Delta\overrightarrow{d_t}=$$$${\Delta S}\brack{\Delta R}$$
8. Otherwise, calculate the local offset $$\Delta {\overrightarrow{d_t}}=2sin\frac{\Delta\theta}{2}\times{\frac{\Delta S}{\Delta\theta}+s_S}\brack{\frac{\Delta R}{\Delta\theta}+s_R}$$(Equation 6)
9. Calculate the average orientation $$\theta_m=\theta_0+\frac{\Delta\theta}{2}$$
10. Calculate global offset $$\Delta{\overrightarrow{d}}$$ as $$\Delta{\overrightarrow{d_l}}$$rotated by $$-\theta_m$$; this can be done by converting your existing Cartesian coordinates to polar coordinates, changing the angle, then converting back
11. Calculate new absolute position  $$\overrightarrow{d_1}=\overrightarrow{d_0}+\Delta\overrightarrow{d}$$

## Writing Motion Algorithms&#x20;

The team has decided not to release the complete motion algorithms that have been created and used by the team. There are several reasons for this, including the ~~hundreds~~ thousands of person-hours that went into their cumulative development, and that while they are more than happy to help out teams that are interested and wish to learn, they do not want to become technical support for a large suite of complex algorithms. Most importantly, the goal is not to release a library for other teams to use; rather, it is to facilitate an incredible learning opportunity that involves complex mathematics and control theory.&#x20;

That being said, they do want to offer as much of a guideline as possible. Below is an arms-length tutorial for developing such an algorithm:

1. A team will need at least two algorithms, as a minimum. One for driving to a point, and the other for turning on the spot. Let's start with the turning on the spot algorithm.
2. Pick a convention. It can be more intuitive to specify angles in degrees, but remember that everything uses radians internally. Pick one or the other as the units for angles passed as parameters to your functions, and stick with it. Also, try to keep the order of equivalent parameters consistent (X before Y, etc.).
3. Start with something the team has used before. There's no right answer, and the math can get very complicated very quickly, so start with something that people on the team are familiar with (it could be PID or TBH, but a plain proportional loop works just as well to start).
4. Every situation is different. The algorithm shouldn't be a black box that is assumed to work perfectly for every scenario; remember that there's no practical limit on how many parameters a function can have. This doesn't necessarily mean passing custom PID constants (or equivalent) to each call, but there should be some way to fine-tune the algorithm(s) for one particular use case without messing up others. A more customizable algorithm means a more useful one.
5. Deal in absolutes. Generally speaking, no parameters should indicate a value relative to the robot's current position or orientation; they should be field-centric. This means the code doesn't say "turn 25 degrees to the right", it says "turn to face 90 degrees from the audience direction" or "turn to face the middle post".
6. Think about making it more versatile in the future. Start with turning to face an orientation, but turning to face a point might be useful too. It also might be helpful to add support for automatically turning to the closest equivalent angle (to avoid doing 270 clockwise when 90 counterclockwise would work). This might require changes to how the code is structured. The more possibilities, the better.
7. Try a wide range of scenarios to see what should be adjustable. The PiLons tested angles from 10 to 360 degrees, with and without a mobile goal, for their final version in In The Zone. In the end, they made a spreadsheet showing ‘ideal’ parameters to pass depending on the scenario, and they were further tuned based on that for each use.
8. Take it step by step. Get each feature working before starting on the next. Not only does this help with time and source code management, but the team will probably learn something that might help them with the next feature. Moving onto the algorithm to drive to a target; start by driving until the robot is past the target before worrying about correcting angle. Then, consider which of the two major types of algorithms is wanted: one that continuously tries to point at the target (fastest), or one that tries to follow a predefined line as closely as possible (most consistent). Also, think about what might happen if the robot is too far off, and make sure it can't end up in an infinite loop.
9. Play it safe. Regardless how perfect the testing environment is, at some point the team will probably want to use this at competition. The field might be different in ways not as negligible as you might think, or there might be another robot (even your alliance partner) in the way. There's no limit to the number of things that can go wrong at competition, so make sure to consider what the robot will do in these scenarios. A good starting point is: if the bot is trying to move but isn't not moving, stop the autonomous. It might also be easier to write this as a separate task that is running continuously, regardless of what the autonomous is doing.&#x20;

## General Programming Tips&#x20;

The PiLons have also decided to include some general suggestions that aren't strictly related to position tracking, but (they hope) will help other teams with this and future projects nonetheless.&#x20;

#### • Make it work. Make it right. Make it fast.&#x20;

This quote, attributed to programmer Kent Beck, provides a good starter priority list for any non-trivial software project. The first priority should be to fulfil the basic functionality requirements by any means possible. Then, without changing the functionality or core algorithms, rewrite/refactor the code until it is easy to use, easy to understand, and thus easy to maintain (within reason). Finally, make it fast; in this context, this applies to both efficiency of the code (factoring out repeated identical calculations is always a good idea), and to the time it takes to reach the target, which can always be faster. It might be better to apply this philosophy at a smaller scale over each iteration or feature addition of your algorithms, but really it is up to you. As always, there is no one right way to do things.&#x20;

#### • Take advantage of version control systems.&#x20;

They highly recommend that you learn to (properly) use a version control system (VCS) such as Git. Not only is this a great way to maintain backups and allow collaboration, using tools such as ‘merge’ and ‘revert’, it is possible to very finely manage changes to the code without messing with source files directly.&#x20;

#### • Use parallel programming wisely.&#x20;

Parallel programming has different names on different platforms. In ROBOTC, it's called "tasks". On modern desktop, mobile and real-time operating systems, including PROS, it's typically called "threads". Regardless, parallelization of code offers many benefits, including having loops waiting on a sensor value; in a traditional, "synchronous" program, this loop would prevent other important code (such as your position tracking algorithm) from running. That being said, it is a very easy technology to overuse. Programs that have too much parallelization can quickly become bug-prone and unmaintainable. For those who are relatively new to programming, they suggest limiting (or avoiding entirely) the use of tasks or threads, at least when starting. Regardless, before starting to use them heavily, we suggest you read up on race conditions and deadlocks. There are several online resources on those topics, and if in doubt, Wikipedia is always a good place to start.

#### Contributing Teams to this Article:

* [QUEEN](https://qvex.ca/home) (Queen's University)
* [5225](https://thepilons.ca/technical-resources/) (E-Bots Pilons)
