---
slug: nao-se-acerta-a-primeira
title: It's normal to not get it right the first time
description: It's normal to not get it right the first time
date: 2025-04-07T09:00:00Z
tags: []
categories: [artigos]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---
In the ABAP world, the rule is to do it once and never touch it again. Once done, forever frozen. What nonsense.
<!--more-->
The truth is that whatever you do, whoever you are, it's unlikely to be perfect the first time.

As such, we can infer that almost everything done in ABAP is imperfect.

I would argue the opposite. Whatever you do, assume that it's just an imperfect first draft.

Your first version may already work, but it's unlikely that you got the names of things and the structure of the code right first time. The next day, or when you're running your first tests, you look at the code again and discover that a method with a plural name was actually singular, or you find that a class is dealing with two things and should therefore be transformed into two classes, or you get confused by a `LOOP` that's too big and [decide to subdivide it][1] to make it easier to understand, or even find a better or simpler way of doing the same thing.

And now you're saying: "Dear Nuno, you must have a lot of free time. I don't have time for that in my project!" I'll tell you two things about that: firstly, revising and rewriting doesn't have to take long. On the contrary, if you already follow the [Clean ABAP][2] standards and use [Eclipse ADT][3], you can make many radical changes in 5-10 minutes. And these 5-10 minutes can make all the difference. Making these kinds of touch-ups, corrections and restructurings in Eclipse is very quick and painless. And then, if you don't get the names of the methods, classes and variables right, the time you've saved by not correcting them will be lost in the future by someone (or many someones) trying to understand the mess you've made.

And I'll tell you a third thing: this exercise of looking at your own code critically, assuming that you can improve it, will allow you to constantly evolve. With each revision you gain experience. After a while, you'll be able to do many things right the first time that you always did wrong before. It's also a way of investing in yourself.

Greetings from Abapinho.

[1]: {{< ref "split-loop" >}}
[2]: <https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md>
[3]: <https://abapinho.com/tags/eclipse/>
