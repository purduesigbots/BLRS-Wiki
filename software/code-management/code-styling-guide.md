---
description: >-
  This guide exists to help your team standardize the look of code to prevent
  unnecessary merge conflicts and make code easier to read and understand.
---

# Code Styling Guide

## Indentation

Tab characters are generally better for indents.

Rationale: The whole idea behind indentation is to clearly define where a block of control starts and ends. Especially when you've been looking at your screen for 20 straight hours, you'll find it a lot easier to see how the indentation works if you have large indentations.

With tab characters, it is up to user preference how many characters deep indents look. No more flame wars (We're looking at you Linus. Eight characters, really?)

If you choose to exclusively use tabs, it is _highly_ recommended that you modify your Atom settings to ensure that tabs are always used for indentation. This setting can be changed by modifying Settings->Editor->Tab Type to "hard". This will prevent the editor from using spaces for indentation.

The preferred way to ease multiple indentation levels in a switch statement is to align the switch and its subordinate case labels in the same column instead of double-indenting the case labels. E.g.:

```c
switch (suffix) {
case 'G':
case 'g':
        mem <<= 30;
        break;
case 'M':
case 'm':
        mem <<= 20;
        break;
case 'K':
case 'k':
        mem <<= 10;
        // fall through
default:
        break;
}
```

Don't put multiple statements on a single line unless you have something to hide:

```c
if (condition) do_this;
  do_something_everytime;
```

Don't put multiple assignments on a single line either. Avoid tricky expressions.

Outside of comments and documentation, spaces are never used for indentation, and the above example is deliberately broken.

Get a decent editor and don't leave whitespace at the end of lines.

### Breaking long lines and strings

Coding style is all about readability and maintainability using commonly available tools.

The ideal maximum line length is 120 columns, and this is a strongly preferred limit.

Statements longer than 120 columns should be broken into sensible chunks, unless exceeding 120 columns significantly increases readability and does not hide information. Descendants are always substantially shorter than the parent and are placed substantially to the right. The same applies to function headers with a long argument list. However, never break user-visible strings such as printk messages, because that breaks the ability to grep for them.

{% hint style="info" %}
Note: since most people have screens that support 120+ characters across, there doesn't have to be an 80-character line length limit. However, documentation comments should strive to meet this limit for readability and everyone's sanity
{% endhint %}

## Braces

The other issue that always comes up in C styling is the placement of braces. Unlike the indent size, there are few technical reasons to choose one placement strategy over the other, but the preferred way, as shown to us by the prophets Kernighan and Ritchie, is to put the opening brace last on the line, and put the closing brace first, thus:

```c
if (x is true) {
        we do y
}
```

This applies to all non-function statement blocks (if, switch, for, while, do). E.g.:

```c
switch (action) {
case KOBJ_ADD:
        return "add";
case KOBJ_REMOVE:
        return "remove";
case KOBJ_CHANGE:
        return "change";
default:
        return NULL;
}
```

Functions also follow this standard:

```c
int function(int x) {
  body of function
}
```

Also, note that this brace-placement also minimizes the number of empty (or almost empty) lines, without any loss of readability. Thus, as the supply of new-lines on your screen is not a renewable resource (think 25-line terminal screens here), you have more empty lines to put comments on.

Do not unnecessarily use braces where a single statement will do.

```c
if (condition)
        do_this();
else
        do_that();
```

This does not apply if only one branch of a conditional statement is a single statement; in the latter case use braces in both branches:

```c
if (condition) {
        do_this();
        do_that();
} 
else {
        otherwise();
}
```

## Naming

C is a Spartan language, and so should your naming be. Unlike Modula-2 and Pascal programmers, C programmers do not use cute names like ThisVariableIsATemporaryCounter. A C programmer would call that variable tmp, which is much easier to write, and not the least more difficult to understand.

_However_, while mixed-case names are frowned upon, descriptive names for global variables are a must. To call a global function foo is a shooting offense.

_Global_ variables (to be used only if you really need them) need to have descriptive names, as do global functions. If you have a function that counts the number of active users, you should call that `count_active_users()` or similar, you should not call it `cntusr()`.

Encoding the type of a function into the name (so-called Hungarian notation) is brain damaged - the compiler knows the types anyway and can check those, and it only confuses the programmer. No wonder MicroSoft makes buggy programs.

_Local_ variable names should be short, and to the point. If you have some random integer loop counter, it should probably be called i. Calling it loop\_counter is non-productive, if there is no chance of it being misunderstood. Similarly, tmp can be just about any type of variable that is used to hold a temporary value.

If you are afraid to mix up your local variable names, you have another problem, which is called the function-growth-hormone-imbalance syndrome.

Functions and variables should be named in camelCase constants and macros should be defined in UPPER\_SNAKE\_CASE.&#x20;

## Functions

Functions should be short and sweet, and do just one thing. They should fit on one or two screenfuls of text, and do one thing and do that well.

The maximum length of a function is inversely proportional to the complexity and indentation level of that function. So, if you have a conceptually simple function that is just one long (but simple) case-statement, where you have to do lots of small things for a lot of different cases, it's OK to have a longer function.

However, if you have a complex function, and you suspect that a less-than-gifted first-year high-school student might not even understand what the function is all about, you should adhere to the maximum limits all the more closely. Use helper functions with descriptive names (you can ask the compiler to in-line them if you think it's performance-critical, and it will probably do a better job of it than you would have done).

Another measure of the function is the number of local variables. They shouldn't exceed 5-10, or you're doing something wrong. Re-think the function, and split it into smaller pieces. A human brain can generally easily keep track of about 7 different things, anything more and it gets confused. You know you're brilliant, but maybe you'd like to understand what you did 2 weeks from now.

In source files, separate functions with one blank line. In function prototypes, include parameter names with their data types.

## Comments

Comments are an integral part of having a good style guide. See our "[Writing Good Comments](writing-good-comments.md)" article for more details.&#x20;

## Miscellaneous

* Functions should be defined by:
* Typedefs may also be used to reduce `struct my_struct` to `my_struct_t` and `enum my_enum` to `my_enum_t`. Neither significantly remove information conveyed by the type name. If you're not sure if it's struct or enum by inference, then either rename the type or it doesn't matter.
* Pointers go with the type. `char* str` not `char *str`. I probably want to know that it's a pointer when looking at the type, not what it's pointing to and only maybe find out it's a pointer.

Wherever possible, don't use preprocessor conditionals `(#if, #ifdef)` in .c files; doing so makes code harder to read and logic harder to follow. Instead, use such conditionals in a header file defining functions for use in those .c files, providing no-op stub versions in the #else case, and then call those functions unconditionally from .c files. The compiler will avoid generating any code for the stub calls, producing identical results, but the logic will remain easy to follow.

Prefer to compile out entire functions, rather than portions of functions or portions of expressions. Rather than putting an ifdef in an expression, factor out part or all of the expression into a separate helper function and apply the conditional to that function.

If you have a function or variable which may potentially go unused in a particular configuration, and the compiler would warn about its definition going unused, mark the definition as \_\_maybe\_unused rather than wrapping it in a preprocessor conditional. (However, if a function or variable always goes unused, delete it.)

At the end of any non-trivial `#if` or `#ifdef` block (more than a few lines), place a comment after the `#endif` on the same line, noting the conditional expression used. For instance:

```c
c
#ifdef CONFIG_SOMETHING
...
#endif /* CONFIG_SOMETHING */
```

## Autoformatting

These rules can be [auto-formatted](../general/autoformatting.md).

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)
