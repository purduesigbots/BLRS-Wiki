---
description: Motion Profiles and S-shaped driving paths.
---

# Path Planning

![Sample Path](../.gitbook/assets/squiggly.png)

## Concept

Path Planning is a subject of robotics software that involves pre-calculating a series of poses for a robot to follow between a start and end point. Most basic robotics movement simply specifies the starting and ending position, using something like a [PID Controller](control-algorithms/pid-controller.md) to determine how the robot should make that movement. These simpler controllers, however, don't have a concept of many tricky real-world requirements for robot movements like:

* Moving in 2D, both forward/backward and sideways of the starting position
* Avoiding obstacles in the path between the start and end point
* Accelerating and decelerating at a rate that the robot can handle without slipping the wheels

That's where path planning comes in. It's possible to calculate a path, or series of "in-between" points and associated velocities/accelerations, that matches these criteria. A planned path typically comes in the form an array of objects containing:

* The (x, y, heading) coordinates of the point along the path
* The forward velocity and/or the angular velocity that should be commanded to the robot to reach the next point along the path

The [calculations for planning a path](https://squiggles.readthedocs.io/en/latest/maths.html) are typically split into two steps representing the two sets of information specified above: First the points along the path are calculated, and then the required velocity values needed to get to those points are determined.

## Usage

Most teams that use Path Planning do not write their own implementations of the calculations mentioned above. [Okapilib](https://okapilib.github.io/OkapiLib/index.html), a library included by default with [PROS](vex-programming-software/pros/), contains an easy interface for planning paths using the [Squiggles path planning library](https://github.com/baylessj/robotsquiggles/). A tutorial for using this interface is included on the Okapilib documentation site here: [https://okapilib.github.io/OkapiLib/md\_docs\_tutorials\_concepts\_twodmotionprofiling.html](https://okapilib.github.io/OkapiLib/md\_docs\_tutorials\_concepts\_twodmotionprofiling.html)

Using a library like Okapilib to plan paths makes it easier than writing all of the necessary code yourself, but it is still vital to understand the underlying concepts of path planning even when using a library. For starters, you'll need to know enough about what your code is doing to describe it in a Judges Interview, but beyond that, debugging your code and writing code that builds on the path planning library requires an understanding of how path planning works. The Squiggles documentation contains some helpful resources on:

* [Finding a robot's velocity/acceleration/jerk constraints](https://squiggles.readthedocs.io/en/latest/constraints.html)
* [Translating planned path velocities into wheel velocities for a tank drive robot](https://squiggles.readthedocs.io/en/latest/physical-models.html)
* [The math involved in planning the path points and their velocities](https://squiggles.readthedocs.io/en/latest/maths.html)
* [Finding a feedback controller to ensure that the robot follows the planned path](https://squiggles.readthedocs.io/en/latest/controller-suggestions.html)

## Custom Path Planners

While difficult, it is possible to create software for creating or adjusting paths. An example below was developed by OSRC1 for VEX Over Under using the Unity game engine. A path formed from a Bezier curve can be fine tuned by dragging the handles. A custom solution offers advantages such as the ability to display paths over the game field or customize the autonomous development process to suit your team's preferences.

![Sample Path](../.gitbook/assets/OSRC1 path manager.png)

### Feedback Controllers

Okapilib and Squiggles only provide the Path Planning part of 2D movement -- you'll most likely want to supplement that Path Planning with a feedback controller. Running a planned path with Okapilib will send the path's planned velocities to your robot with no way of determining if the robot is actually on course; it's entirely possible that obstacles like game objects, opponent robots, or overheated motors could have caused the robot to not be able to follow the expected path. Using a planned path with no feedback controller is effectively flying blind as a result. It is highly recommended to supplement your planned path with one of the feedback controllers that are designed for path following, such as the:

* [Basic Pure Pursuit](control-algorithms/basic-pure-pursuit.md)
* [RAMSETE Controller](control-algorithms/ramsete.md)

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
* [OSRC1](https://osurobotics.club/) (Dam Robotics)

