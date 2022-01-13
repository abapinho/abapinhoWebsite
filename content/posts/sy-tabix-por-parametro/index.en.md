---
title: 'Weird things happen when you pass SY-TABIX as a parameter'
slug: sy-tabix-por-parametro
date: 2016-12-19 09:00:47
tags: []
categories: [dicas]
wordpressId: 3684
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
The other day a very strange thing happened to me. I was sending SY-TABIX as a parameter into a method. Before the call it contained 1 but, once inside, the parameter's value was 0. Weird.

    o_thingalizer->very_strange_thing(sy-tabix).

I was hearing "Why?! Why?!" repeatedly inside my head.

But suddenly I understood it!

When you send some field of the SYST as a by parameter you have to pass it by value and not by reference. I was passing it by reference. But, inside the method, ABAP automatically cleaned the SY-TABIX because there it was no longer inside a loop.

Flagging it as a value parameter was all it took. The problem was solved.

It is logical but not at all obvious.

I hope someday this tip will be useful to someone.

Greetings from Abapinho.