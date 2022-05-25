---
description: >-
  A bit mask is an operation which selects certain bits to be manipulated (or
  not manipulated) from a binary number.
---

# Bit Mask

Bit masks are most commonly associated with bitwise AND and bitwise OR operations to remove unwanted bits while leaving the desired bits behind. Bitwise XOR operations can also be used with bit masks to selectively toggle bits of a number.

### Principles

Bit masks are nothing more than specially selected constants with binary values appropriate to their use. There are two principal types:

* A **positive bit mask** has a 1 in the position of the desired bits, and a 0 in the position of bits to leave unaffected.
* A **negative bit mask** has a 0 in the position of the bits to be changed, and a 1 in all other positions. A negative bit mask is the binary complement of the matching positive bit mask, and vice versa.

Positive bit masks are used with bitwise OR operations to selectively set bits in a number and leave others unchanged. To create a positive mask, compose a hexadecimal constant with a binary value containing 1 in each location that must be changed, and a 0 in all other locations. This can be done more clearly by bitwise ORing several shifted values to indicate exactly which positions are being set, as the compiler should optimize this at compile time into an equivalent constant. After the mask is created, using bitwise OR (| or |= in C) on the desired quantity and the mask will set those bits and leave all others unchanged.

Negative bit masks are typically created by taking the bitwise complement (\~) of a positive bit mask with the desired bits set. Negative bit masks must be used with bitwise AND (& or &=) to have the proper effect. Mismatching positive and negative masks with the wrong operation will cause unintended results, so comment clearly and check carefully.

### Examples

Clear all bits in the number 00111001 except for the 3rd and 4th bit from the right (bit positions 2 and 3, or (1 << 3) | (1 << 2)):

| ##(1 << 3)                       | (1 << 2) = 00001100## |
| -------------------------------- | --------------------- |
| 00111001 AND 00001000 = 00001000 |                       |

Set bit position 1 in the number 00111001:

| (1 << 1) = 00000010             |
| ------------------------------- |
| 00111001 OR 00000010 = 00111011 |

Clear bit position 4 in the number 00111001 using a negative bit mask:

| NOT (1 << 4) = 11101111          |
| -------------------------------- |
| 00111001 AND 11101111 = 00101011 |

## Applications

* **Register manipulation** - A typical low-level task might be to set or clear certain bits in a register while leaving all others unchanged. By appropriately masking the current register value (positive mask to set bits, negative mask to clear bits), this operation can be performed quickly. **Beware** - most processors will not do this atomically, and changes to the register value between the initial value read and masked value write will ruin the result.
* **Force value in range** - Comparing a value to an upper limit involves a slow branch instruction, and modulus is often slow as well. If the upper limit is a power of two, and the input is unsigned (or negative values are also disallowed), mask off all of the bits more significant than the desired bits. Items such as GPIO pins usually come in groups of eight or sixteen to use this feature to maximum advantage.
* **Add or subtract** - In some circumstances, bit masks can substitute for addition or subtraction. If a value known to be between 0 and 7 (inclusive) needs to be incremented by 8, one can positive-mask the value with 0x08, which will set the known-to-be-clear 3rd bit and therefore increase the number's magnitude by 8.
* **Test bit** - To see if a particular bit is set (another common register task), mask the value with an appropriately selected positive bit mask containing only that position and pass it straight into if (which will generate a fast condition-code check for zero on most processors).
* **Enforce type conversion** - C's type conversions can sometimes produce unexpected results, especially when switching between signed and unsigned types. Negative masking can often alleviate the problem by dictating exactly which bits in the result should keep their values from the conversion and which bits should be reset.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
