# Bit Shift

## Bit shift

A bit shift is an operation which moves the bits in the binary representation of a number a specified number of locations left or right. Along with its cousin, the **bit rotate**, bit shifts can be used to perform varied yet extremely fast operations on integers with the aid of [bit masks](bit-mask.md).

### Principles

Humans typically represent integers in base ten notation, but computers use a simpler system where only two states for each digit \("bit"\) are available - asserted \(1\) or negated \(0\). This requires a larger number of place values than a base ten number; typical fixed-width binary numbers range from 8 to 64 bits wide.

A bit shift operates by going through each bit in a binary number and moving that bit a specified number of places to the left or right \(more or less significant\). While this may seem slow, most processors shift all bits in hardware simultaneously, resulting in a much less complex operation than even a "simple" binary addition. Bit shifts cause some bits to be lost and new bits to be generated; the rules for replacing these bits vary depending on the operation desired:

#### Shift left

When bits are shifted to the left, negated \(zero\) bits are always shifted in on the right to replace the shifted bits, and bits shifted to the left are removed and stored in another location. This remains the same regardless of whether the number being shifted is signed or unsigned.

Shifting a signed number left can change the sign of the number if a one is shifted into the sign position \(a form of overflow\). Beware of this possibility when considering signed \(arithmetic\) left shifts!

#### Logical shift right

For unsigned binary numbers, the magnitude of the number is always reduced when shifting to the right, just as it would be when dividing by a power of two. The bits shifted into the left side are therefore always zero in the case of a logical shift right. Performing a right shift on an unsigned variable in C will generate a logical shift.

#### Arithmetic shift right

Signed binary numbers are typically represented using two's complement notation, where negative numbers have each bit position inverted. The leftmost bit is therefore called the "sign bit", as it is zero for positive numbers and one for negative numbers. Performing a naive fill with zeros would cause a negative two's complement number to become positive, violating the expected result of the number's overall magnitude to be reduced but the sign preserved.

An arithmetic right shift will therefore fill the vacated bits with a copy of the most significant bit, preserving the number's sign. This process is known as **sign extension**. As a result, shifting the value -1 right by any number of locations \(11111111 if represented in a signed byte-wide value\) will not change the value, contrary to what one might expect since shifting 1 right will produce zero. C compilers will produce arithmetic right shifts when shifting a signed integer type.

**Sign extensions** can also be produced, possibly unintentionally, by casting a signed integer type to a larger representation. Casting a char to an int will cause a sign extension, which is expected as the sign of the number should remain the same. But casting a char to an unsigned int will also cause an unintentional sign extension, possibly filling the upper bits with ones or zeroes. Sign extensions of this type can corrupt data if smaller chunks of data are aggregated using shift and mask to construct a wide type. Since the sign extension only occurs if the **source** type is signed, avoid this error by casting twice, once to a narrow unsigned type and again to the wide type: 

```c
unsigned int x = (unsigned int)(unsigned char)y;
```

#### Large bit shifts

Some processors, such as the HCS12 and AVR \([Arduino](../electronics/external-boards/arduino.md)\) architectures, only support shifting one position at a time. Compilers may generate large numbers of bit-shift instructions, or even a loop, to shift by large or variable quantities, which can slow down execution. However, on some other processors such as ARM \([Raspberry Pi](../electronics/external-boards/raspberry-pi.md),[ VEX V5](../electronics/vex-electronics/vex-v5-brain/), [Pandaboard](../electronics/external-boards/pandaboard.md), ...\) architectures, bit shifting is actually free and costs zero clock cycles in almost all cases, further increasing the value of smart shifting. Modern optimizing compilers will often optimize constant _unsigned_ multiplications or divisions by powers of two into bit shifts.

Shifting by multiples of eight can be even more efficient, as compilers will instead copy the shifted value using a byte offset corresponding to the number of locations shifted, then [mask](bit-mask.md) the invalid locations with the desired fill value.

### Rotations

Bit rotates are less common than bit shifts; instead of losing shifted bits and replacing them with a particular fill value, bit rotations take bits off of one side of a binary number and put them back on the other. This does not correspond to any particular familiar arithmetic operation, and is mostly used in cryptography and hashing algorithms.

## Uses

* **Multiplication and division** - Bit shifts have the same effect as multiplying or dividing by a power of two, but are usually much, much faster. Instead of dividing by 8, shift right by three.
* **Exponentiation with a base of 2** - Left shifts by n bits on the constant 1 will produce the value 2^n. When using this feature, beware of arithmetic overflow. 
* **Bit mask generation** - Given a bit position n, one can generate a positive bit mask by performing \(1 &lt;&lt; n\) or a negative mask by performing ~\(1 &lt;&lt; n\). This is very useful when manipulating [registers](register-programming.md) or [GPIO](../electronics/gpio.md) pins.
* **Bit mask checking** - To check to see if a particular bit in a binary number is set, shift it right by that many positions and mask by 0x01. While it is faster to mask the original value by a pre-shifted bit mask, this method works for variable arguments and generates a canonical \(0/1\) boolean value which is more useful in future instructions.
* **Wide type generation** - Multi-byte wide types can be generated from their byte components by shifting each byte a specified number of locations \(a multiple of eight\) to make them fit into the destination number at the correct place.
* **Bit/byte decomposition** - Shifting a multi-byte type left or right is often used to break it down into byte or bit-sized components \(in combination with an appropriate mask\).

