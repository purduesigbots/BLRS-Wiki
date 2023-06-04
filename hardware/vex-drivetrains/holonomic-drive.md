# Holonomic Drive

Holonomic drives have become a popular choice for VEX Robotics teams due to their enhanced maneuverability and flexibility in movement. These drives allow for precise and agile movement in all directions, providing a distinct advantage in VEX Robotics competitions where accuracy, and agility are crucial. Holonomic drives in VEX Robotics can be further categorized into mecanum drives and omni drives, each with its own unique strengths and limitations. As the demand for advanced robotics technology increases in VEX Robotics competitions, holonomic drives are becoming increasingly popular among teams seeking to gain a competitive edge.

{% hint style="info" %}
Mecanum drives are a type of holonomic drive but are constructed similarly to tank drives so more information can be found at [this link](../../software/control-algorithms/kalman-filter.md).
{% endhint %}

### X Drives

The X-Drive is a bit more complex to build than either the Tank or Mecanum Drives, but it allows for greater maneuverability than the Mecanum Drive.

![X-Drive](https://user-images.githubusercontent.com/65926085/83556810-2a6d8a80-a4d6-11ea-9a5f-f44a0f9f7698.png)

The X-Drive is the most maneuverable and efficient Vex holonomic drivetrain and, unlike the Mecanum Drive, its forward speed is equal to its sideways speed. However, the wheel assemblies take up quite a bit of room on a robot, leaving less space for mechanisms.

One interesting thing to note about the X-Drive is its speed compared to a tank drive. Given a tank drive and an X-Drive with the same wheel size and motor cartridges, the X-Drive has a higher maximum speed. The math behind this is shown in [this article by AURA](https://aura.org.nz/why-is-x-drive-faster/).

![Simpler X-Drive - Codec](https://user-images.githubusercontent.com/65926085/83553426-cd230a80-a4d0-11ea-8731-be887931df6d.png)

This is a [Simpler X-Drive Design](https://www.vexforum.com/t/simpler-x-drive-design/80770) which uses metal attached at an angle rather than 45 degree angle brackets:

It is also a viable option when creating an X-Drive.

{% hint style="info" %}
For the best maneuverability and turning, arrange the wheels in a square shape when building an X-Drive with equal vertical and horizontal distances between wheel centers.
{% endhint %}

**NOTE:** When building an X-Drive, it is best to position the wheels in a square shape (i.e. the vertical distance between wheel centers is equal to the horizontal distance between wheel centers). Although other configurations will work, arranging the wheels in a square creates the optimal maneuverability and turning.

<figure><img src="../../.gitbook/assets/H Drive.jpg" alt=""><figcaption><p>H-Drive - Kentucky</p></figcaption></figure>

{% hint style="info" %}
When building an H-Drive, it is crucial that the center wheel contact the field in roughly the same manner as the other four.
{% endhint %}

**NOTE:** When building an H-Drive, it is crucial that the center wheel contact the field in roughly the same manner as the other four. To accomplish this, the mounting for this wheel can be spaced down slightly, or a tensioning system can be used to pull the center wheel into the ground.

This video highlights performance differences between several drive trains commonly used in VEX:
