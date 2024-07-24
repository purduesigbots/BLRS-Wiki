---
description: namespace::feature()
---

# Namespaces (::)

Namespaces are an easy way to avoid name conflicts in large projects by grouping related code under a name. They help keep your code organized and prevent different parts of the program from interfering with each other. They can look like `namespace::feature` and might be slightly confusing to newer users.&#x20;

Here's a simple example of how to use namespaces in C++:

```cpp
#include <iostream>

// Define a namespace called 'First'
namespace First {
    // Inside this namespace, we define a function 'display'
    void display() {
        std::cout << "This is the First namespace." << std::endl;
    }
}

// Define another namespace called 'Second'
namespace Second {
    // Inside this namespace, we define another function 'display'
    void display() {
        std::cout << "This is the Second namespace." << std::endl;
    }
}

int main() {
    // Call the 'display' function from the 'First' namespace
    First::display();
    
    // Call the 'display' function from the 'Second' namespace
    Second::display();
    
    return 0;
}
```

In this example, both `First` and `Second` namespaces have their own `display` function. By specifying the namespace (using `First::` or `Second::`), you avoid any confusion between the two functions. **This is especially helpful in larger projects where different parts of the code might use the same function names.**&#x20;

PROS uses namespaces extensively with their `pros` namespace, while VEXCode uses their `vex` namespace accordingly.&#x20;

### Didn't Understand What was Written Above?

Ok let's use a non-code example:

Your friend asks for you to get a burger. However, you don't know what sort of burger they want.&#x20;

They could be asking for a burger from Burger King, McDonalds, or some other fast food restuarant!

If we were to treat the menus of these fast food restuarants as namespaces, and the burgers as functions or classes, they'd look something like this in C++:

```cpp
McDonalds::burger

Burger_King::burger
```

**Now, we can have foods (objects or functions) such as a "burger" from different resturaunts (namespaces).** &#x20;

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
