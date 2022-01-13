---
title: 'Chained exceptions'
slug: cadeias-de-excepcoes
date: 2015-02-02 09:00:48
tags: [estilo, oo]
categories: [artigos]
wordpressId: 2976
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Today I will teach you how to chain exceptions. It’s a very practical solution to a complicated, not so obvious problem.

Let’s start by describing the problem.

Imagine you are in the application BANANA.
The application is quite complex.
It has three modules: BANANA1, BANANA2 and BANANA3.
Each one has its exception class ZCX_BANANA1, ZCX_BANANA2 and ZCX_BANANA3.
Since the application is in fact well designed, all the exception classes inherit from the same ZCX_BANANA.
Now imagine the following scenario.
You are in the BANANA1 module doing something.
There, you must call a class from the MORANGO module.
Of course, this class launches exceptions of the type ZCX_MORANGO.
This is the context.

You have several options:

Option 1: Declare the external exceptions
The method which calls the MORANGO class declares the exception ZCX_MORANGO in RAISING.
All of the methods which call it must declare it as well.
Henceforth, to the top of the call hierarchy.
It’s a big mess.
Imagine that BANANA must also use classes from the modules ABACATE, LARANJA and UVA.
It will also have to declare the respective exception classes in every method which uses them.
The more complex it is, the more confusing it all becomes.
This is not what we want.
Generally, anyone who does this ends up having to do a CATCH CX_ROOT, which is somewhat unhealthy.
For all of these reasons, option 1 should be avoided.
Except in very simple scenarios.

Option 2: Convert external into internal exceptions
Each BANANA method which invokes MORANGO methods always does TRY CATCH for ZCX_MORANGO and immediately launches an exception of the type ZCX_BANANA.
This even works.
The problem is that, for each exception of MORANGO, there must be an equivalent exception of BANANA.
If it’s just one, everything’s okay.
But in the case of dozens, it becomes silly.
And it’s not very secure.
Each of the exceptions created will have to replicate the specific text of the respective MORANGO exception.
This is not very practical.
This is because if tomorrow someone changes something in MORANGO, then BANANA becomes outdated.
It also tends to generate a large amount of confusion.
For all of these reasons, option 2 should be avoided.
Except in very simple scenarios.

Option 3: Use PREVIOUS to create chained exception
All exception classes have an attribute called PREVIOUS.
This is a reference for each exception class.
When the BANANA method invokes methods of MORANGO it always does TRY CATCH to ZCX_MORANGO.
But it does not launch a specific exception for each exception of MORANGO.
Instead, it always launches the same ZCX_BANANA exception.
But I have assigned the MORANGO exception to the PREVIOUS of the BANANA exception.
Whoever handles all the exceptions at a higher level only has to see whether the PREVIOUS has any content.
If it does, then it presents/saves/processes the exception there as well.
Ideally this should be done in LOOP.
In the event the exception of PREVIOUS has, in turn, another exception in its own PREVIOUS.
This is the best of both worlds:
Future proof code, which does not lose the information of specific exceptions.
For me, this is the best option.

I hope the both problem and the solution I propose are clear.

I leave you now with a simplified implementation of option 3:


{{< highlight ABAP >}}
TRY.
  TRY.
      o_morango1->cresce().
    CATCH cx_morango INTO o_exp.
      RAISE EXCEPTION TYPE cx_banana
        EXPORTING
          previous = o_exp.
  ENDTRY.
CATCH cx_banana INTO o_exp.
  WHILE o_exp IS BOUND.
    log( o_exp ).
    o_exp = o_exp->previous.
  ENDWHILE.
ENDTRY.
{{< /highlight >}}

Thank you Clark for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/photos_by_clark/14418660613/
