---
slug: final
title: We finally have FINAL
description: We finally have FINAL
date: 2025-02-03T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: [final]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

There's nothing worse than seeing people abusing variables. They're so delicate and yet so badly treated, poor things. Here's a way to show them some love.

<!--more-->

There are many ways to mistreat a variable. Of course, the worst is to make it global. Of course, there are lots of other ways to treat them badly. Giving them obscure names, for example.

But there's one way of mistreating variables that bothers me and isn't talked about much: reusing them.

Example:

```abap
METHOD execute.
  DATA sum TYPE i.

  LOOP AT itbl1 INTO DATA(wa).
    sum += wa-amount.
  ENDLOOP.

  LOOP AT itbl2 INTO wa.
    sum += wa-amount.
  ENDLOOP.
ENDMETHOD.
```

Look at `wa` being reused. As innocuous as it sounds, each of those `LOOPs` should be completely independent.

But now, fortunately, we have `FINAL`. It was introduced in version 2022 (7.57).

`FINAL` makes it possible to guarantee that a variable is not reused. Simple. Basically, when you use `FINAL` to declare a variable, it becomes a constant as soon as it is initialized.

The rule I use today is simple: I always use `FINAL` instead of `DATA`. You'll find that, if you make clean code, you'll rarely need to use `DATA`.

Let's improve the example a little with `FINAL`:

```abap
METHOD execute.
  DATA sum TYPE i.

  LOOP AT itbl1 INTO FINAL(wa1).
    sum += wa-amount.
  ENDLOOP.

  LOOP AT itbl2 INTO FINAL(wa2).
    sum += wa-amount.
  ENDLOOP.

  " etc
ENDMETHOD.
```

And you ask: but if the two `wa` are of the same type, why do you need two? I understand. It's tempting. But don't think like that. That was back when making a mess was acceptable. The two `LOOPs` are different things, keep them separate. You'll have fewer bugs this way.

And I'll even go further: [a method is supposed to do only one thing][1] and this one is already doing two. In this case, and because the two internal tables are of the same type, we can do this:

```abap
METHOD calc_sum.
  RETURN REDUCE i( INIT x = 0 FOR wa IN itab NEXT x = x + wa ).
ENDMETHOD.

METHOD execute.
  FINAL(sum) = calc_sum( itbl1 ) + calc_sum( itbl2 ).
  " etc
ENDMETHOD.
```

See how easy it was to get rid of the other `DATA` that wasn't even the most problematic?

Internalize this: the fewer variables you use, and the smaller their scope, the better.

By the way, the easiest way to spot that a variable is being reused is when `CLEAR` starts appearing in the code. I already [wrote about it][2] in the past. If you need to clean a variable, it's because it's dirty. If it's dirty, it's because you're not a very hygienic programmer. If you have to use `CLEAR`, be wary of what you're doing. There's probably a cleaner way of doing the same thing that doesn't require `CLEAR`. When I see a `CLEAR`, I'm immediately wary.

So, the conclusion is: always try to use `FINAL` instead of `DATA`. If the compiler complains then it's because the variable is being reused. Consider rethinking your code so you don't need it.

Thank you Aurélien Albert for the tip.

Greetings from Abapinho.

[1]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#do-one-thing-do-it-well-do-it-only>
[2]: {{< ref "evita-o-clear" >}}
