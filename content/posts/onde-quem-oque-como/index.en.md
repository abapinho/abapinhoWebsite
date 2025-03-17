---
slug: onde-quem-oque-como
title: Where? Who? What? How?
description: Find the answer to these questions before you start coding
date: 2025-03-17T09:00:00Z
tags: [oo]
categories: [artigos]
keywords: [Where Who What How]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
You've been asked to create a new feature. You're ready to build it. But hold your horses. Before you start, I suggest you find answers to a few questions. Finding a good answer to each of them is fundamental to ensuring that what you build is solid and elegant.

<!--more-->
Let's take an example to illustrate this idea more easily: you need to get a list of a customer's sales orders.

## Where?

The first question has to do with domains. Have you ever heard of _Domain Driven Development_? Think of your entire system code as a territory. Stand back and look at it from above, like someone in an airplane looking down that, in an understandable inversion between reality and existence, says “It looks just like Google Maps”! A sign of the times. But I got distracted. This joke has nothing to do with what I was going to say. Anyway. You look down and see zones, territories, borders. Maybe call them modules, or applications. Or something else. Call them whatever you like, as long as you identify and recognize them. They can be larger areas, like Finance or HR. But they can also be small territories, like Annual Sales Report or Payroll. It will depend on how your system is organized. And while we're on the subject, never forget that you probably have more power than you think to influence your system. To reinvent its borders. Or subdivide kingdoms into multiple counties. The better you know the territory your code inhabits, the easier it will be for you to decide where the new code you want to build will live.

In case you haven't figured it out yet, I'm talking about packages. A well-governed system is properly subdivided into a hierarchy of packages and sub-packages.

If your system still only has packages called `ZFI` and `ZSD` then you have a lot of work to do. Don't hesitate to claim small territories: start by creating a package for each development. I propose that those who run your system think of a finer hierarchy with 2 levels of `MAIN` packages under which you can then start creating `DEVELOPMENT` packages, each housing a development. The smaller the packages, the more organized the system will be and the easier it will be to navigate its map. By the way, this assumes that [ABAP Package Concept][1] is active in your system. If it's not, then it should be. Make sure it is.

There doesn't have to be just one right answer, of course. But there will certainly be at least one. That answer will be the name of the package where you create the new code.

To answer our concrete example, I'd say it would be cool to have a package dedicated to sales orders. Something like `ZSD_SO` where `SD` represents the Sales domain and `SO` represents the Sales Orders sub-domain.

## Who?

Come down now. You're no longer up in the clouds looking down at the map of your domain. Now you're a drone hovering in the air, buzzing just a few meters off the ground. On the ground you see a series of actors interacting with each other, buzzing with activity. You quickly recognize them: you see the baker, the fishmonger, the farmer, the truck driver and so many others. Ideally, everyone knows their job. If your system is well-constructed, what one knows how to do, the other no longer needs to know. They rely on each other. In this society everyone collaborates and the less they overlap the better: the more agile and elegant your organization is. They are easy to recognize by name. The baker doesn't catch the fish, does he? To answer this question, the first thing you need to do is find out if there are any people whose area of activity is related to what you want to build. If there isn't one, don't be afraid to create a new actor to suit your needs. Give it a fair, dignifying name that makes it easy to understand what drives it. But if you spot someone who already exists and is suitable for what you want to do, choose them.

So now we're talking about classes. A well-managed domain is populated by many small classes, each of which knows how to do little, but what little they do, they do well. Don't make the mistake of giving life to resourceful beings who know how to do too much. Instead, prefer pure, elegant, simple but virtuous beings. Keep your classes as focused as possible on a single activity. And try to use nouns to name them.

In our example, the obvious noun (or noun expression) is “Sales order list”. It therefore seems appropriate to call the class `ZCL_SD_SALESORDERS`. Note that it is plural because the example clearly talks about many sales orders. If you have features that apply directly to a particular sales order, don't put them in the same class. Instead, put them in a class called, for example, `ZCL_SD_SALESORDER`.

Once you've decided which class will house the new code, you should also think: is this class enough or do I need more? Identify as many as you need. If one of the classes you've identified is getting too complex, don't hesitate to subdivide it. Never let a class get too complex.

## What?

Land. You're on the ground now. You can see we're going to talk about the names of the methods now, can't you? That's it, I'm not going to get hung up on it.

After all, what exactly have you been asked to do? Describe it in one word. Or two. Or in a little expression. But man, don't be a cheat: If your method starts with `GET_`, don't write to the database or change attributes in the class. And if your method starts with `SET_` don't confuse people by making it return parameters. But above all, don't ever think that you're going to build all your functionality inside that method. Not at all. The answer to this question is just the name of the public method that will serve as the entry point to your new functionality. Unless what you have to do is really simple, that entry point should only contain high-level calls to several other methods that are also named with equal care.

In our example, the requested phrase is “Get list of sales orders”. The verb is “Get”. The noun is already reflected in the class name so we only have to worry about the verb: `GET_LIST`. It could be `GET` but that would be ambiguous as there may also be a need for a method to get just one and so we would be left with, for example, `GET_LIST` and `GET_SINGLE`.

## How?

Put on your gloves. We know where it's going to be done, we know who's going to do it and we know what's going to be done. All that remains is to decide how it will be done. In my experience, the answer to the first 3 questions often makes it much easier to answer this question. Above all, don't forget that whatever you do, this method should only do one thing. If it does several, then you should delegate those several things to several other methods. And, of course, you should apply this 4-question quiz to each of these methods. Only then will you be able to conclude what they should be called and whether they can exist in the same class or whether they should belong to another class, or even another package.

In this case, the how is the easiest. We'll probably do a `SELECT` to the `VBAK` table or something like that.

## Use composition

Note that an alternative possibility would be to choose the `ZCL_SD_CUSTOMER` class and the `GET_SALESORDERS` method. The problem with this is that you can associate a lot of functionality with the client. If you do, the `ZCL_CUSTOMER` class will quickly become ingestible. That's why the option we chose above is preferable. But you can have the best of both worlds. You create the `ZCL_SD_CUSTOMER->GET_SALESORDERS` method which simply calls the `ZCL_SD_SALESORDERS->GET_LIST` method. See? So the `ZCL_SD_CUSTOMER` class, being of a higher level, only serves as a facade for its functionalities, which are implemented in several other lower level classes.

Greetings from Abapinho.

[1]: {{< ref "arvore-de-pacotes-z" >}}
