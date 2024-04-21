---
slug: eclipse-adt-mudanca-de-contexto
title: No constant context changes in Eclipse ADT
description: In SAPGUI you're constantly switching contexts
date: 2024-04-01T09:00:00Z
tags: [eclipse]
categories: [artigos]
keywords: [Eclipse ADT context switching]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Every time you switch contexts, you lose the thread slightly. It's human nature. So the less you do, the better.


<!--more-->

## In SAPGUI

The classic `SE24` only shows one thing at a time. If you're in one method and want to see another, you have to change context. And since SAPGUI has to talk to the server at each context switch, there is always a delay that can be irrelevant or substantial, depending on the network and the system. This wasn't a big deal when everything was programmed in a single include with hundreds of lines. But if you're a modern ABAPer, you'll modularise the class code into several methods. And now you say: but nowadays you can switch to _Source mode_ and see the entire code of a class. That's true. And that's how I always use `SE24`. But if, as well as being modern, you're a sophisticated ABAPer, you'll want to split the code between several classes. And then you'll always have to change context. OK, SAPGUI allows you to open 5 windows per session, and that might work when you're only working on 3 or 4 fixed methods. But if, as well as being modern and sophisticated, you're a dynamic ABAPer, you'll constantly be doing things like looking at a structure in `SE11` to see what the data element of a particular field is, or consulting the interface of a method to check what the input parameters are, etc. And then, dear reader, SAPGUI will only get in your way.

## In Eclipse ADT

By default, Eclipse ADT shows you the entire class. You can open dozens of classes in several tabs. What's more, you can easily subdivide the screen into several adjacent windows, horizontally and vertically, to see several things at once. If you're working on two different methods of the same class, you can do _split Window_ and the window will split in two to show two different areas of the same class. So, you can easily organise the screen to show you everything you're working on at the same time. Whatever isn't visible but is open in other tabs is just a click or keyboard shortcut away, instantly, without the need to talk to the server.

That's fantastic, isn't it? But there's more.

If you have the code of a class open and you want to know the data element of a particular variable or the interface of a method you're using (or many other things) you just need to place the cursor over it and press `F2`. You'll get a nice little pop-up with all the details you need. The code is still there, visible, waiting for you.

There's more.

You can do _where-used_ on top of anything. The code doesn't go anywhere because the _where-used_ results appear in their own window next to it. The same goes for _ABAP Test Cockpit_, running _ABAP Units_, _Package validation_, etc.

Always always always without changing context.

## Conclusion

So, if you're still using SAPGUI and you could be using Eclipse ADT, you're not the sharpest tool in the shed, are you?

Greetings from Abapinho.
