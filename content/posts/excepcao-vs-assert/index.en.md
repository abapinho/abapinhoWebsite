---
title: 'ASSERT vs Exception'
slug: excepcao-vs-assert
date: 2017-01-23 09:00:56
tags: [estilo]
categories: [dicas]
wordpressId: 3717
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['ASSERT vs Excepção']
description: 'Além de classes de excepções, o ABAP também disponibiliza o commando ASSERT. Aprende quando usar excepções e quando usar ASSERTs.'
---
If you read Abapinho you already know how much I like exception classes. But this is not the only ABAP mechanism for dealing with errors.

There is another one, called ASSERT, which should be used more often.

<!--more-->

What is ASSERT? It is a command that asserts that a given condition is true. If it is, all fine, nothing happens. But if it doesn't... we have a DUMP. And unlike exception classes, there is no way to avoid this dump. And that's a good thing.

Example:

{{< highlight ABAP >}}
ASSERT 1 = 0.
{{< /highlight >}}

DUMP!

But, why do the two mechanisms exist? And how to know which one to use?

Here's the rule of thumb:

* Use ASSERT to guarantee that the code is correctly written
* Use exceptions to handle run-time errors

Still confused? Let's use examples:

Example 1. A method called DIVIDE( A, B ) divides A by B. We all know that if B is zero we'll get a mathematical drama. This error depends on the value of B during run-time. As such, it should be handled by an exception.

Example 2. Method OPEN_FILE( F ) opens a file. What if the given file doesn't exist? Then we'll have nothing to open. This is again a run-time error depending on the value of F. Again, it should be handled by an exception.

Example 3. No picture an FTP class and its two methods FTP->SETUP( SERVER, PORT ) and FTP->OPEN( ). To correctly use this class before calling OPEN() we must always call SETUP() to define the target server. But someone wrote a program which calls OPEN() before calling SETUP(). This program is incorrect and will never work. It's a bug. The perfect scenario for using ASSERT. Method OPEN() should use ASSERT to make sure that SETUP() was already called as excepted. It can then also make use of an exception to handle the fact that opening the connection can fail, a run-time error which may or may not happen depending on the infrastructure.

**A failed ASSERT should always reflect a bug**. While an exception may only be the result of the current circumstances (invalid user data, temporary connection failure, etc).

So: ideally a class should use ASSERTs to guarantee that it is correctly programmed and that whoever uses it is doing it in the right way.

A good use of ASSERT makes the class much more robust because it allows the developer to immediately identify bugs which could otherwise go unnoticed.

ASSERT can be used by itself or associated with a CHECKPOINT GROUP as already explained [here][1].

Greetings from Abapinho.

  [1]: {{< ref "saabs-assertar-primeira" >}}
