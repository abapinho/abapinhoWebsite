---
title: 'Can you really do it right the first time?'
slug: saabs-assertar-primeira
date: 2016-03-07 09:00:13
tags: [debug]
categories: [artigos]
wordpressId: 3454
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'checkpoint groups'
---
Checkpoints is a very powerful ABAP framework which almost nobody uses. Why? Probably for the same reason hardly anyone listens to [Sun Ra][1] and knows that [Frank Zappa][2] has 102 albums. Because, even though really good, it’s obscure and not commercial. Checkpoints are, indeed, really good and not commercial. But they should be more like Mozart and the Beach Boys which are both good and commercial.

<!--more-->

When programming, a good programmer anticipates his code’s potential problems. And, by anticipating them, he can improve his code in two ways: design it in a way that avoids those problems altogether or, if they’re unavoidable, equip the program with ways to help detect and analyze these problems, when they occur.

And that’s exactly what Checkpoints are for. To help detect and analyze problems.

## What is it exactly?

There are 3 types of checkpoints: BREAK-POINT, LOG-POINT and ASSERT. These are always grouped under a checkpoint group which is the actual main SAP object used to manage them:

  * BREAK-POINT allows you to set fixed break-points in specific points of your program;

  * LOG-POINT allows you to register values in specific points of the program;

  * ASSERT is like a mix of the other two but with some extra powers because you can customize its behavior and also associate a logical condition to it.

_checkpoint groups_ and its 3 little friends are managed in transaction SAAB.

This framework (which includes the checkpoint groups and the 3 types of checkpoints) can be used to complement your program logic with a layer of code specifically dedicated to debugging it. It shouldn’t serve any functional purpose in the program and has nothing to do with program logs or error messages and it **definitely doesn’t replace exception handling**. Instead, these are only useful for debugging. And therein lies its virtue: it’s there, sitting in the program, sleeping, without wasting any resources, until the day someone decides to activate it in order to help him analyze why something’s not right.

And why do I need this?, you may say

I’ll give you 3 scenarios in which it may be useful:

## Scenario 1 - Analyze a dodgy bug

Something’s not right in program ZAPPA. There’s a bug somewhere and sometimes you get a division by 0. But it rarely manifests itself and only in the production system. You don’t know why. But the condition is so rare that manually debugging would be too hard. So you go to SAAB transaction and create a checkpoint group called ZAPPA. And then, right before the division you add an ASSERT command:


{{< highlight ABAP >}}
ASSERT ID zappa
  FIELDS kna1 divisor aux1
  CONDITION divisor eq 0.
{{< /highlight >}}

Also, you decide to add some extra break-points in some other key places in the program:


{{< highlight ABAP >}}
BREAK-POINT ID zappa 'keypoint 1'.

(...)

BREAK-POINT ID zappa 'keypoint 2'.
{{< /highlight >}}

The ASSERT command will store the KNA1 structure (yes, you can store a structure) and variables DIVISOR and AUX1 only when the codition DIVISOR=0 is true. Let’s assume these fields would be enough for you to find out what’s causing the problem.

And then you send this to production. Then, in production, you go to SAAB and create an “activation” for the user running the program and configure the checkpoint group to just log any ASSERT command, setting a one week deadline. And off you go. One week later the checkpoint group will automatically deactivate itself. But the log will be there, available in SAAB for you to analyze.

So one week later you can go there and see if anything was caught in that net. For each type the condition was true you’ll get an entry for that ASSERT where you can see the content of the variables you listed in the ASSERT command. And you find the solution to the problem.

Now imagine that during your analysis you get suspicious of something and want to do an experiment. You go back to SAAB again and reconfigure the checkpoint group activation to also activate the break-points and change the ASSERT behavior to break-point instead of simply logging the values. You warn the user and ask him to let you know as soon as his program goes into debug mode. You take over his session, inspect the code, and find the solution to the problem.

## Scenario 2 - Find weak spots in your system

Let’s look at a typical CASE command:

{{< highlight ABAP >}}
CASE var.
  WHEN '1'.
    WRITE 'one'.
  WHEN '2'.
    WRITE 'two'.
  WHEN OTHERS.
*   I don’t know what to do here
ENDCASE.
{{< /highlight >}}

There are hundreds of CASE commands lying around your SAP system which don’t take proper care of the CASE OTHERS branch. This is not good and can have unexpected results.

So you decide to start your own investigation.

You create a new checkpoint group in SAAB called ZCASEOTHERS. Then you look for all CASE commands in which CASE OTHERS is not properly handled and you add the following code there:


{{< highlight ABAP >}}
  CASE var.
(...)
  CASE OTHERS.
    LOG- POINT ID zcaseothers
      SUBKEY sy- repid
      FIELDS var.
ENDCASE.
{{< /highlight >}}

Then, in the production system, you create a server activation (instead of a user activation) and just activate the LOG-POINTS and tell it to stay active until the end of the year.

Now you can monitor this checkpoint group ever once in a while to see how many of there CASE OTHER branches are being reached. And soon enough you’ll get enough data to decide on which ones should be reviewed.

## Scenario 3 - Programming for the future

This is, in my opinion, the ideal way of using this framework: to include it in your application’s design right from the start. When developing application ZAAP, instead of thinking that your code will be 100% semantically perfect, you anticipate that, given its complexity, it will inevitable have weak spots. So you create checkpoint group ZAPP and spread ASSERTs and LOG-POINTS in all critical spots you can think of. So that, at any moment these can be activated to make it easier to analyze the application while it is running. Like doing a biopsy instead of an autopsy, see?

## Conclusion

Checkpoints are awsome. And, if you read all this and will continue not using them then you can no longer say it’s because you don’t know about them or don’t know how to use them and will, from now on, feel guilty about it and whisper to yourself “I really should be using this”.

Greetings from Abapinho

   [1]: https://pt.wikipedia.org/wiki/Sun_Ra
   [2]: https://pt.wikipedia.org/wiki/Frank_Zappa
