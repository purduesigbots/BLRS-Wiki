---
description: The six bar lift, the four bar's big brother.
---

# Six Bar

![](../../.gitbook/assets/tu\_atlas\_v1\_lift.jpg)

The six bar lift is a derivative of the [four bar lift](four-bar.md). It utilizes the same geometry of four parallel bars, but in two stages. This split into two stages allows the lift to maintain a lower profile on the robot and condense into a smaller space, allowing for a larger lift to ﬁt within the build limits.

![Visual comparison of the difference in compactness between a six bar and a four bar](<../../.gitbook/assets/six\_bar\_height2 (1).png>)

![Visual comparison of the height difference between a six bar and a four bar when fully raised](../../.gitbook/assets/six\_bar\_height.png)

It is typically recommended that only the top bar on the static end be driven by the motors, as there will be increased friction on the bottom arm as compared to the top. This can be alleviated by utilizing a PID control on the arm to ensure that one motor does not provide more force than the other on a given side, stressing the lift components and motors. As with every lift, using [screw joints](../vex-joints.md#single-bearing-screw-joint) is highly encouraged to reduce friction, decrease slop, and increase strength.

### Pros and Cons Analysis

| Pros                                                                                                                                                                                                                                                                                                                         | Cons                                                                                                                                                                                                                                                               |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| <ul><li>Relatively easy to build and maintain</li><li>If built properly, can reach higher than a <a href="four-bar.md">four bar</a> lift on its own.</li><li>Similar to a four bar, this lift has a relatively easy implementation into a<a href="dr4b.md#the-double-reverse-design"> "double reverse" </a>design.</li></ul> | <ul><li>More torque necessary to lift to full height than a <a href="four-bar.md">four bar</a></li><li>Front heavy when horizontally extended; more likely to tip forward</li><li>Requires more horizontal space than a four bar due to another section.</li></ul> |

Because the lift arm is longer on a six bar than a four bar, more torque is required in order to lift the arm to its full height. The weight and length of the six bar lift also creates additional friction on the joint of the lift and the motors powering it. This can lead to more issues than would be encountered with a four bar lift such as burnt out motors or broken parts. The added length of the lift arm can create a greater tendency for the robot to tip forward when lifting or moving. Heavier loads will increase this chance of tipping. Despite these issues, the six bar lift is a very common lift system as well because it is relatively easy to build and maintain when compared to scissor lifts and reverse six bar lifts. Like the four bar lift, the six bar lift keeps the lifted end at the same angle throughout a lift or decent.

## Resources

[http://www.aura.org.nz/archives/672](http://www.aura.org.nz/archives/672)



### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com) (Purdue SIGBots)
* MTBR (University of Michigan Task Based Robotics)&#x20;
