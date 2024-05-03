# Multiple Files (C/C++)

When the code to your robot becomes large enough, splitting it into multiple files can help structure your code and make it easier to find things.&#x20;

## Header vs. Source Files:

In C and C++, you'll commonly find source (implementation) files and header (API) files. Source files contain the actual functionality of your program, and header files define the functions, variables, etc. that are viewable by other files in the code.&#x20;

**Source files typically end `.c` for C code, or `.cpp` or `.cxx` for C++ code.**

**Header files typically end with `.h` for C and C++ code, or `.hpp` or `.hxx` for C++ code.**

Typically, but not always, you'll find one header file per source file.&#x20;

## In Practice:

**When using objects in the context of a header and source file, be sure to:**

1. **Declare your classes and functions in header files:** Define the class structure, its data members, and function prototypes in a header file with a `.h` or `.hpp` extension. The same applies for functions not associated with a class.&#x20;
2. In the header, be sure to use the **extern** keyword to declare that the motor, sensor, or other object is initialized somewhere else (see example below).&#x20;
3. **Implement your class methods in source files:** Write the implementation of your class methods in a source file with a `.cpp` (for C++) or corresponding extension. This keeps your code organized and improves compile time. This is not necessary with built in objects such as motors and other sensors.&#x20;

**Other good practices:**

1. **Use `#include` guards in header files:** To prevent multiple inclusions of the same header file, use `#include` guards or `#pragma once` at the beginning of your header files (more on this below).&#x20;
2. **Include the necessary header files in source files:** In your source file, include the header file of the class and any other headers necessary for the implementation with the `#include` directive.
3. **Separate interface from implementation:** Keep the class interface in the header file clear and concise, focusing on what the class does. Leave the how to the source file where you implement the methods.

## Header Guards

Its important to ensure that headers are only included once in each source file. This is done with header guards:

```cpp
#ifndef MY_HEADER_HPP
#define MY_HEADER_HPP

// Your public definiitions go here

#endif//MY_HEADER_HPP
```

If header guards aren't present, it may lead to compilation issues when a header file is included multiple times either directly or indirectly through other headers. This can lead to multiple definitions of the same class, function, or variable, causing compilation errors due to redefinition. Additionally, omitting header guards can significantly increase compile times as the same header is processed multiple times.&#x20;

**Under the hood, what #include does is blanket copying and pasting the header file into where the include is. That's why the redefinition may occur.**&#x20;

## Example Usage:

To summarize, source files can include a header file to make functions, variables, and other objects that were defined in another source file(such as a motor or a sensor) visible. It helps to keep code organized and readable.&#x20;

```cpp
#include "my_functions.hpp"

int main() {
  myFunction();
  m1.stop(); 
  return 0;
}
```

```cpp
// my_functions.hpp
#ifndef MY_FUNCTIONS_HPP
#define MY_FUNCTIONS_HPP

void myFunction();

extern pros::Motor m1; 

#endif // MY_FUNCTIONS_HPP
```

```cpp
// my_functions.cpp
#include "my_functions.hpp"
#include <iostream>

pros::Motor m1;

void myFunction() {
  m1.move(127); 
  std::cout << "Hello from myFunction!" << std::endl;
}
```

In most project layouts (such as a pros project), the **src** directory is used for storing the .cpp files, while the **inc** directory is used for storing header files.&#x20;

## Bad Example Usage:

**IncorrectMain.cpp**

```cpp
#include "bad_example.hpp"

int main() {
  undefinedFunction();
  return 0;
}
```

**bad\_example.hpp**

```cpp
#ifndef BAD_EXAMPLE_HPP
#define BAD_EXAMPLE_HPP

// Forget extern keyword, so every time this is included in a src file we are 
// "redefining" the motor object. 
pros::Motor m1; 

// Since we included this header file in both IncorrectMain.cpp and bad_example.cpp,
// we will now get a "multiple declaration error of pros::Motor m1" error when we
// compile.  

// Forgot to declare undefinedFunction here, so it's not visible to other files
// such as Incorrectmain.cpp

// (missing here)

#endif // BAD_EXAMPLE_HPP
```

**bad\_example.cpp**

```cpp
#include "bad_example.hpp"
#include <iostream>

void undefinedFunction() {
    std::cout << "This will cause a linker error since it's not declared in the header." << std::endl;
}
```

This code will result in a linker error because `undefinedFunction()` is implemented in `bad_example.cpp` but is not declared in `bad_example.hpp`, so `IncorrectMain.cpp` doesn't know about its existence.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
