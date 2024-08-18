# Center of Mass

{% hint style="info" %}
The center of mass significantly impacts the robot's maneuverability. Make sure to consider its effect on each subsystem _during the design stage_, rather than addressing it after the robot is built.
{% endhint %}

The [center of mass](https://en.wikipedia.org/wiki/Center\_of\_mass) (COM) or center of gravity (COG) of a robot is the mean location of all the mass of a robot.

<figure><img src="../../.gitbook/assets/image (260).png" alt="" width="375"><figcaption><p>Robot in 3D Cartesian Coordinate System</p></figcaption></figure>

## Measuring COM Position

* Model the robot in CAD, and use a "measure"-type tool.]
* Lift the robot by the chassis using 2 fingers. When the robot balances on your fingers, the XY location of the COM will lie in the line formed by your 2 fingers.&#x20;
* [Hang](center-of-mass.md#hanging) the robot, and observe how the robot tilts to settle.

## Vertical COM Position (Z)

When a robot brakes, the friction between the wheels and the floor rapidly decelerates the robot (velocity is in the opposite direction of acceleration in this case). This creates a torque around the center of mass of the robot, jerking the back of the robot up. In many cases, the rear wheels lose grip with floor as well.

<figure><img src="../../.gitbook/assets/robot_jump_v7.gif" alt=""><figcaption><p>Example from <a href="https://youtu.be/AgGbRVwO2mA?si=g-fssw963Eb_-3xF&#x26;t=40">6105C Blackout Robotics Tipping Point</a></p></figcaption></figure>

To mitigate jerking ...

* lower the height of the COM off the ground
  * use lighter materials in the upper sections of the robot (ex. 1x1 L channels on arms, plastic screws / nuts)
  * use heavier materials in the lower sections of the robot
* decrease the max acceleration available to the driver
* implement motion profiling and other motor [control techniques](../../software/control-algorithms/)

<figure><img src="../../.gitbook/assets/com drawing v2.png" alt="" width="352"><figcaption><p>The magnitude of the <a href="torque.md">torque</a> is proportional to the height and magnitude of the braking/slowing force.</p></figcaption></figure>

## Horizontal COM Position (XY)

### Turning

<figure><img src="../../.gitbook/assets/image (262).png" alt="" width="375"><figcaption></figcaption></figure>

The [turning center](../../software/odometry.md#tracking-theory-aka-odometry) of the robot is less predictable if the COM (in the horizontal plane) is far from the midpoint of all the wheels. Keeping the COM centered side-to-side and front-to-back ensures more stable and predictable turning.

### Hanging

| Robot Hanging                                                                                                                                                                       | Simplified Diagram                                                            |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| <p><img src="../../.gitbook/assets/image (259).png" alt="" data-size="original"><br><a href="https://youtu.be/IVRtz8LhicI?si=SgqCc8fkVBB924wO">RI3D for Over Under by JHAWK</a></p> | <img src="../../.gitbook/assets/image (258).png" alt="" data-size="original"> |

The end effector used during a hang is typically implemented with a joint. If the horizontal COM is offset from the point where the robot hangs, the robot will tilt until the COM aligns directly beneath the hanging point.

### Control

To control the position of the COM in the XY plane ...

* place towers optimally after building the chassis
* add/remove weight selectively around the robot
