---
description: if (starting_to_code) read_this_article();
---

# Basic Control Flow

## Understanding Control Flow in C++ for Beginners

Control flow in C++ determines the order in which the statements of your program are executed. It ensures that your program can make decisions, repeat tasks, and handle multiple pathways. Let's explore the fundamental control flow structures in C++ that you need to know as a beginner.

{% hint style="info" %}
`std::cout`is used extensively in this article as an example. `std::cout` prints text to the console. For example, `std::cout << "Hello, World!\n";` prints "Hello, World!" followed by a new line. It's equivalent to `print("Hello, World!")` in python.&#x20;
{% endhint %}

The simplest form of control flow is sequential execution, where the program executes statements one after the other.&#x20;

```cpp
#include <iostream>
int main() {
    std::cout << "First statement\n";
    std::cout << "Second statement\n";
    return 0;
}
```

In this example, the program prints "First statement" followed by "Second statement."

**Now to experienced programmers this might seem obvious, why is this important to keep in mind as a beginner?**&#x20;

Simply put, as a beginner you need to remember the code executes **line to line, left to right.** Many programmers make the mistake of believing that code executes in blocks or chunks rather than one line at a time.&#x20;

### 2. **Conditional Statements**

#### If-Else

The `if-else` structure allows your program to execute certain code based on a condition.

```cpp
int x = 10;
if (x > 5) {
    std::cout << "x is greater than 5\n";
} else {
    std::cout << "x is not greater than 5\n";
}
```

In this example, the program checks if `x` is greater than 5. If true, it runs the first block of code; otherwise, it runs the second block.&#x20;

#### Else If

When you have multiple conditions, you can use `else if` to check them sequentially.

```cpp
int score = 70;
if (score >= 90) {
    std::cout << "Grade: A\n";
} else if (score >= 80) {
    std::cout << "Grade: B\n";
} else if (score >= 70) {
    std::cout << "Grade: C\n";
} else {
    std::cout << "Grade: F\n";
}
```

#### Switch

The `switch` statement is another way to execute code based on a specific value. It is useful when you have many conditions to check against a single variable.

```cpp
int day = 3;
switch (day) {
    case 1:
        std::cout << "Monday\n";
        break;
    case 2:
        std::cout << "Tuesday\n";
        break;
    case 3:
        std::cout << "Wednesday\n";
        break;
    default:
        std::cout << "Other day\n";
        break;
}
```

In this example, the program prints the day of the week based on the value of `day`.

### 3. **Loops**

#### For Loop

The `for` loop is used to repeat a block of code a specific number of times. It is especially useful when you know beforehand how many times you need to iterate.

```cpp
for (int i = 0; i < 5; i++) {
    std::cout << "Iteration " << i << "\n";
}
```

In this example, the loop runs five times, printing the iteration number each time.

#### While Loop

The `while` loop repeatedly executes a block of code as long as a condition is true.

```cpp
int i = 0;
while (i < 5) {
    std::cout << "Iteration " << i << "\n";
    i++;
}
```

#### Do-While Loop

The `do-while` loop is similar to the `while` loop, but it guarantees that the block of code runs at least once, even if the condition is false initially.

```cpp
int i = 0;
do {
    std::cout << "Iteration " << i << "\n";
    i++;
} while (i < 5);
```

### 4. **Break and Continue**

#### Break

The `break` statement immediately exits the loop or switch statement, terminating further iterations.

```cpp
for (int i = 0; i < 10; i++) {
    if (i == 5) {
        break;
    }
    std::cout << "Iteration " << i << "\n";
}
```

In this example, the loop stops when `i` equals 5.

#### Continue

The `continue` statement skips the current iteration and continues with the next iteration of the loop.

```cpp
for (int i = 0; i < 10; i++) {
    if (i == 5) {
        continue;
    }
    std::cout << "Iteration " << i << "\n";
}
```

In this example, the loop skips printing when `i` equals 5 but continues with the next iteration.

### What's Next?

Basic control flow allows you to direct the execution of your program's statements in a meaningful way. Understanding and mastering `if`, `else if`, `switch`, `for`, `while`, and `do-while` loops, along with `break` and `continue` statements, will enable you to build complex and efficient C++ programs. As you gain more experience, these fundamental structures will become the building blocks for more advanced programming concepts.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
