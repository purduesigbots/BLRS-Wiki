---
description: The 4 bar lift, the simplest linkage for keeping both ends parallel.
---

# Four Bar

<figure><img src="../../.gitbook/assets/4barCAD cropped.jpg" alt="" width="563"><figcaption></figcaption></figure>

The four bar lift is one of the most used lifts in VEX Robotics competitions due to its relative simplicity and ease of building. The four bar lift is constructed using two sets of parallel bars that move up and down in unison. Two sets of vertical bars line both the front and back of the linkage, so that the lift can be attached to a robot base parallel to to object interaction mechanisms being attached.

In addition to the common parallel configuration, the two rotating bars may be mounting in a [non-parallel](four-bar.md#non-parallel-four-bar) fashion to provide a set amount of angle change on the lifted end of the lift throughout its range of motion. This can be used to adjust the angle of the linkage in its fully elevated state, in accordance with the design goals and game challenges.

One advantage of the four bar lift is how the lifted end will always remain parallel to the static mounting point through the entire duration of a lift or decent, with the exception of non-parallel mounting as mentioned previously. This helps prevent game objects from falling out of the object interaction mechanisms due the lift being inclined or declined. The simplicity of the design also makes four bar lifts very reliable and low-maintenance. Once one is constructed and set up, very little else is necessary to be done and the lift should continue to function without issues. The low number of moving parts allows little to go wrong during operation, and thus sensors and fail-safes are often not necessary.

Because four bar lifts are simple in nature, the linkage does not provide much height advantage. The maximum height of a four bar lift is determined by the length of bar used, which is constrained by the size limitations of the robot itself. While not common, four bar lifts may result in a center of gravity that does not remain over the base of the robot when faced with a heavy load. However, due to the size limitations, this is not often a problem.

### Pros and Cons Analysis

| Pros                                                                                 | Cons                                                                                           |
| ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| Easy to build                                                                        | Lack of height                                                                                 |
| Reliable/Low Maintenance                                                             | Center of gravity is not over the base of the robot (robot could tip when carrying heavy load) |
| Lifted end is parallel to static mounting point, preventing objects from falling out | Lift design is constrained by size of robot                                                    |

### Using Rubber Bands

Besides pressure from the pneumatic reservoir and electricity from the battery, elastic energy from rubber bands is a great way to augment the functions of a robot.  Depending on the placement of the rubber band joints, you can achieve different amounts of friction and lift force on both the up and down stroke of a 4-bar lift.

As a general rule of thumb, if the rubber bands ...

1. decrease in length as the linkage moves, they provide force in support of that movement
2. increase in length as the linkage moves, they provide force against that movement
3. do not change in length by a significant amount, they are either
   1. providing no force
   2. internally resolving the forces as friction or heat and resisting any change in movement.

When the robot lifts an object, the rubber bands should decrease in length with the upstroke and increase in length with the downstroke. When the robot must lift itself (ex. grabbing onto a post and lowering the lift), the rubber bands should increase in length with the upstroke and decrease in length with the downstroke.

{% tabs %}
{% tab title="Example 1" %}
{% embed url="https://www.desmos.com/calculator/lrm3uxxxem" %}
{% endtab %}

{% tab title="Example 2" %}
{% embed url="https://www.desmos.com/calculator/arxl06qmap" %}
{% endtab %}
{% endtabs %}



[Torque](../design-fundamentals/torque.md)



$$
\overrightarrow{\tau} = \overrightarrow{r} \times \overrightarrow{F} \\ \left|\overrightarrow{\tau}\right| = \left|\overrightarrow{r}\right| \left| \overrightarrow{F_\perp}\right| =  \left|\overrightarrow{r}\right| \left| \overrightarrow{F}\right|\sin\theta
$$

where $$\theta$$ is the angle between $$\overrightarrow{r}$$ and $$\overrightarrow{F}$$.

Different rubber band pivot positions that provide more force perpendicular to the c-channels. Consider changing the following variables when refining the banding of the lift: number of rubber bands, rubber band pivot points, length of bars, etc.

#### Twisting

Due to nonoptimal rubber band pivot positions or a really heavy lift, teams may be forced to put many rubber bands between a pair of c-channels leading to twisting or [torsion](../design-fundamentals/internal-forces-stress.md#torsion) in the bars.

<figure><img src="../../.gitbook/assets/4-Bar Twisting.png" alt="" width="375"><figcaption><p><a href="https://www.desmos.com/calculator/nf6lbtnfit">Sectional View of a 4-bar</a> without twist (left) and with twist (right)</p></figcaption></figure>

Possible Solutions

1. different rubber band pivot positions
2. screw joint bracing
3. [box bracing](../misc.-vex-parts.md#box-bracing)
4. [crossbar bracing](best-practices.md#bracing)
5. double-sided banding

<figure><img src="../../.gitbook/assets/77788Y DR4B banding cropped.jpg" alt="" width="563"><figcaption><p>Double-sided banding on a DR4B (77788Y Tower Takeover)</p></figcaption></figure>

### Non-parallel Four-Bar

For lifts which need a larger range of motion than a traditional parallel four-bar or need to change the angle of the end effector as the the input joint rotates, a non-parallel four-bar linkage can be used. To design a non-parallel four-bar, teams can prototype and experiment (recommended), utilize CAD software, or try [online](https://dynref.engr.illinois.edu/aml.html) models.&#x20;

<table data-view="cards"><thead><tr><th></th><th></th><th></th></tr></thead><tbody><tr><td><img src="../../.gitbook/assets/image (239).png" alt="" data-size="original"></td><td><a href="https://youtu.be/DvRGidCQum0?si=V_OV7n3gnu5fWDlJ">1200F</a></td><td>Larger range off motion</td></tr><tr><td><img src="../../.gitbook/assets/Screenshot (387).png" alt="" data-size="original"></td><td><a href="https://youtu.be/CE15DDa7A5o?si=zuESusLcapwDAc80">10Q</a></td><td>Angle changes as DR4B rises </td></tr><tr><td><img src="../../.gitbook/assets/image (241).png" alt="" data-size="original"></td><td><a href="https://youtu.be/Fp1Nd3Lw9Ko?si=kbYcZtziK-ReK25v">663A</a></td><td></td></tr></tbody></table>

<figure><img src="../../.gitbook/assets/Screenshot (388).png" alt="" width="563"><figcaption><p>Mechanical Advantage of Non-parallel 4-bar</p></figcaption></figure>

### Additional Uses

In addition to the widely used use-case of a vertical lift, four bar linkages can be used for many other applications. For instance, a four bar linkage can be rotated 90 degrees, to move with horizontal motion, rather than vertical. This can be used in many different scenarios such as subsystem deploy and passive mechanisms.

![Four bar linkage with standoffs used for intake deploy (95E Change Up 2021)](../../.gitbook/assets/4bi.jpg)
