---
description: Constraining wheels.
---

# Wheels

## First Wheel

We already created the wheel subassembly, so now we can place it and constrain it to the drive with an insert constraint.  We will use an offset of `0.125"` to create a little space between the drive and wheel.&#x20;

![Insert Constraint between Wheel and C-Channel](<../../../../.gitbook/assets/image (151).png>)

## Second Wheel

Later on if we want to change the space between the wheel and the c-channel, it's annoying to change it twice.  We will constrain this wheel with two constraints, one to get the wheel concentric with our bearing, and another to keep it flush with our original wheel.&#x20;

First, use a mate constraint between the wheel and the bearing.&#x20;

![Mate Constraint between Wheel and C-Channel](<../../../../.gitbook/assets/image (89).png>)

For our second constraint, we will use a flush constraint between both gears. &#x20;

![Flush Constraint between Gears](<../../../../.gitbook/assets/image (188).png>)

Now we have a fully constrained wheels!

![Completed Wheels Top Down](<../../../../.gitbook/assets/image (80).png>)

![Completed Wheels Home ](<../../../../.gitbook/assets/image (161).png>)

{% hint style="info" %}
Remember to save!
{% endhint %}



## Contributors to this Article:

* Jess - EZ
