---
slug: eclipse-adt-compilacao-constante
title: In Eclipse the compiler is not lazy
description: eclipse-adt-compilacao-constante
date: 2024-03-25T09:00:00Z
tags: [eclipse]
categories: [artigos]
keywords: [Eclipse ADT compilador]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Still using SAPGUI instead of Eclipse ADT? Get ready to be made fun of.

<!--more-->

In this new series of articles, I'm going to give you, dear reader, a set of reasons why I consider myself entitled to make fun of you and badmouth you to others if you still use SAPGUI and `SE80` and `SE24` instead of the Eclipse ADT.

I don't even like Eclipse very much. I'm more of a Visual Studio Code fan. But Eclipse is still 10x better than SAPGUI. And I'll try to show you why.

## In SAPGUI

When you're writing code, the compiler is asleep. It only wakes up when you save, activate or check the code. And then what happens is unfortunate: probably because it's sleepy, it stops as soon as it encounters the first error. As long as you haven't corrected that first error, the compiler won't report any more. If your code has 50 errors, you won't get out until you've tried to activate it 50 times, correcting one error at a time. So sad it hurts.

Also, for some very strange reason, it only shows the _warnings_ if there is at least one error in the code. If there are no errors, it doesn't show _warnings_ even if the code is full of them. Why is that? I don't know. But it's very silly.

## In Eclipse ADT

The compiler is always working. It's tireless. While you're programming, all errors and _warnings_ are discreetly marked on the relevant line. These signals are constantly being updated. Just hover your mouse over one of them to see a description of the problem. Alternatively, you can open the _Problems_ window to see a list of them all. As you fix them, they will disappear. If there aren't any, you know you've successfully activated the code. Simple. Now that makes sense.

So, if you're still using SAPGUI and you could be using Eclipse ADT, you're a big geek.

Greetings from Abapinho.
