---
slug: odeio-numeros-magicos
title: I hate magic numbers
description: Why does everyone love magic numbers in SAP?
date: 2026-04-20T09:00:00
tags: [magicos]
categories: [artigos]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Those who work in SAP think it's normal for everything to be represented by obscure codes that mean nothing. But it doesn't have to be this way. Stop it! Create human-readable codes please.

<!--more-->
Quite recently, I had to work on an already implemented feature that assigned roles to users: *Leader*, *electrician*, *welder*, and a few others. It was something like this:

|Code|Description|
|-|-|
|`01`|leader|
|`02`|electrician|
|`03`|welder|

Anyone looking at these codes in the tables was either very used to them or completely lost. But is there a need for this?

I know this is very common in the SAP world. My question is: why? Why?! We don't live in 1984 where space was scarce and every extra character was expensive. Today, kilobytes are a dime a (million) dozen. So why? Is it because you're used to it? Is it because it seems better to you? Do you just like obscure things? Stop it!

My mission here was to add some extra functionalities to the existing one. But the problems didn't stop there. To make matters worse, when a user had more than one role, instead of listing both, someone thought it was a good idea to use other magic numbers to represent role combinations:

|Code|Description|
|-|-|
|`04`|leader+electrician|
|`05`|leader+welder|

This idea is so bad that we decided it would be better to rewrite everything from scratch by creating a table to relate users and *roles*. And that's what I did. But this time without magic numbers, of course:

|Code|Description|
|-|-|
|`LEADER`|leader|
|`ELECTRO`|electrician|
|`WELDER`|welder|

I used `CHAR10` Instead of `NUM02`. Worse? No. Better? Yes!

Let's try an experiment: without looking at the tables above, tell me: what does `02` represents? Do you still remember? And now tell me if you know what `LEADER` represents? You probably don't even have to guess, right? Of course!

SAP has enough obscure things as it is. Don't invent new ones that aren't necessary.

Thank you Janan for the [photo][1].

Greetings from Abapinho.

[1]: <https://unsplash.com/photos/gray-rabbit-on-brown-wood-log-302xfiIGOfE>
