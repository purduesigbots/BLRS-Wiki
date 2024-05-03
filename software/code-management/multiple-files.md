# Multiple Files

When the code to your robot becomes large enough, splitting it into multiple files can help structure your code and make it easier to find things.&#x20;

## Header vs. Source Files:

In C and C++, you'll commonly find source (implementation) files and header (API) files. Source files contain the actual functionality of your program, and header files define the functions, variables, etc. that are viewable by other files in the code.&#x20;

Source files typically end `.c` for C code, or `.cpp` or `.cxx` for C++ code.

Header files typically end with `.h` for C and C++ code, or `.hpp` or `.hxx` for C++ code.

Typically, but not always, you'll find one header file per source file.&#x20;

### #include

In a source file, you can&#x20;

### Header Guards

Its important to ensure that headers are only included once in each source file. This is done with header guards:

```cpp
#ifndef MY_HEADER_HPP
#define MY_HEADER_HPP

// Your public definiitions go here

#endif//MY_HEADER_HPP
```
