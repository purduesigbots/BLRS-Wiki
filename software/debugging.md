# Debugging

## Debugging

Let's face it, we're human and make coding mistakes all the time. Nobody in Purdue SIGBOTS can say that they always write bug-free code. Bugs can crop up in a variety of locations, and can have varying natures. If you have a particularly hard one to squish, this article may be helpful. **These techniques can and should also be used when debugging class projects!** Embedded systems have their own sets of issues, try the [embedded guidelines](embedded-programming-tips.md) document for more details.

## IDE or compiler assistance

### C/C++

Adjust your compilation options in the command prompt or Makefile to turn on all warnings and debugging symbols:

```c
lang=

gcc -Wall -Wextra -g ...
```

Mistakes such as missing \* and lack of a return statement can be found in this way. **Always** compile with  -Wall!

### Java

Use IntelliJ IDEA Community with code inspections enabled to taste. It will find 95% of errors single handedly.

## Common

### Syntax and logic

* **Common mistakes:** Swapping == for =, missing \*, extraneous semicolons after if, and many other typing errors may cause bugs. Start with the most recent code and work backwards looking carefully for these errors.
* **Error on a library function?** Was the library properly included? C may need a change to the compilation parameters specifying that the library must be linked \(missing math functions may require -lm, etc.\)
* **Missing return?** A default return value might be substituted \(possibly zero, null, or some other unfortunate result\). Worse, in C, it may cause stack corruption and a resulting crash.
* **Optimizing too soon?** Make it work first.
* **Recursion:** Unless specifically commanded to do so in the assignment, avoid recursion. It is only useful for some specialized tasks \(e.g. spidering a web page or file system tree\) and is asking for a stack overflow.

### Floating point

* Floating-point variables are inherently imprecise. Statements such like if \(x == 99.5\) are doomed to die, as x might have 99.49999999999991 as a result of an arithmetic operation which would evaluate to false. Use small ranges around target numbers, or multiply and round to an integer.
* Floating-point math such as sin and log is even worse. Do not expect sin\(PI\) to be 0.0. Its exact value may vary on different platforms.
* Intermediate floating point values are often stored in a temporary register on the CPU, which may have more \(or less!\) precision than the target variable. Changing optimization options or debugging options might change the outcome of floating-point operations.

Moral of the story: Avoid decimals if at all possible. Fixed-point is a viable alternative in many cases. If only using floating point to multiply or divide by a constant, consider converting the floating-point number to an approximate fraction in lowest terms, then using _"multiply and divide"_ to get an answer rounded to the nearest integer. Beware of overflow.

### Pointers

**Pointers** are the source of most C or C++ bugs. Memory leaks, segmentation faults, poor performance, and buffer overflows all have their roots in pointer misuse.

* **Does your program crash \(segmentation fault, bus error, access violation\)?** Recompile the program with the -g option if you do not do so already, and use gdb to run the program with an attached debugger.
  1. Type run to start the program, and when it crashes, enter backtrace to look for the exact location of its death. _If the error goes away when debugging, see_ [_Heisenbugs_](debugging.md#heisenbugs) _below._
  2. Calls inside of library functions, system functions, or the kernel should likely be ignored; look for a line such as at input.c:5 which dictates the line of the faulting code.
  3. Enter frame N, where N is the number before the suspect line in the backtrace output, to see which source line caused the issue.
  4. Using print var will output the contents of the variable var to the screen.
  5. If the error is not already apparent by now \(null pointer, bad cast\), rerun the program with a breakpoint on a line before the error \(using break input.c:3 before entering run for example\) and use next to step through the code. This should provide good insight into what control flow the program is taking.
  6. It is also possible to determine the cause of an old crash. Look for the core dump produced on death, and load that into gdb to find out the program's state at the scene of the crash.
* **Are you implementing a custom data structure \(linked list, heap, hash\)?** Find a Linux system with a graphical display \(or X forwarding\) and run ddd.
  * If it is not installed, try using your distribution's package manager; if on a lab machine or SSH server, the error can also be found with the gdb method above.
  * Set a breakpoint on an indicative line, and run the program. The graphical pointer display, available by right-clicking on a variable \(as seen in the picture\) should hone down the error in a few seconds with some judicious stepping through code.
  * A good tutorial on [DDD use](http://www.gnu.org/software/ddd/manual/html_mono/ddd.html) is available on the GNU website.
* **Are you not sure where to start?** [Valgrind](http://valgrind.org/) will often find errors that one was never suspecting. Install it if it is not already installed, and run:

```c
lang=
valgrind --leak-check=yes
```

on the program \(just like using GDB\) and watch for messages about memory leaks or pointer abuses. This should find almost everything, but might come up with false positives as well. Read the output carefully.

* **Stuck on Windows?** Utilities such as Valgrind and DDD have poor support for Windows. If an SSH machine or Linux lab machine is not available, consider installing a virtual machine..

## Situational

### Too slow

* **Loops** - Loops cause most slow-downs, especially inner loops. Look for statements which can be moved to a higher-level loop or outside of all loops altogether.
  * **Variable scope** - Variables declared inside of a loop or if statement may sometimes be created at the beginning of the loop and destroyed at the end of the loop. Try moving the declaration outside of the loop \(but leave the variable's use unchanged\).
  * **Arithmetic operations** - Some operations \(such as constantly using the expression 2 \* i - 1 to access odd array elements\) may be faster if one uses another temporary variable \(starting at 1 in this example\) and adding two to it inside the loop body. Multiply by two and subtract one is often more expensive than adding two, even when taking the cost of the extra variable into account.
  * **Unroll loops** - Inner loops with only one or two operations \(e.g. matrix multiplication\) should be unrolled if the input size is guaranteed to be a multiple of some constant.
* **Bitwise operations** - Try exchanging multiplications and divisions for [bit shifts](bit-shift.md), or adding a [bit mask](bit-mask.md) to replace another complex expression.
* **Output statements** - Statements such as printf and sscanf are very slow. Delete unnecessary outputs from working code, or use simpler statements such as puts.
* **Memory allocation** - malloc, new or other such dynamic allocation statements are slow. Some languages may be able to allocate on the stack, or use a shared global variable.
* **Immutable objects** - Some objects are immutable; operations like repeatedly concatenating to a String in a loop \(in Java\) are inefficient. Use the corresponding buffer class \(StringBuilder in Java's case\).
* **Reading streams character-by-character** - Streams are better accessed in large power-of-two blocks \(256, 1024, or 16384 are common\). Either read it all into an array \(but watch out for memory hogging\), or refactor the processing algorithm to work on groups of data. Java users may use a BufferedInputStream or BufferedReader to aid performance.
* **Locality of reference** - Accessing data in a random manner thrashes the CPU cache. Try to find a way to access data in a regular, well-defined order, or start reading in data from memory before it is actually needed. [AMS](object-recognition/untitled.md) is a good example of how locality of reference optimizes speed.
* **Data cache issues** - Often, compilers cannot determine whether pointers are _aliased_ \(pointing to the same address\). They may store a value to a pointer, which writes out to main memory, and read it back in again, which is slow. Moving values back and forth between integers and floats causes a similar slowdown, since the value has to make a trip through the stack before reaching the floating point registers. To fix these issues, cache values locally if possible and write the final result once at the end. Smart function inlining may also save a parameter round trip to the stack; try declaring simple functions static inline \(in C\). Example:

```c

// This code is very slow
int verySlow(int *x, int *y) {
    (*x)++;
    // On the next line, the CPU will stall, because the value of "x++" is unavailable while being written out to memory.
    // Some optimizing compilers may fix this, but it's better off doing...
    return *y + *x;
}

// This code is a little better but still slow
int better(int *x, int *y) {
    // Use temporary variables to read the values in only once
    int xtemp = *x, ytemp = *y;
    xtemp++;
    *x = xtemp;
    // Since the compiler no longer needs to read from memory, we are much better off
    return xtemp + ytemp;
}

// This code is the best of the three, but may change semantics slightly
static inline int fastest(int *x, int *y) {
    // Use temporary variables to read the values in only once
    int xtemp = *x, ytemp = *y;
    xtemp++;
    *x = xtemp;
    // For many programs, a tiny function like this is used several times in one file only.
    // Using "static inline" makes the function only available to this file, but it allows
    // the compiler to copy the function code wherever it is used, if this improves the code.
    // In this case, the compiler will probably be able to make substitutions of known
    // parameter values and/or save a read from main memory. Even more important, the parameters
    // no longer have to make a trip through the stack, saving time since the function used
    // to load them immediately after the caller stored them on the stack, causing a
    // "Load-Hit-Store" stall.
    return xtemp + ytemp;
}
```

* **Floating point** - _See_ [_Floating point_](debugging.md#floating-point) _above_. Floating-point operations are generally slower than integer operations, especially in embedded systems. For sin and cos, consider rounding to the nearest degree and building a look-up table. However, rounding itself can introduce a load-hit-store stall, as swapping variables between integer and floating point registers requires an expensive round and a trip through the stack.
* For C/C++, add -O3 to the compiler options, which may generate a fairly sizable speed boost. Not all auto-grading scripts will use it, though - handle with care.

### Memory hogging

* **Are you leaking memory?** C users should use valgrind as discussed in [Pointers](debugging.md#pointers).
* **Reading entire input into memory?** This is asking for an out of memory error. Try to change the algorithm to work on pieces of the input instead.
* Java users have less to worry about but should check for shared ArrayLists or StringBuilders that are getting bigger without bound. Java's system can also keep references in bizarre locations; try performing a memory analysis with jconsole \(included in the JDK\) or Oracle's jhat.
* Do **NOT** perform "manual garbage collection" in garbage-collected languages. Doing this covers up the error and does not treat the cause.

### Overflow

Optimizing too soon, or neglecting to account for large data sizes, may induce overflow when a number gets too big to fit into its data type. While this is not an issue in the highest level of languages, it can be the bane of C/C++ programmers and an annoyance to Java.

* **Subtracting unsigned from unsigned** - This is rife for overflow chances, which instead of making a negative number or zero will wrap around to a huge number.
* **Bit mask and shift** - Shift by too much, and bits are lost \(or overflow to the least significant place!\)
* **Floating point** - Adding one to 1.0e+25 won't do much.
* **Multiply and divide** - You might be proud that you avoided floating point. What you may not have thought of is what happens if the intermediate multiplication overflows. Consider possible input values, and if issues might show up, cast to the next size up and cast down at the end.
* **Multiply and accumulate** - The accumulator variable probably needs to be at least one size bigger than the input type to handle large sums.
* **Type sizes** - C and C++ do not have consistent definitions for the size of char, int, or long. To fix this issue, \#include &lt;stdint.h&gt; and use the platform-independent types such as uint32\_t \(**u**nsigned **int**eger **32** bits wide\), ssize\_t \(pointer size\), time\_t, etc.

### Threading

* Java users have it easy; a synchronized \(variable\) { ... } statement may be inserted in concurrent code to lock up a variable while the code is executing. Only one thread can run a synchronized section on a particular variable at once; the rest have to wait until the first one finishes. The lock is reliably dropped even if an Exception occurs. However, Java has added problems as well, since multiple system threads \(especially in GUIs\) are also running with the user program, causing concurrency where none is expected. Check event and status handlers carefully.
* C/C++ users must use a **mutex**, like pthread\_mutex or a volatile integer serving as a semaphore. A mutex serves to prevent contention on a shared resource or variable, and to prevent different threads from changing a value something else is using. However, the mutex might not be automatically thrown away if something abnormal occurs.
* Beware of the _"time of check to time of use"_ issue, where the value of some shared variable or status of some item might change between the if statement which checks its condition and the operation which uses it. This can cause intermittent or bizarre multithreading errors and possibly security or crash issues as well.

## Rare

### Heisenbugs

**Heisenbugs** are bugs which disappear or change when one changes the program to find their cause. These are most often due to:

* **Uninitialized variables** - When running a program on gdb or ddd, variables are forced onto the stack and may be cleared to zero on declaration. If a variable is used uninitialized, the error may change or disappear when debugging. Many IDEs \(and sometimes valgrind\) can point these out.
* **Floating points** - Floating point variables are often a necessary evil. If subtle changes break floating point code, one is probably using floats incorrectly or relying on non-guaranteed behavior. See [Floating-point](debugging.md#floating-point) for more insight.
* **Optimization issues** - Compiling with -O2, -Os, or -O3 as described in the [Too slow](debugging.md#too-slow) section may "break" suspect code that should not have worked in the first place, due to assumptions made which only hold on good code. Look in I/O code or [wp&gt;type punning](https://phabricator.purduesigbots.com/w/wp_type_punning/) statements to find possible causes.
* **Threading or network issues** - Slight changes to timing introduced by adding print statements or single-stepping in a debugger can either mask or exacerbate issues with concurrency or external I/O. If this is occurring, inserting empty printf\(""\); statements \(or Thread.sleep\(10L\);\) is not a long-term fix for the problem. See the [Threading](debugging.md#threading) section for more.
* **Trashing memory** - C and C++ can trash memory in hidden ways that inserting a printf or other similar statement may fix or expose. See the appropriate [Pointers](debugging.md#pointers) section for details.

### Works for them, crashes for me

* **Linux/Windows/Mac issue** - C is not inherently cross-platform, and many functions differ on different target platforms. Java is much, much better about this, but nuances still remain. Python probably does the best job of the three, but still has occasional issues, especially with add-ons.
* **Pointer width** - Storing a \(C\) pointer in an int? On a 64-bit machine, this is doomed to a segmentation fault. Try using void \* as a pointer storage type instead.
* **Endianness** - Type-punning, I/O schemes, and wide type construction may fail due to differences in endianness.
* **Alignment** - Not all computers and OSes allow access to a multi-byte wide type from an address which is not an even multiple of that width. Code which has to do this may need a type pun, an unusual cast sequence, or a series of bit masks and bit shifts to fix the issue. struct and union are particularly vulnerable to this issue \(in C\).
* **Background programs** - Clean out your notification area and taskbar! Background programs \(particularly virus scanners\) may interfere with programs in difficult-to-detect ways.
* **Display resolution** - Check GUI programs for problems with different screen sizes or multiple monitors. A check for users running in a headless \(no graphical screen\) environment may save some frustration.
* **Time of day, location, CPU** - More complex programs may suffer from obscure bugs related to time zones, daylight savings time, computers going to sleep mode, out of disk space, and much more. Look for corner cases where the algorithms used may fail.

