---
description: // Good (Comments)
---

# Writing Good Comments

## Function Level Comments

These should be placed immediately before the function prototype they are describing in a header file.

```c
/*
 * @brief Short description of the function
 * 
 * Extended description goes here. This should explain any semantic issues that
 * may arise when using the function. Below are descriptions of the function 
 * parameters. The value in the brackets can be either `in` or `out`, and 
 * represent the direction in which the parameter goes-- for example, the `dest`
 * argument for `memcpy` would be `out`, while the `src` and `n` arguments would
 * be `in`. Also note that grouped descriptions should be avoided unless the
 * grouped parameters are intrinsically linked-- for example, (x,y,z)
 * coordinates.
 * 
 * @param[out] param0_name      param0 description
 * @param[in]  param1_name      param1 description
 * @param      arg2,arg3,arg4   description of the multiple args
 * 
 * @return Description of the return value goes here. This can be omitted if the
 *              return type is `void`. This command will end when it reaches a
 *              blank line.
 */
```

### Inline Implementation Comments

Sometimes it is necessary to explain a particularly complex statement or series of statements. In this case, you should use inline comments, placed either immediately before or trailing the line or lines in question. In general, prefer placing such comments before offending lines, unless the comment is quite short. These comments should start with a // followed by a space. If they are placed trailing a line, they should be separated from the end of the line by one space.

```c
float Q_rsqrt(float number) { 
    long i;
    float x2, y; 
    const float threehalfs = 1.5F; 
    x2 = number * 0.5F; 
    y  = number;
    // perform some absolute magic on these numbers to get the inverse square root
    i  = *(long*)&y; // evil floating point bit level hacking 
    i  = 0x5f3759df - (i >> 1); // what the [heck]? 
    y  = *(float*)&i;
    y  = y * (threehalfs - (x2 * y * y)); // 1st iteration 
    //y  = y * (threehalfs - (x2 * y * y)); // 2nd iteration, this can be removed 
    return y; 
}
```

{% hint style="info" %}
In the above example, there is a line of code that has been commented out. This is fine to do while testing, but any commented out lines of code should be removed before any merge into the master branch takes place, unless a compelling reason can be presented for them to remain.
{% endhint %}

{% hint style="info" %}
Generally speaking, commenting each line is highly discouraged as it clutters code. Being clear and concise with comments is just as important as remembering to do comments. The general rule of thumb is that if the code itself is readable (unlike the example above), commenting why the code is written in such a matter is just as important as commenting what it does.&#x20;
{% endhint %}

### Notes to Other Developers (Or Yourself)

When writing code, it can sometimes be useful to leave notes to other developers or to yourself in the future. Examples of these include:

* `// TODO: something that should be done`
* `// NOTE: a note about something in the code`

Notes starting with these keywords (case sensitive) are automatically highlighted in the PROS Editor.

#### Teams Contributed to this Article:

* [BLRS](https://purduesigbots.com/) (Purdue SIGBots)

