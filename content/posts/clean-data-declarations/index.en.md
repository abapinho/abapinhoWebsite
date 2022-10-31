---
slug: clean-data-declarations
title: Clean data declarations
description: Follow Clean ABAP rules when for data declarations
date: 2022-11-07T09:00:00Z
tags: [estilo, cleanabap]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

While writing code, you should always keep present how easy it will be to maintain. This is particularly important in data declarations. And so easy to do right.

<!--more-->

## Dirty and hard to maintain

Look at this _very typical_ data declaration:

```abap
DATA: customers TYPE STANDARD TABLE OF kna1,
      counter   TYPE i.
```

Now imagine that you need to introduce a third variable called `grand_total` of type `f`:

```abap
DATA: customers   TYPE STANDARD TABLE OF kna1,
      counter     TYPE i,
      grand_total TYPE f.
```

Because of how untidy this data declaration is, even though you only added a new variable, you were forced to change the two existing ones:

- Relacing the period with a comma in the `counter` line because the command no longer ends there;
- Indenting the `TYPE` of both existing lines so that they all remain aligned.

At first sight this is not a big deal. But when, sometime in the future, someone tries to compare both versions, the 3 line swill show up as having been modified, even though 2 of them were not really modified.

## Oh so clean ABAP

In order to avoid this, you just have to take these two Clean ABAP rules into consideration:

- [Do not chain up-front declarations][1]
- [Don't align type clauses][2]

This is less common in ABAP, but much cleaner:

```abap
DATA customers TYPE STANDARD TABLE OF kna1.
DATA counter TYPE i.
```

This way, when you add a new variable, you no longer have to modify any of the existing lines:

```abap
DATA customers TYPE STANDARD TABLE OF kna1.
DATA counter TYPE i.
DATA grand_total TYPE f.
```

Much cleaner, right?

Also, keep in mind that, whenever possible, you should try to declare variables _inline_ when you first need them instead of upfront, like Clean ABAP also suggests [here][3].

Greetings from Abapinho.

[1]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#do-not-chain-up-front-declarations>
[2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#dont-align-type-clauses>
[3]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#prefer-inline-to-up-front-declarations>
