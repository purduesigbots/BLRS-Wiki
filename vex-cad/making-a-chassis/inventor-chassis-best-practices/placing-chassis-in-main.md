---
description: The main assembly is for viewing the entire robot.
---

# Main Assembly

The main assembly is for viewing the entire robot.  It's important we constrain to our origin planes so we can use them to measure our robots and constrain game objects to our robots.&#x20;

## Placing the Chassis in our Main Assembly

In our main assembly file (mine is called `! Bingus`), place your `! Chassis.iam`. &#x20;

![Placing Chassis Subassebly](<../../../.gitbook/assets/image (36).png>)

Use a flush constraint between the flange of the cross brace and the `XY Plane`, with an offset of 2.5/2.&#x20;

![Flush Constraint between Origin Plane and C-Channel](<../../../.gitbook/assets/image (77).png>)

Use a flush constraint between the edge of the cross brace and the `YZ Plane`, with an offset of 15/2.&#x20;

![Flush Constraint between Origin Plane and C-Channel](<../../../.gitbook/assets/image (245).png>)

The XZ Plane will become our ground plane.  This is an important plane, because it is how we will measure our robot for sizing, or constrain game objects to the "floor".

Use a mate constraint between the bottom of the drive channel and the `XZ Plane`, with an offset of `(4.125/2)-0.5`.  4" wheels are actually 4.125".  We divide that by two, and subtract half because the center of the wheel is 0.5" up from the bottom flange of the drive.&#x20;

![Mate Constraint between XZ Plane and C-Channel (Bottom View)](<../../../.gitbook/assets/image (170).png>)

![Mate Constraint between XZ Plane and C-Channel (Side View)](<../../../.gitbook/assets/image (146).png>)

{% hint style="info" %}
Remember to save!
{% endhint %}

You've completed the Inventor Chassis: Best Practices tutorial!



## Contributors to this Article:

* Jess - EZ
