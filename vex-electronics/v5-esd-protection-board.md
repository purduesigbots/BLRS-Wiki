---
description: An ESD Protection board for the V5 Brain
---

# V5 ESD Protection Board

## Introduction

Electrostatic Discharge (ESD) is a widely accepted problem amongst the VEX community, as it results in permanent damage and disabling of ports on the [V5 Brain](vex-electronics/vex-v5-brain/). ESD protection boards, while **not competition legal as of the publishing of this article**, help solve this issue.&#x20;

Each V5 Smart cable contains four wires that connect devices, such as [motors](vex-electronics/motors.md) and [sensors](vex-sensors/), to the [V5 Brain](vex-electronics/vex-v5-brain/). Two of these wires provide power to the device and can withstand high voltages. However, the other two wires transfer data and are not able to withstand high voltages**.** Static buildup can rapidly release thousands of volts of electricity. If this static goes across one of the data lines, it may cause permanent damage to the port and make it unusable.&#x20;

The ESD protection board contains TVS diodes on the two data lines between the connected device and [V5 Brain](vex-electronics/vex-v5-brain/). A good way to visualize how the TVS diode works is by thinking of it as a pipe system with a valve. Normally, the valve to the ground line is closed. However, when a large voltage comes along the data line, the electrostatic pressure from it forces the valve open, allowing the voltage to be grounded instead of flow along the data line.&#x20;

The table below shows the maximum operating conditions of the TVS diodes used in the boards.

![TVS Diode Specifications](<../.gitbook/assets/image (73).png>)

As shown in the table above, the TVS diodes used can redirect up to 30kV (thirty thousand volts) of ESD, meaning it can ground a significant amount of electricity and prevent it from reaching the data line. Adding these ESD protection boards to your robot is a simple and cost-effective way to protect and extend the lifespan of your[ V5 Brain](vex-electronics/vex-v5-brain/).

Technical information about RS-485 Bus Protection can be seen here:&#x20;

{% file src="../.gitbook/assets/TI-IEC ESD RS-485 Bus Protection.pdf" %}

![Diagram of ESD protection board.](<../.gitbook/assets/Board Diagram.png>)

## Ordering

We suggest using the PCB manufacturer JLC to order these boards, as they are cheap, reliable, and offer SMT assembly services. Our instructions on how to order will be based on ordering through JLC, but you are more than welcome to order from another manufacturer.

Our board design has been panelized, meaning it is multiple ESD protection boards printed together onto one sheet. This panelized PCB can be broken apart to separate each board. A picture of the panelized board is shown below.

![Model of a panelized sheet of ESD protection boards.](<../.gitbook/assets/Top Edit.PNG>)

We recommend using JLC's SMT assembly service to get the TVS diodes printed onto the boards during production, and include this process in our walkthrough. Their services allow us to get the TVS diodes at a cheaper price/diode and cut down on shipping costs and effort.

{% hint style="info" %}
Please remember when ordering RJ9 Jacks that each ESD protection board requires two jacks to function. This means you should order twice as many jacks as boards you want.&#x20;
{% endhint %}

The table below displays all parts you need to order for a complete ESD protection board, as well as links to buy the parts. We have created a walkthrough on ordering from JLC below the table.

{% hint style="info" %}
The following prices are based on the minimum quantity and unit cost at that quantity, and do not include available coupons or sales. Increasing the quantity will decrease the unit cost, so it is recommended to do one big order instead of multiple small orders.
{% endhint %}

<table><thead><tr><th width="215">Vendor</th><th>Description</th><th data-type="number">Min. Qty.</th><th>MPN</th><th>Vendor Part #</th><th>Unit Cost</th><th>Ext.</th></tr></thead><tbody><tr><td><a href="https://www.digikey.com/en/products/detail/assmann-wsw-components/A-2004-3-4-LP-N-R/2183632">Digi-Key</a></td><td>RJ9 Jack - 4P4C Unshielded</td><td>100</td><td>A-2004-3-4-LP-N-R</td><td>AE10381-ND</td><td>$0.4385</td><td>$43.85</td></tr><tr><td><a href="https://www.jlcpcb.com">JLC</a></td><td>ESD Board PCB &#x26; TVS Diode</td><td>5</td><td>N/A</td><td>N/A</td><td>$0.3476</td><td>$17.38</td></tr><tr><td><strong>Total</strong></td><td></td><td>null</td><td></td><td></td><td></td><td>$61.23</td></tr><tr><td><strong>Cost per ESD Board</strong></td><td></td><td>null</td><td></td><td></td><td></td><td>$1.2246</td></tr></tbody></table>

### JLC Order Process

Firstly, download all three files attached below.

{% file src="../.gitbook/assets/Panelized Board GERBER (1).zip" %}
File containing ESD Board PCB data.
{% endfile %}

{% file src="../.gitbook/assets/Panelized Board BOM (1).csv" %}
File containing TVS Diode part data.
{% endfile %}

{% file src="../.gitbook/assets/Panelized Board CPL (2).csv" %}
File containing TVS Diode placement data.
{% endfile %}

Then, visit [JLC's website](https://www.jlcpcb.com) and follow the instructions in the video linked below.&#x20;

{% hint style="warning" %}
Please keep in mind that each panelized board contains ten ESD protection boards, so the number of individual boards you receive is ten times the quantity you input.
{% endhint %}

{% hint style="info" %}
JLC offers many coupons for SMT assembly and shipping that will automatically appear during checkout. **Be sure to apply these coupons before you submit your order.**
{% endhint %}

{% embed url="https://youtu.be/oRecdsYN1K8" %}
Video walkthrough of ordering ESD protection boards with SMT assmebly through JLCPCB.
{% endembed %}

## 3D Printable Case

![Assembled ESD Boards inside 3D printable case.](<../.gitbook/assets/image (96).png>)

Jess from VEXU team EZ has designed 3D printed cases to house the ESD protection boards. There are designs for one board, four boards, and eight boards. Attached below are the STL and STEP files for the different case sizes.&#x20;

{% file src="../.gitbook/assets/1 ESD Board Case.zip" %}
File containing .stl and .step files for 3D printable case for one board.
{% endfile %}

{% file src="../.gitbook/assets/4 ESD Board Case.zip" %}
File containing .stl and .step files for 3D printable case for four boards.
{% endfile %}

{% file src="../.gitbook/assets/8 ESD Board Case.zip" %}
File containing .stl and .step files for 3D printable case for eight boards.
{% endfile %}

To print the cases, place the STL files in your slicer with the flat side on the bed. The recommended print settings are 15% infill with 0.2mm resolution. Supports are not needed and brims are optional.&#x20;

![Print orientation for the available ESD Board cases in PrusaSlicer.](<../.gitbook/assets/image (199).png>)

## Installation

The first step is to place the R9 Jacks onto the marked locations on the ESD protection board. **They should fit into the holes smoothly and without much force.**

![Picture of ESD protection board with R9 Jack locations circle in red.](<../.gitbook/assets/Jacks Circled.PNG>)

The second step is to solder the 4 connections on each R9 Jack onto the ESD protection board. Your board should appear similar to the picture below when you are done. Please confirm that the solder job was done correctly before proceeding to the next step.

![ESD Protection Board with R9 jacks soldered on.](../.gitbook/assets/IMG\_6009.jpg)

The third step is to place the ESD protection boards into their case. Ensure that the screw holes in the center of the case and board are aligned.

![Picture of completed second step of installation process](<../.gitbook/assets/ESD Boards in case.jpg>)

The fourth and final step is to align the screw holes on the case with the holes on a VEX structure. Then, put a screw all the way through the structure, case, and board and tighten it into place.

To use your newly assembled ESD protection board, connect your [VEX Motors](vex-electronics/motors.md) to the board on one jack, and connect a port on the [V5 Brain](vex-electronics/vex-v5-brain/) to the other jack.

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
* EZ

Original board design credit goes to Ritwik Pandey, a BLRS alumni. Further revisions are credited to Will Xu and Ben Davis.&#x20;
