---
description: A lighter and faster version of the DR4B
---

# Double Reverse Four Bar Standoff Linkage Variant

The DR4B is one of the best lifts for linear movements. However, this advantage comes at a cost -
its weight. This weight made the DR4B extremely slow compared to other lifts. Hence, for a long
time, the inefficient [cascade lift](other-lifts.md#elevatorcascade-lift) was the only option
for fast linear motion. However, there is a variant of the DR4B that satisfies both of these
criteria: the Standoff Linkage DR4B.

## Weight Reduction

The previous article showed how DR4Bs can be categorized according to weight class. The Standoff
Linkage DR4B effectively forms a new weight class below featherweight, making it the lightest DR4B
configuration possible. This is made possible due to the shift of the motors down to the towers of
the robot and the lack of any gearing on the middle and upper parts of the DR4B.

## Structure

To understand the structure of the Standoff Linkage DR4B, we must first look at how it was derived
from the original standard DR4B.

![A Traditional/Standard DR4B's Structure](<../../.gitbook/assets/dr4b-standard.png>)

The gears in the standard DR4B are used to invert the rotation of each 4-bar. This
causes the lower 4-bar to push downward while the upper 4-bar reaches upward. However, these gears
can be replaced with a standoff linkage.

![A Standoff Linkage DR4B's Structure](<../../.gitbook/assets/dr4b-standoff-linkage.png>)

As shown, the standoff linkage has been highlighted in red. One of the transmission angles of the
lower 4-bar has been highlighted in green. When the lower 4-bar lifts, this angle increases. The
standoff linkage then pulls on the upper 4-bar, causing it to rise as well.

This standoff linkage, despite its name, can be made of multiple materials. Examples include
1x1 L-channels (or half-Cs), chain, string, and cable ties. (Flexible materials such as cable ties
or string may affect the mechanism's ability to move linearly whilst moving downward.)

## Pros and Cons

(in comparison with standard DR4B)

**Pros:**

* Significantly lighter
* Easier to build in some scenarios
* Faster

**Cons:**

* Cannot handle heavier loads
* Harder to calculate angles and distances
* Difficult to get **perfect** linear motion (though the slight horizontal movement is often
    insignificant)

## Geometry

To maintain linear motion, the geometry must satisfy multiple constraints. First of all, we need to
understand that the standoff linkage forms an antiparallelogram.

![An antiparallelogram](<../../.gitbook/assets/dr4b-antiparallelogram-plain.png>)

This is only one example of an antiparallelogram, there are many other forms it can take.
For example, we can see this antiparallelogram in the Standoff Linkage DR4B as
well:

![Antiparallelogram in DR4B](<../../.gitbook/assets/dr4b-antiparallelogram-highlight.png>)

### Rules for Linear Motion

To ensure linear motion of the Standoff Linkage DR4B, there are a few rules that need to be
satisfied. These rules require 3 critical measurements:

* $H$ (Pivot Gap): The fixed vertical distance between the upper 4-bar's top pivot and the lower
    4-bar's bottom pivot on the middle plate.
* $R$ (The Radius/Extension): The distance from each 4-bar's main pivot to the point where the
    standoff linkage attaches.
* $L$ (The Linkage Length): The center-to-center length of the standoff linkage.

To achieve a perfect 1:1 inverse angular movement without binding, the structure must satisfy
these rules:

1. $L = H$: The length of the standoff linkage bar ($L$) must exactly equal the vertical distance
    between the two main pivots on the middle plate ($H$).
2. $R_{upper} = R_{lower}$: The distance from the upper pivot to the top linkage mount must exactly
    equal the distance from the lower pivot to the bottom linkage mount.
3. Use Crossed Alignment: The top mount must be a straight extension behind the upper pivot (forming
    a tail), while the bottom mount must be a straight extension in front of the lower pivot. This
    causes the linkage bar to cross over the center line, creating the "X" shape required for an
    antiparallelogram.


![Measurements in the Standoff Linkage DR4B](<../../.gitbook/assets/dr4b-measurements.png>)


### Asymmetric DR4B

These rules assume that the upper 4-bar is identical to the lower 4-bar. This is an important
assumption; without it, perfect linear motion cannot be achieved. If you have
non-identical 4-bars (where each is of a different length), you will have to change the extensions
to match the lengths of each 4-bar. In other words, the ratio $R_{upper}/R_{lower}$ should equal the
ratio $L_{upper}/L_{lower}$. However, the transmission ratio changes slightly
depending on the height of the lift. Because the linkage angle shifts as the lift rises, an
asymmetric standoff DR4B will never be perfectly linear across its entire path. It will track
straight at the bottom and top, but might bow slightly outward in the middle.

If you need to extend the height of a Standoff Linkage DR4B, it is recommended to replace the upper
4-bar with a 6-bar instead of increasing the length of the 4-bar. This ensures true linear motion.

## Summary

The Standoff Linkage DR4B is an ultra-lightweight variant of the standard DR4B that bridges the gap
between fast linear motion and mechanical efficiency through antiparallelogram geometry. To maintain
true linear motion, the mechanism must satisfy the geometric constraints of an antiparallelogram
throughout its range of motion.

### Contributions

Article written by @saturnyx.

This article is based on the original Standoff Linkage DR4B design developed by
members of 8059 Blank.
