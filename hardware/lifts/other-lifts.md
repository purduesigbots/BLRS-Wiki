---
description: Other lifts that could possibly be found on robots
---

# Other Lifts

## Two Bar

![2-Bar with Roller Intakes Mounted in Red (CAD of 7K Courtesy of Zach 929U)](<../../.gitbook/assets/image (214).png>)

### Description

Compared to other lifts found on robots, the two bar is one of the easiest and lightest lifts to build. Usually consisting of 4 c-channels (2 used for the tower and 2 for the lift), the two bars are usually used when a robot would like a lift, but one that does not take a lot of space. One of the main downsides and features of a two bar is that the orientation at the end of the lift stays constant despite lift angle. In addition, compared to other lifts, the two bar cannot carry as much weight compared to other lifts. Some examples of the usage of the two bar lift can be found in the game Tower Takeover as shown above.

### Pros and Cons Analysis

| Pros                            | Cons                                                        |
| ------------------------------- | ----------------------------------------------------------- |
| Easy to build                   | Lack of height                                              |
| Very light                      | Cannot carry a large amount of weight                       |
| Does not take up a lot of space | Orientation at the end of the lift changes with lift angle. |

### Best Practices

* Make sure the c-channel is secured on the axle of the motor
* Make sure the axle is secure in the motor.
* If possible, use a gear ratio with a screw joint to reduce slop and increase torque of the motor.

## Chain Bar

![Chain Bar With Tensioned Chain (Courtesy of AURA)](<../../.gitbook/assets/image (193).png>)

### Description

With a similar appearance to a 2-bar, the chainbar has the compactivity of a 2-bar but with the capability to keep its mounting orientation constant throughout its movement.

This is done by adding a fixed orientation sprocket at the base of the lift bar, and then adding a free-turning one at the end of the lift bar with both being constrained by chain. If an intake or mechanism is mounted on the sprocket(s) at the end of the lift, the mechanism will maintain the same orientation throughout the lift's movement.

### Pros and Cons Analysis

| Pros                                                                                    | Cons                                                                               |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| Very compact and lightweight                                                            | Non-Linear Movement (of the lift)                                                  |
| Moderate buildability, with it being comparable to a 2-bar but slightly harder to build | The maintenance might be slightly harder due to the chain needing to be tensioned. |
| Maintains fixed orientation for the mounted mechanism, unlike a 2-bar.                  | <p>There is a chance the chain may break</p><p>during a match.</p>                 |

### Best Practices

* Best practices for 2-Bar also applicable here
* Make sure chain is tight, avoid using mechanical tensioners as seen in picture above if possible to increase mechanical efficiency.
* Try to keep the mounted intake or subsystem light, to reduce load on chain.

## Elevator/Cascade Lift

![Cascade Lift Retracted (Left) and Extended (Right) Courtesy of Josh 99904A](<../../.gitbook/assets/image (123).png>)

Example: NorCal 2021 Robot (View in .5x or full screen):

{% embed url="https://codepen.io/willxucodes/pen/MWmZjyO" %}

Example: [Jpearman Prototype](https://jpearman.smugmug.com/Robotics/NewTrippleLift)

### Description

A cascade or elevator lift is a lift that provides an immense amount of height, while taking not a lot of space. It utilizes c-channels, sprockets, and chain to connect each bar together. These bars run parallel to the structural frame of the lift, which is connected to the chassis of the robot. Issues that are prevalent among cascade lifts is the lack of support found on the lift, as when fully extended, the linear characteristic of the cascade lift could cause issues in preventing the lift from failing. In addition, the difficulty in tuning and repairing cascade lifts due to its compactness makes it difficult for quick repairs or adjustments when failures do occur.

### Pros and Cons Analysis

| Pros                                              | Cons                                                                                                                             |
| ------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Very Linear Movement                              | Mechanically inefficient due to surface contact                                                                                  |
| Very compact relative to a bar lift               | Relatively hard to build due to multiple stages in the lift                                                                      |
| Mounting point can be easily made a flat surface. | Maintenance is an issue, as reattaching the chain means looping it around multiple sprockets in potentially hard to reach areas. |

### Best Practices

* Reduce friction between the c-channels
* Make sure the chain used is tight
* Try to reduce weight of structural c-channels by using thinner c-channels or aluminum without degrading structural stability.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
