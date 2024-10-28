---
description: Creating the wheel assembly.
---

# Wheel Subassembly

This drive base will be 600rpm geared down, 36:84.  For this, we need to bolt an 84t gear to our 4" omni wheel.  This will be done in our `Wheel.iam` subassembly.&#x20;

## Constraining the Wheel to the Gear

We can find 4" wheels in `Motion/Wheels/Omnis/4 Omni, Square.ipt`, and HS 84t gears in `Motion/Gears/HS 84T Gear, Square.ipt`.

Start by grounding our 84t gear so we have a solid thing to constrain to.&#x20;

![Grounding 84t Gear](<../../../.gitbook/assets/image (17).png>)

### Flush Constraint

When this is built in real life, the gear and the wheel will be on the same axel and won't be able to rotate away from each other.  To simulate that in CAD, we need to use a flush constraint on the flats of the square holes.&#x20;

A flush constraint makes two planes flush with each other.  It doesn't force the planes to contact.  They can be selected at the bottom right of the constraint window, they are a modification of mate constraints.&#x20;

![Flush Constraint Selection](<../../../.gitbook/assets/image (230).png>)

![Flush Selection on Wheel](<../../../.gitbook/assets/image (192).png>)

![Flush Selection on Gear](<../../../.gitbook/assets/image (138).png>)

The wheel cannot move up/down because those plans will always stay flush with each other.&#x20;

![Completed Flush Constraint](<../../../.gitbook/assets/image (41).png>)

### Insert Constraint

We will use an insert constraint to get the wheel and the gear concentric and some distance apart.  Now that there is a flush constraint, we need to be careful about the insert we select.  Select the sides that are closer to each other.  In the images below, look at the navigation cube for orientation reference.&#x20;

![Insert Gear Selection](<../../../.gitbook/assets/image (178).png>)

![Insert Wheel Selection](<../../../.gitbook/assets/image (167).png>)

### Creating Space between Wheel and Gear

The wheel and the gear are clipping each other a bit.  We can play with the offset until we find an amount that looks about right.  I'm using `0.3125"`.

![Wheel and Gear Before](<../../../.gitbook/assets/image (9).png>)

![Wheel and Gear After](<../../../.gitbook/assets/image (223).png>)

## Adding Spacers

It's bad build practice to only rely on the shaft to transfer torque between the wheel and the gear.  In Turning Point, many teams experienced spokes cracking.  The wheel assembly can easily be made more robust by creating another point of contact between the wheel and gear.&#x20;

We can find 0.5" spacers in `Motion/Spacers/Spacer (Nylon) .500 OD/0.5 in.ipt`.  We will need two of them, and stack them together. &#x20;

### Copying Assemblies

We need to constrain both spacers together.  We need two of these assemblies.  Instead of placing four spacers and making two stacks, we can copy this original stack, but we need to select both parts before doing it.  When copy/pasting assemblies, constraints will hold within the assembly. &#x20;

Select multiple parts by `ctrl+left click` your parts until they are all blue.  Then use `ctrl+c` to copy.

![Selecting Spacer Stack](<../../../.gitbook/assets/image (131).png>)

Then use `ctrl+v` to paste.&#x20;

![Two Spacer Stacks](<../../../.gitbook/assets/image (38).png>)

### Constraining Spacers to Gear

Use an insert constraint to connect the spacer to the gear.&#x20;

![Insert Constraint between Spacer and Gear](<../../../.gitbook/assets/image (132).png>)

After adding the second spacer stack, we see that it clips the spokes a little.  This is a something that doesn't look like it works in CAD, but the parts have enough slop in real life that this works very well.&#x20;

![Spacers Clipping the Wheel](<../../../.gitbook/assets/image (250).png>)



If completed correctly, our final wheel assembly should look like this.&#x20;

![Completed Wheel Assembly](<../../../.gitbook/assets/image (4).png>)

{% hint style="info" %}
Remember to save!
{% endhint %}



## Contributors to this Article:

* Jess - EZ
