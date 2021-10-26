---
description: Constraining the main drive support.
---

# Cross Brace

This is how to constrain our cross brace, this will be done in our `! Chassis.iam` file.&#x20;

## Cross Brace

For this robot we will have two cross braces, both aluminum 2x that are 30 holes long.  We can find these in `Structure/C-Channels/Aluminum 1x2x1/1x2x1x30 Aluminum.ipt`.  We will also need a 2.5" standoff from `Structure/Standoff.ipt`, and one 0.5" and 0.375" spacer from `Motion/Spacers/Spacer (Nylon) .500 OD`.

The two cross braces will have two standoffs going between them, with a spacer box inside to make sure nothing can bend.&#x20;

![Gathered Parts](<../../../.gitbook/assets/image (75).png>)

### Standoff Constraints

We will start by constraining the standoff and spacers.  I'm going to turn off visibility on both 2xs to make it easier to work.

After constraining the spacers to each other with an insert constraint, we are going to use an insert constraint to connect the spacer to the standoff, but with an offset of 0.063".  This is the thickness of metal, so nothing will clip once this gets constrained to the drive.&#x20;

![Insert Constraint between Spacer and Standoff](<../../../.gitbook/assets/image (166).png>)

We have a completed standoff brace.

![](<../../../.gitbook/assets/image (181).png>)

Now we can reveal the drive channels from the model browser.

&#x20;

![Toggle Visibility on Cross Braces](<../../../.gitbook/assets/image (214).png>)

Before constraining to the drive channels, we need to **temporarily** ground one of them to make it easier for us to constrain.&#x20;

![Enable Grounded on Component](<../../../.gitbook/assets/image (177).png>)

Now we can constrain the standoff assembly to the drive.  To make this easier, we are first going to vanish the spacers by selecting all of them with `ctrl+left click` and pressing `ctrl+v` on our keyboards.&#x20;

![Selecting all Spacers](<../../../.gitbook/assets/image (133).png>)

Then we will use an insert constraint between the standoff and the c-channel.&#x20;

![Insert Constraint between Standoff and C-Channel](<../../../.gitbook/assets/image (192).png>)

And one more insert constraint on the other side.&#x20;

![Insert Constraint between Standoff and C-Channel](<../../../.gitbook/assets/image (129).png>)

Now that the standoff is constrained, we can unvanish the spacers by going to our model browser and selecting all of the spacers with `ctrl+left click` and pressing `alt+v` on our keyboards.&#x20;

![](<../../../.gitbook/assets/image (101).png>)

The ungrounded channel is only constrained to the grounded channel at one point and can rotate.  To fix this, we use a mate constraint between two other holes.&#x20;

![Mate Constraint between C-Channels](<../../../.gitbook/assets/image (170).png>)

Now are cross braces are fully constrained to each other, and we can unground the grounded c-channel.

![Ungrounding C-Channel](<../../../.gitbook/assets/image (62).png>)

### Constraining to Origin Plane

First we will use a flush constraint between the top one of the cross braces and the `XZ Plane`.  We can constrain to the `XZ Plane` by opening the `Origin` folder in the model browser, and selecting `XZ Plane`.&#x20;

![Flush Constraint between C-Channel and XZ Plane](<../../../.gitbook/assets/image (205).png>)

We can use the `YZ Plane` like our mid plane from the basic tutorial.  Using a flush constraint, select the edge of the c-channel and the `YZ Plane` and offsetting by 15/2, this origin plane becomes our midplane.&#x20;

![Flush Constraint between C-Channel and YZ Plane](<../../../.gitbook/assets/image (149).png>)

Finally, we want the `XY Plane` centered between our cross braces.  We will use another flush constraint, selecting the flange of the c-channel and the `XY Plane`.&#x20;

![Flush Constraint between C-Channel and XY Plane](<../../../.gitbook/assets/image (103).png>)

The center of our cross brace is now (0, 0), and the origin planes can be used to mirror!

{% hint style="info" %}
Remember to save!
{% endhint %}



## Contributors to this Article:

* Jess - EZ
