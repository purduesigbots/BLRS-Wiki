---
description: >-
  A set of guidelines and suggestions for building reliable mechanical systems.
---

# Build Quality

Build Standards exist as a set of guidelines for building reliable robots. There are occasional situations where it is appropriate to neglect these principles, but for the vast majority of cases, robots' subsystems will perform better when adhering to these standards. These guidelines are the result of situations where not adhering to the quality standards resulted in failed robots. 

## Guidelines for systems involving moving parts

### Bearing Blocks

- Only use keps nuts to attach bearing blocks to metal. Nylocks are typically overkill and overuse of the nylocks will wear them out eventually. Plus it's much faster to build and modify systems this way.
- Try to arrange the bearing block so the axle (or moving screw for a [joint](../vex-joints.md) goes through the center hole. This will give additional strength and stability to the joint.
- Always make sure there are two bolts holding the bearing block to the metal. Don't put two axles through the same bearing block. 
- Don’t let the ends of bearing blocks hang off the ends of the supporting metal. If possible, don’t cross a joint where 1 length of metal extends another.
- Shaved bearing blocks exist for placing them along the inside of a c-channel on a non-middle row, as well as shaved bearings for rotated use in 3-wide c-channel. Bearings for 3 wide c-channel will have both ends filed down, and bearings for the inside of a c-channel have one of the sides filed down.
- Bearing blocks need to be used for each piece of metal that the axle passes through, even intermediate pieces or the piece right next to a motor. Some build standards advocate for no bearings next to motors (*cough* 62 in Starstruck *cough*), but such build practices fail when the motor screws inevitably become somewhat loose. This caused a lot of troubles and torn up metal with the SIGBots' Starstruck robots.

### Shaft Collars

- Avoid the plastic ones. They sometimes have their uses, but they strip often and are unecessarily large and cumbersome to use.
- If clearances allow it, use a 1/4" bolt in place of the black set screw. This makes it so you have to switch between wrenches less often but more importantly, the 1/4" bolts tend to strip less and hold tighter against the axle.
- Use as few shaft collars as possible on any given axle. You should never need more than two, and you can almost always get away with using just one. Place the shaft collar on the axle between the two c-channels that the axle runs through instead of the ends if at all possible since shaft collars at the end are a pain to tighten and seem to come loose more often.
- Along that same note, don't use shaft collars instead of spacers. Spacers never come loose, but shaft collars tend to come loose at the most inopportune times. 

### Spacers

- Use the white, nylon spacers wherever possible. They deform much less easily than the black spacers, and because they come in 1/4" increments it is much more likely that you'll be able to keep on VEX Units (proper alignment to the 1/2" hole spacing in the VEX metal).
- That being said, make sure to use black spacers on either side of 12 tooth pinion gears, since the outer diameter of the white spacers is the same as the outer diameter of the 12 tooth gears, which can interfere with the gear's movement against the other gear(s) and cause friction.

### Washers

- The thick metal washers are the same thickness as a piece of metal.
- Use the thin plastic washers anywhere that metal would be rubbing against metal otherwise. Metal on plastic is fine, metal on metal is not.

### Joint Design

Check out [joints](../vex-joints.md) for a further discussion on the issue. Properly built joints will greatly improve a system's stability and reliability.

## Bolts

- Use the shortest bolt possible for the situation, but make sure that the bolt covers all of the threads in the nut!
- Most situations only need two bolts. Three is over-constraining the metal. If the constrained surfaces have a 2x2 overlap (as is typically the case), place the bolts in a diagonal pattern through the holes to constrain it well in both the x and y directions.
- In high stress applications such as the prongs on Starstruck robots, additional reinforcement of the bolts is sometimes necessary. Thick metal washers can be used for this as well as keps nuts.
- If a bolt seems to be somewhat stripped and you are getting close to competition time, replace the bolt and throw away the stripped one. It's not worth toughing it out when it comes to competition reliability.

## Standoffs

- Use them somewhat sparingly, they tend to come loose. Recent trends have shown them being used as lift arms in a variety of applications to save weight and space, but nothing can replace the stability and reliability of a C-channel. Unless space constraints require standoffs as structural pieces like that, avoid them.
- The 1/2" standoffs should allow a bolt to be screwed all the way through them, if you need spacing between parts that will cause a large axial load on the spacing, use standoffs in this manner instead of spacers since it will be stronger. Mind the fact that you will need to tighten the nut without the ability to rotate the screw, though. Using a nylock would probably be good in this case.
- Use 3/8" bolts for attaching them to metal instead of the 1/4" bolts, with the exception of the 1/2" standoffs.

## Keeping on VEX Units

It can be a major pain if you find that certain parts of the robot don't line up exactly to the VEX holes, as was discovered with the SIGBots' Nothing But Net 24" robot. 

One of the biggest causes of this is the use of L-channel. L-channel has its uses so this is not to discourage you from using it at all, but be very mindful of whether the L-channel's holes are designed so that the piece goes around a c-channel, or so it can be even with a c-channel. Such differences have a huge effect in a finished robot.

## Additional Resources

https://www.vexforum.com/index.php/6774-robot-building-tips-request/0

