---
slug: debug-step
title: Trotting debugger
description: The size of the debugger step can be changed
date: 2022-04-11T09:00:00+01:00
tags: [debug]
categories: [dicas]
keywords: [debug size]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

There are many excuses not to use the new functional syntax of ABAP 7.4. One is complaining that it's impossible to debug.

But it is not.

<!--more-->

You try to debug a command like the one below:

```abap
result = REDUCE i(
    INIT count = 0
    FOR customer IN customers
    ( WHERE customer-name1(1) = first_letter )
    NEXT count = count + 1 ).
```

You'll quickly find that, even when you press F5 to advance a single step, the debugger will skip to the next command. Now you know why you hate the new syntax and will never try to use ever again.

This will happen to you if you don't know that there is a magical button to change the size of the debugger step:

![Debugger toolbar step size button][1]

When you press the "step size", the debugger stops galloping and starts trotting. Now F5 allows you to stop at each iteration of the `FOR` in the `REDUCE` command.

You'll have to find another excluse to avoid learning and using the new 7.4 syntax.

Photo: [Floortje Walraven][2].

Greetings from Abapinho.

[1]: <images/abap-debugger-icons-step-size.png>
[2]: <https://visualhunt.co/a7/93c73675>
