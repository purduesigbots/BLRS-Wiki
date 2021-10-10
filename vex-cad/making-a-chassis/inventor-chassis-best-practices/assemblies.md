---
description: Splitting our CAD into multiple assemblies.
---

# Subassemblies

Splitting CAD into subassemblies makes it easier for us to iterate when we are farther along our project, and saves our computer from loading the entire robot when we just want to work on one subsystem. 

## Creating Subassembly Files

Create three new assembly files by going to `File`, `New`, `Assembly`. 

![New Assembly ](<../../../.gitbook/assets/image (118).png>)

## Main Assembly Naming Convention

For all main assemblies, we put an exclamation point before the name.  Doing this makes the file appear first in the directory. 

### Main Robot Assembly

The first assembly will be the main assembly.  This is where every subsystem will come together to form the robot.  This robots name is Bingus, so this file will be `! Bingus.iam` and will go in our Bingus directory. 

![Bingus Assembly File](<../../../.gitbook/assets/image (119).png>)

### Chassis Subassembly 

Even though this isn't the full robot, this is the entire chassis assembly, making this one of our main assemblies.  This will be saved in our Chassis folder, and will be called `! Chassis.iam`. 

![Chassis Assembly File](<../../../.gitbook/assets/image (120).png>)

### Wheel Subassembly

Our final assembly file will be for our drive wheels.  This is not a main file, and will just be called `Wheel.iam`. and will be saved to the Chassis folder. 

![Wheel Subassembly File](<../../../.gitbook/assets/image (121).png>)



## Contributors to this Article:

* Jess - EZ
