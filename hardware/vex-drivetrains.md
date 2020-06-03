---
description: >-
  Vex drivetrains are assemblies, generally made of wheels, used to traverse the VRC field. Each drivetrain has its own set of advantages and disadvantages.
---

# VEX Drivetrains

This video highlights several drivetrains commonly used in Vex:

[![VEX Drivetrains](http://img.youtube.com/vi/VfuA2EqaIso/0.jpg)](https://www.youtube.com/watch?v=VfuA2EqaIso "VEX Drivetrains")

In addition, [this article by Vex](https://kb.vex.com/hc/en-us/articles/360035952771-How-to-Select-a-Drivetrain) goes into great detail about the nuances of each drive as well as how to select one.

These are the four most common types of Vex Drivetrains:

- Tank Drive ("Bling Drive")
- Mecanum Drive
- X-Drive
- H-Drive

The drivetrain you choose will depend on the tasks you want your robot to accomplish.

## Tank Drive

![Tank Drive](https://user-images.githubusercontent.com/65926085/83547350-b0360980-a4c7-11ea-8a5b-f30013d2cb0f.png)

This is by far the most common and simplest drivetrain in Vex. It generally uses 4-6 omni or traction wheels, half on each side, allowing for forward and backward movement, as well as turning.

**Advantages and Disadvantages:** The Tank Drive is very simple to build and consistently performs well. Many former world champions have used the Tank Drive for its simplicity. However, it suffers both from being able to be pushed sideways and from an inability to strafe. 

One solution to the problem of being pushed from the side is commonly referred to as the **"Bling Drive"**:

![240P's Drive](https://user-images.githubusercontent.com/65926085/83548634-add4af00-a4c9-11ea-9cc3-8978cab7d53a.png) ![8059A's Drive](https://user-images.githubusercontent.com/65926085/83548438-60f0d880-a4c9-11ea-8bf0-a045e34b387f.png)

This type of drive was utilized by [240P's Early Season Turning Point Robot](https://www.youtube.com/watch?v=06cEBmGx7Fo) and by [8059's Turning Point Robot(s)](https://www.youtube.com/watch?v=NX6mLf8iO34). This drive was common in Vex Turning Point because of the defensive nature of the game.

The "bling", in this case, refers to the screws placed in the center omni wheel to stop sideways motion. While this can also be accomplished using a traction wheel, Vex traction wheels have a slightly smaller diameter than omni wheels. For this reason the "blinged" omni wheel is preferred. Note that the "blinged" omni is placed in the center of the robot so as to maintain a more natural center of rotation (more or less aligned with the robot's center of gravity).

An alternative to bling drive which is becoming more and more prevalent is wrapping a Vex traction tire around a 30-tooth sprocket as shown in [7700R's Tower Takeover Robot Explanation](https://youtu.be/1mLc1jOCxck?t=324). This diameter of this assembly is very close to the diameter of a 4" Vex omni wheel, making it a viable alterative for those who don't wish to put screws in omni wheels.

## Mecanum Drive

![Mecanum Drive](https://user-images.githubusercontent.com/65926085/83550465-8206f880-a4cc-11ea-87b7-bb26af8c5626.png)

The Mecanum Drive is just as simple to build as the Tank Drive, but has the ability to drive sideways. It uses Vex Mecanum wheels in order to drive, turn, and strafe.

**Advantages and Disadvantages:** The Mecanum Drive is simple to build and, while mecanum wheels are thicker than omni wheels, it takes up little space. The Mecanum Drive is also difficult to push from the side, however it strafes more slowly than it drives forward. Because Vex mecanum wheels have only 7 sets of rollers, driving is often "clunky", which is a disadvantage when programming autonomous functions using the integrated motor encoders.

![7K's Drive](https://user-images.githubusercontent.com/65926085/83552256-14100080-a4cf-11ea-8362-56dd9513c343.png)

The Mecanum Drive was utilized by [7K's Tower Takeover Robot](https://www.youtube.com/watch?v=vGkMw4Nx-Ks). Mecanum wheels are especially effective in games like Tower Takeover which involve rows of game elements or aligning with the field perimeter.

**NOTE:** When building a Mecanum Drive, the wheels must be orientated in a certain manner to allow for strafing. The most common setup involves the top rollers of the wheels forming and "x" shape as shown above. The important thing here is that wheels in opposite corners have their rollers pointing in the same direction.

## X-Drive

![image](https://user-images.githubusercontent.com/65926085/83556810-2a6d8a80-a4d6-11ea-9a5f-f44a0f9f7698.png)

The X-Drive is a bit more complex to build than either the Tank or Mecanum Drives, but it allows for greater maneuverability than the Mecanum Drive.

**Advantages and Disadvantages:** The X-Drive is the most maneuverable Vex drivetrain and, unlike the Mecanum Drive, its forward speed is equal to its sideways speed. However, the wheel assemblies take up quite a bit of room on a robot, leaving less space for mechanisms.

One interesting thing to note about the X-Drive is its speed compared to a tank drive. Given a tank drive and an X-Drive with the same wheel size and motor cartridges, the X-Drive has a higher maximum speed. The math behind this is shown in [this article by AURA](https://aura.org.nz/why-is-x-drive-faster/).

This is a [Simpler X-Drive Design](https://www.vexforum.com/t/simpler-x-drive-design/80770) which uses metal attached at an angle rather than 45 degree angle brackets:

![Simpler X-Drive](https://user-images.githubusercontent.com/65926085/83553426-cd230a80-a4d0-11ea-8731-be887931df6d.png)

It is also a viable option when creating an X-Drive.

**NOTE:** When building an X-Drive, it is best to position the wheels in a square shape (i.e. the vertical distance between wheel centers is equal to the horizontal distance between wheel centers). Although other configurations will work, arranging the wheels in a square creates the optimal maneuverability and turning.

## H-Drive

![H-Drive](https://user-images.githubusercontent.com/65926085/83558236-5558de00-a4d8-11ea-9052-47b3f9ea525f.png)

The H-Drive is constructed very similarly to the Tank Drive. However, it contains a wheel in the center of the robot which both allows for strafing and prevents being pushed from the side. This is not a common drivetrain choice, but can be a viable one.

**Advantages and Disadvantages:** The H-Drive has more maneuverability and can resist pushing more effectively than the Tank Drive. However, its sideways motion is generally either slower or weaker than its forward motion. In addition, it takes an extra motor to power the center wheel. This takes away one motor from mechanisms, which is often not worth the tradeoff. 

![21000C's Drive](https://user-images.githubusercontent.com/65926085/83559112-a1f0e900-a4d9-11ea-94fb-1e59c18624d6.png)

The H-Drive was utilized by [21000C's Early Season Tower Takeover Robot](https://www.youtube.com/watch?v=gmAoMTFcf20).

**NOTE:** When building an H-Drive, it is crucial that the center wheel contact the field in roughly the same manner as the other four. To accomplish this, the mounting for this wheel can be spaced down slightly, or a tensioning system can be used to pull the center wheel into the ground.

#### Contributing Teams to this Article:

* [2775J](https://www.youtube.com/channel/UCxpfFq6ShDvgmU9P4y6rc_Q?view_as=subscriber) \(Jackson Area Robotics\)





