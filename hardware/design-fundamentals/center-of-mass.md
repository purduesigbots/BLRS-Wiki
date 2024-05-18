# Center of Mass

{% hint style="info" %}
This article is a Work In Progress. Please let us know how we can improve it.

sig.robotics.purdue@gmail.com
{% endhint %}

The [center of mass](https://en.wikipedia.org/wiki/Center\_of\_mass) (COM) or center of gravity (COG) of a robot is the mean location of all the mass of a robot.

When a robot brakes, the friction between the wheels and the floor rapidly decelerates the robot ( velocity is in the opposite direction of acceleration in this case). This creates a torque around the center of mass of the robot, jerking the back of the robot up. In many cases, the rear wheels lose grip with floor as well.

<figure><img src="../../.gitbook/assets/robot_jump_v7.gif" alt=""><figcaption><p>Example from <a href="https://youtu.be/AgGbRVwO2mA?si=g-fssw963Eb_-3xF&#x26;t=40">6105C Blackout Robotics Tipping Point</a></p></figcaption></figure>

To mitigate jerking in opcontrol, reduce the height of the center of mass off the ground or decrease the max acceleration available to the driver. In programming periods, motion profiling and other motor [control techniques](../../software/control-algorithms/) can be used as well.

<figure><img src="../../.gitbook/assets/com drawing v2.png" alt="" width="528"><figcaption><p>The magnitude of the <a href="torque.md">torque</a> is proportional to the height and magnitude of the braking/slowing force.</p></figcaption></figure>
