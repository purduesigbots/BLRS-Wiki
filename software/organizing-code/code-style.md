---
description: Style == Success
---

# Code Style

## What is code style?

Code style is the idea that code should be formatted in a standardized, readable, and functional way that does not inhibit debugging or peer reviews. Another benefit of good code style (especially in object oriented programming languages) is the ability to code to be easily expandable and added to.&#x20;

## Reasons for code styles:

As the code for your robots become more complicated, you will spend as much reading code as you do writing it. This is especially true if you have several programmers on your team, all writing code for your robots.&#x20;

This is why having good code style for your robots is important. Being able to easily understand and read the code makes it easier to iterate and make your code better. Otherwise, you'll spend lots of time figuring out what your teammates and your past-self had written.&#x20;

Here are a couple examples:

```cpp
// Good Style Example
class Robot {
public:
    Robot() : speed(0), direction("North") {}

    void setSpeed(int newSpeed) {
        speed = newSpeed;
    }

    void setDirection(std::string newDirection) {
        direction = newDirection;
    }

    int getSpeed() const {
        return speed;
    }

    std::string getDirection() const {
        return direction;
    }

private:
    int speed;
    std::string direction;
};
```

```cpp
// Bad Style Example
class robot{
    public: robot():speed(0),direction("North"){}
    void setspeed(int newspeed){speed=newspeed;}
    void SetDirection(std::string newDirection){direction=newDirection;}
    int getspeed(){return speed;}std::string GetDirection(){return direction;}
    private:int speed;std::string direction;};
```

While both of these pieces of code do effectively the same thing, the inconsistency and lack of proper spacing makes reading the bad code much more difficult.&#x20;

## Rules of code standards:

There are many different code style standards, and the specific one you use doesn't mater so much as you adhere to the following principles:

1. Your code style is consistent across your project(s)
2. All members of the team understand and cooperatively enforce the standards.&#x20;
3. The style should not inhibit the functionality of the code.&#x20;

## Appendix: Professional Code Style-Guides

These are reference style guides that exhibit the traits mentioned above.&#x20;

* [Google C++ Style-guide](https://google.github.io/styleguide/cppguide.html)
* [LLVM Coding Standards](https://llvm.org/docs/CodingStandards.html)
* [Firefox C++ Coding Style](https://firefox-source-docs.mozilla.org/code-quality/coding-style/coding\_style\_cpp.html)

### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)



