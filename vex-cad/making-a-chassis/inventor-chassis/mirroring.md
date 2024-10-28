---
description: In this page, we'll be going over how mirror the drive.
---

# Mirroring

## Mirroring

Please save your file with `ctrl+s` before mirroring! &#x20;

We are going to highlight the entire half of the drive.  Start by going to a top down view of the workspace in the navigation cube.  Start from the **TOP LEFT** of the red rectangle, and go down to the **BOTTOM RIGHT**.  Selecting in this direction will only select what is fully within the rectangle.  If you do this correctly, the highlight box will be **RED** and not **GREEN**.&#x20;

![Selection Direction](<../../../.gitbook/assets/selecting drive.png>)

In the ribbon, make sure you're in the `Assemble` tab and select `Mirror`.

![Mirror Tool](<../../../.gitbook/assets/image (254).png>)

Bellow is the default mirror window.  There are two colors are parts, green and yellow.  If we mirror with anything green, a new part will generate that is mirrored to the original part.  This becomes annoying when we are rapidly iterating and mirror multiple times, and now we have hundreds of unused files.  To make everything yellow, select the highest file, in my case, `Frank.iam`.&#x20;

Sometimes we need to create a new part, for example if there's an asymmetrically cut part on the drive.  In that case, it's okay to keep the those specific parts green.&#x20;

![Default Mirror Pop-Up](<../../../.gitbook/assets/image (135).png>)

After making everything yellow, at the bottom select `Ground New Components`.  Constraints will hold within what we are mirroring, but will not hold between the drive and the cross bar.  Best practice is to ground new components, and if you need something to move to manually unground those parts.&#x20;

![Final Mirror Window](<../../../.gitbook/assets/image (84).png>)

Select `Mirror Plane`, and select the `Work Plane` from the model browser on the left.&#x20;

![Selecting Mirror Plane](<../../../.gitbook/assets/image (110).png>)

After selecting the mirror plane, your workspace should look like this.  Click `Next` in the mirror pop-up.&#x20;

![Preview](<../../../.gitbook/assets/image (220).png>)

If we had any parts that needed to be mirrored (like an asymmetrically cut part on the drive), we would select where to save them here.  If we are okay with where they default to, then press `Ok`.

![Mirror Component Save](<../../../.gitbook/assets/image (68).png>)

If completed correctly, you have a drive base!

![Completed Drive](<../../../.gitbook/assets/image (111).png>)

{% hint style="info" %}
Remember to save!
{% endhint %}



## Contributors to this Article:

* Jess - EZ
