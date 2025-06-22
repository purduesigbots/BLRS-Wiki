# Designing a Drivetrain

{% hint style="info" %}
This article is a work in progress
{% endhint %}

The performance of any drivetrain is based not only on the type selected, but also on the quality with which it is designed and built. These Vex Forum threads on [Designing a Quality Drive](https://www.vexforum.com/t/designing-a-quality-drive/81850) and [Designing Another Quality Drive](https://www.vexforum.com/t/designing-another-quality-drive/90920) are great resources for newer teams interested in maximizing their drive's performance.

## Design Considerations

* **Planning:** Set constraints for the drivetrain to best accomplish the tasks in the game (i.e. "The width must be less than 13 inches." or "There must be at least 6 inches of room on the front of the drive to attach a mechanism). By setting these constraints before designing, the processes to follow will be much easier to accomplish.
* **Designing:** CAD tools such as [those found here](broken-reference/) are especially helpful when designing a drivetrain, as they allow the visualization of the drive in its final form. However, a pen and some graph paper is always acceptable alternative. Whatever the method, fully designing the drivetrain before beginning the build is very beneficial. Making sure to account for all spacing.
* **Robustness:** Making sure that the drivetrain follows the mechanics listed in the [Best Practices](best-practices.md) article allows for a sturdy start to the robot. Ensure that your base will withstand competition as well as other internal loads. Robustness includes both a lack of wear and bending over time, as well as excessive wear to each individual component (wheels, motors, bearings, etc.).
* **Efficiency:** Ensure that each wheel assembly (and gear or chain assembly if applicable) has as little friction as possible. A good rule of thumb is that a mechanism is "good enough" if it can spin freely for more than 5 revolutions. Of course, you are the judge of whether or not your mechanisms cause enough friction to affect robot operation. Some common causes of unwanted friction include misalignment (components are not in line, causing rotation to be more difficult) and rubbing (two components are moving against each other). In the latter case, they could be spaced apart, or the material can be changed (metal-metal contact --> nylon-metal contact).

## Simple Drivetrain Designer (if you don't have CAD)

[https://www.desmos.com/calculator/ekm1fwjp1y](https://www.desmos.com/calculator/ekm1fwjp1y)&#x20;

## Common Drivetrain Design Metrics

The design metrics correspond the the drivetrain diagram found [above](designing-a-drivetrain.md#simple-drivetrain-designer-if-you-dont-have-cad).

| Matrics                                    | Value    |
| ------------------------------------------ | -------- |
| Motor [RPM](../design-fundamentals/rpm.md) | 600      |
| Wheel Diameter                             | 3.25 in  |
| Gear Ratio                                 | 5:3      |
| Distance between End Shafts                | 11 in    |
| Distance between Wheel Ends                | 14.25 in |

In conjunction with your chosen strategy, design metrics can be used to inform design parameters that satisfy your design criteria. Some example design parameters for the diagram found [above](designing-a-drivetrain.md#simple-drivetrain-designer-if-you-dont-have-cad) include

* max speed (61.26 in/s)
* base stability (proportional to "Distance between End Shafts")
* minimum robot size (14.25 in)
