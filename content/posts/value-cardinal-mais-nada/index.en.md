---
slug: value-cardinal-mais-nada
title: "VALUE #( ) and nothing else"
description: "You can use VALUE #( ) to pass an empty pointer to an instance"
date: 2026-04-20T09:00:00
tags: [value]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
I once wanted to test a class whose constructor took several parameters, each requiring an instance of a different interface. These instances weren't easy to create and weren't relevant to the test. After some experimenting, I found a way to work around the problem.

<!--more-->

Ideally, the class is instantiated with the following parameters:

```abap
FINAL(cut) = NEW zcl_person(
  head = my_head
  arms = my_arms
  legs = my_legs ).
```

I have the `head` but I don't have the `arms` nor the `legs`, and I don't feel like creating them because I don't need them for the test. So I can do the following:

You could do this:

```abap
DATA my_arms TYPE REF TO zif_arms.
DATA my_legs TYPE REF TO ZIF_legs.
FINAL(cut) = NEW zcl_person(
  head = my_head
  arms = my_arms
  legs = my_legs ).
```

But there is a nicer and simpler way:

```abap
FINAL(cut) = NEW zcl_person(
  head = my_head
  arms = VALUE #( )
  legs = VALUE #( ) ).
```

This way you can instantiate the class even without having all the parameters. Bear in mind that `arms` and `legs` will be `INITIAL`, so if they are accessed inside, it will obviously crash. But if they aren't accessed, here's an easy way to instantiate the class.

Greetings from Abapinho.
