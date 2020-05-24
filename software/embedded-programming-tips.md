# Embedded Programming Tips

By no means is this guide meant to be an _exhaustive_ list of all considerations when programming on an embedded system. However, these are some of the most important rules and conditions to keep in mind when writing low-level code running _"on the metal"_, along with what may be found in [Code Style](code-styling-guide.md) and [Debugging](debugging.md):

**Hardware:**

1. **Read the datasheet**. The datasheet is _always_ right. Check the corner cases. Check the header files. Errors can be hiding anywhere.
2. **Check the hardware**:
3. Is there power where it belongs? Is it the right voltage?
4. Are jumpers and connections configured correctly?
5. Are external devices plugged in as intended?
6. Is the system alive? Try adding code that continuously responds to stimuli to debug potential lock-ups and resets.

**Execution path**:

1. Can the program leave the main function? _Doing so will probably execute unintended code._
2. Do all enabled interrupts have a valid \(even if blank\) interrupt service routine?
3. Is the watchdog and reset control _\(only available on some processors\)_ configured as desired?

**Interrupts:**

1. Can interrupts occur here? Should they be able to?
2. Is this section timing-critical? Should interrupts be temporarily disabled?

**Bit-shifts and bit-masks**:

1. Can a multiply or divide instruction be replaced with a [bit shift](bit-shift.md)?
2. Does each bit mask have the correct polarity?
3. Is the order of operations \(\| and & evaluate _after_ == for example\) respected?
4. Do bit shifts properly account for a signed or unsigned variable?

**Memory usage**:

1. Can this variable be declared with a type using fewer bits \(possibly using unsigned types\)?
2. Are dynamic memory allocation calls checked for memory exhaustion?
3. Will the stack overflow into global variables or the heap?
4. Are there warnings about sections overlapping after the link? This is almost certainly a sign that a program is too big.

**Performance**:

1. Will overflow cause a problem with narrow variables?
2. Will the use of variables larger than the native variable size cause expensive extended-precision arithmetic?
3. Are large items passed by value \(which may clandestinely copy them\)?
4. Could a hardware peripheral perform the task of this software routine?

