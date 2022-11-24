---
description: >-
  Joints are attachment points between components used to create mechanisms
  based on rotation.
---

# VEX Joints

{% embed url="https://www.youtube.com/watch?v=rhfNeMwAKnI" %}
This video from team BNS highlights the main joints used in VEX
{% endembed %}

These are the four most common types of Vex Joints:

* Single Bearing Screw Joint
* Compact Screw Joint
* Low Strength Axle Joint
* High Strength Axle Joint

## Single-Bearing Screw Joint

This is the go-to joint in Vex for low-torque rotation applications. Because it is securely fastened to one of the two components, it effectively halves slop and reduces friction in the process. It also benefits from the round shape of the screw combined with the round interior of the bearing.

**Assembly:** This joint is assembled by first securing a screw to one component with a keps nut and attaching a bearing to the second component. Then the screw is placed through the bearing and secured with a lock nut.

![Single-Bearing Screw Joint ](https://user-images.githubusercontent.com/65926085/83469437-4ffe8380-a445-11ea-9b6a-3cc6337e52f2.png)

![Model of a Single-Bearing Screw Joint in CAD](<../.gitbook/assets/screwjoint (1).png>)

Each of the components can be seen in **** the model above, which are listed below:

1. The c-channel that the joint is mounted to, which is typically mounted to the base
2. The screw that the arm rotates around
3. The keps nut that fastens the screw to the first c-channel
4. The c-channel that is rotating
5. The bearing mounted to the rotating c-channel, which reduces the slop of the rotating c-channel around the screw
6. The lock nut that prevents the rotating c-channel from coming off of the screw, but is not tightened down to allow the rotating c-channel to spin freely

**Examples:**

![7700R's Anti-tips](https://user-images.githubusercontent.com/65926085/83479233-a081db00-a45d-11ea-95bb-5ee80833e02a.png)

This screw joint is used to attach the rollers to an anti-tip mechanism on [7700R's Tower Takeover Robot](https://www.youtube.com/watch?v=1mLc1jOCxck). Since the holes in the rollers are round, they rotate freely and with little friction around the screws.

![5225A's Lift](https://user-images.githubusercontent.com/65926085/83524004-989b5880-a4a8-11ea-9d55-71ce4af162ca.png) ![5225A's Lift](https://user-images.githubusercontent.com/65926085/83524557-62120d80-a4a9-11ea-90a1-f28e86cbfa61.png)

This screw joint is used to mount one bottom four-bar of [5225A's In the Zone Lift](https://www.youtube.com/watch?v=sux3YbbbkYY). This mounting solution allows for low friction on the lifting joints, and with 12 of these joints in total, minimizing friction on each is important.

## Compact Screw Joint

This is a high-slop joint which is effective in applications that require compactness. If there is room for a single bearing screw joint, however, the single bearing screw joint is preferable.

**Assembly:** This joint is assembled using a shoulder screw, which is seated more tightly in the metal than a conventional screw. The screw is placed through one component, followed by a washer, followed by the second component and is secured with a lock nut.

![Compact Screw Joint](https://user-images.githubusercontent.com/65926085/83469696-006c8780-a446-11ea-867c-2699c3b91796.png)

![Model of a Compact Screw Joint in CAD](../.gitbook/assets/compact\_screw\_joint.png)

Each of the components can be seen in **** the model above, which are listed below:

1. The c-channel that the joint is mounted to, which is typically mounted to the base
2. The screw that the arm rotates around
3. The washer that is between both c-channels, which reduces friction from the c-channels rubbing together
4. The c-channel that is rotating
5. The lock nut that prevents the rotating c-channel from coming off of the screw, but is not tightened down to allow the rotating c-channel to spin freely

## Low Strength Axle Joint

This is a high-friction, high-slop joint which is used in applications which involve a motor or gears, since a screw joint would not be able to translate rotation the way an axle joint does.

**Assembly:** This joint is assembled by first securing one bearing to each component. Then, the axle is fed through both bearings, with a spacer in between, and secured using a shaft collar at either end.

![Low Strength Axle Joint](https://user-images.githubusercontent.com/65926085/83472269-7116a280-a44c-11ea-8b68-a255596834f0.png)

**Example:**

![5225A's Lift](https://user-images.githubusercontent.com/65926085/83528262-86241d80-a4ae-11ea-9097-4ed572e107f9.png)

This low strength axle joint is used on one lower gear of [5225A's In the Zone Lift](https://www.youtube.com/watch?v=sux3YbbbkYY). Although the other gears use screw joints to minimize friction, this one utilizes an axle to translate the gear's rotation to a potentiometer, which measures the rotation of the gear to determine the lift's height.

## High Strength Axle Joint

This is a high-friction joint which is very effective in high-torque and cantilevered (only supported on one side) applications due to the strength of Vex High Strength Axles. This joint should be used only in very high-torque operations, as it does produce more friction than a single-bearing screw joint.

**Assembly:** This joint is assembled by first reaming or drilling (drilling is preferred, but reaming is an acceptable alternative) a 1/4" diameter hole (or slightly larger to accommodate for wiggle) in both components, securing a high strength bearing to each. Similarly to the low strength axle joint, the axle is fed through both bearings with a high strength washer between and two high strength collars to secure it.

**Example:**

![8066Y's Lift](https://user-images.githubusercontent.com/65926085/83531142-321b3800-a4b2-11ea-82ec-83ef2ec4d7ca.png)

This high strength axle joint is used on [8066Y's Early Season Tower Takeover Lift](https://www.youtube.com/watch?v=CHXg5mqd-EM). Because it needed to lift several cubes, this high strength option was used rather than a screw joint. This lift also benefits from the long high strength axle connecting the two sides, thereby reducing tilt.

### Contributing Teams to this Article:

* [2775J](https://www.youtube.com/channel/UCxpfFq6ShDvgmU9P4y6rc\_Q?view\_as=subscriber) (Jackson Area Robotics)
