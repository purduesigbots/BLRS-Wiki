---
description: Splitting our CAD into multiple assemblies.
---

# Subassemblies

Splitting CAD into subassemblies makes it easier for us to iterate when we are farther along our project, and saves our computer from loading the entire robot when we just want to work on one subsystem.&#x20;

## Creating Subassembly Files

Create three new assembly files by going to `File`, `New`, `Assembly`.&#x20;

![New Assembly ](<../../../.gitbook/assets/image (120).png>)

## Main Assembly Naming Convention

For all main assemblies, we put an exclamation point before the name.  Doing this makes the file appear first in the directory.&#x20;

### Main Robot Assembly

The first assembly will be the main assembly.  This is where every subsystem will come together to form the robot.  This robots name is Bingus, so this file will be `! Bingus.iam` and will go in our Bingus directory.&#x20;

![Bingus Assembly File](<../../../.gitbook/assets/image (227).png>)

### Chassis Subassembly&#x20;

Even though this isn't the full robot, this is the entire chassis assembly, making this one of our main assemblies.  This will be saved in our Chassis folder, and will be called `! Chassis.iam`.&#x20;

![Chassis Assembly File](<../../../.gitbook/assets/image (161).png>)

### Wheel Subassembly

Our final assembly file will be for our drive wheels.  This is not a main file, and will just be called `Wheel.iam`. and will be saved to the Chassis folder.&#x20;

![Wheel Subassembly File](<../../../.gitbook/assets/image (72).png>)



## Contributors to this Article:

* Jess - EZ
