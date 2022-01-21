---
description: In this page, we'll be going over how to place iParts.
---

# Spacers, Washers and Standoffs

It's good practice when building a drive to put standoffs between the inner and outer channel.  This makes sure that both channels stay parallel to each other, even through defense.  The spacing is a 2" standoff, a 0.375" spacer, and two metal washers (0.0625").  All of these parts are special because they are iParts and get placed slightly differently.&#x20;

## Placing iParts

### Spacers

We need to place the spacers, we can find those in `Motion/Spacers/Spacer (Nylon), .500 OD.ipt`. &#x20;

![Spacers Folder](<../../../../.gitbook/assets/image (81).png>)

After placing the spacer, the iPart window pops up.  We can now select the length of spacer that we want to use, then left click the part into the workspace as normal.  Be sure to select 0.375".

![Spacer iPart Length Selection Window](<../../../../.gitbook/assets/image (82).png>)



### Washers

We need to place the spacers, we can find those in `Motion/Spacers/Washer (Steel).ipt`.  Washers are also iParts, and we get the same selection window when placing them.  Be sure to select 1/32".&#x20;

![Washer iPart Length Selection Window](<../../../../.gitbook/assets/image (83).png>)



### Standoffs

We need to place the standoff, we can find them in `Structure/Standoff.ipt`.  Spacers are also iParts, and we get the same selection window when placing them.  Be sure to select 2".&#x20;

![Standoff iPart length Selection Window](<../../../../.gitbook/assets/image (84).png>)

## Combining Spacers, Washers and Standoffs

These are constrained the same way the wheels and sprockets were, with one insert constraint but with 0 offset because we want everything to sit together.&#x20;

Start by constraining the washers to each other.

![Insert Constraint between Two Washers](<../../../../.gitbook/assets/image (85).png>)

Then the spacers to washer stack.&#x20;

![Insert Constraint between Washer Stack and Spacer](<../../../../.gitbook/assets/image (86).png>)

Then the spacer to the standoff.

![Insert Constraint between Spacer and Washers to Standoff](<../../../../.gitbook/assets/image (87).png>)

## Mounting to the Drive

And finally to constrain that entire assembly to the inner drive channel with an insert constraint.&#x20;

![Insert Constraint between Washer and C-Channel](<../../../../.gitbook/assets/image (88).png>)

After adding the second one, the drive should look like this.&#x20;

![Completed Half of Drive](<../../../../.gitbook/assets/image (89).png>)

{% hint style="info" %}
Remember to save!
{% endhint %}



## Contributors to this Article: <a href="#contributors-to-this-article" id="contributors-to-this-article"></a>

* Jess - EZ
