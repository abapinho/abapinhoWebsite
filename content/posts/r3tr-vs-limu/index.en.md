---
title: 'R3TR vs LIMU'
slug: r3tr-vs-limu
date: 2013-05-06 23:00:21
tags: [sysadmin]
categories: [artigos]
wordpressId: 2259
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
You’ve screwed up the productive system. You made a change to a method of a class (or to a function, whatever). Someone else makes another change to another method of the same class (or to another function of the same group of functions, whatever) and saves it to a different transport. When you transport your changes to the productive system, you discover that the class (or function, whatever) now has a syntax error because the changes had interdependencies. You also discover that now, until you get this problem resolved, all your functional co-workers hate you.

<!--more-->

One way to solve the problem is to go looking for the other changes that were made and transport them too. You run the risk of spending hours sifting through every little thing – that’s if you don’t go completely bonkers first.

But there’s a simpler and more effective way: transport the entire class.

So I’ll give you a little lesson on transport orders. Pay close attention.

Entries in the registry of objects are made up of three parts:

  1. Programme-ID

  2. Object

  3. Object name

The first part, the Programme ID, is usually one of two things: R3TR or LIMU. And understanding what each one means is where the difference lies between being able to resolve the problem and have friends again or having everyone blame you for the company going belly up.

When you create a class (or group of functions, whatever), it is logged into the registry of objects as follows:

    R3TR CLAS ZCLXXXX (in which ZCLXXXX is the name of the class) R3TR FUGR ZYYYY (in which ZYYYY is the name of the group of functions)

No matter what you create in this class (or group of functions), until you release this order of transport, no other entries from the transport order will be added to the list of registry entries.

But now try to release this transport and make a change to a method or function or something else in the class or group of functions. You will find that the entries are now of the LIMU type:

    LIMU METH ZCLXXXX AAAA (in which AAAA is the name of the method) LIMU FUNC BBBB (in which BBBB is the name of the function module)

Now pay close attention to the descriptions of R3TR and LIMU:

  * R3TR – Total object

  * LIMU - Sub-object of the development environment

Eureka! Here lies the solution to all your problems:

Whenever you have problems because a group or class of functions is inconsistent in the quality or productive system, all you have to do is create an R3TR-type entry in a transport order with the name of this class or group of functions. When you transport the order, you will have to make sure that the entire object is transported. In the case of class, this means all the methods as well as the public, protected and private modifiers. In the case of the group of functions, implementation and definition of all function modules as well as the associated includes.

Follow this advice and you will quickly be back on good terms with the friends you lost.

The only thing you need to be careful about is making sure that all the methods or functions you are going to transport are really ready to be transported to productive so that you don’t end up fixing one side and screwing up the other.

Thank you cobra_55 for the [photo][1].

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/cobra55/6876086286/
