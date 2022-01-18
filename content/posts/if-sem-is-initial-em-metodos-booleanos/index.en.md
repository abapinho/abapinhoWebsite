---
title: 'IF without IS INITIAL in boolean methods'
slug: if-sem-is-initial-em-metodos-booleanos
date: 2019-08-27 09:00:07
tags: [7.4, estilo]
categories: [dicas]
wordpressId: 4244
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
My current client's system is finally being upgraded to 7.50 and, after all these years stuck with the old ABAP, I am now finally able to enjoy the wonders introduced in 7.40.

There are dozens of these wonders and I don't intend to start making a post on all of them as there is already so much quality information on most of them. Besides, Abapinho always tries to write about something new or, at least, not very known.

But this simple functionality, although not that extraordinary, pleases me: you no longer need to add IS INITIAL in an IF command when the condition is a method returning a boolean.

<!--more-->

Before 7.40:

{{< highlight ABAP >}}
IF do_check( ) IS INITIAL.
  do_something( ).
ENDIF.
{{< /highlight >}}

After 7.40:

{{< highlight ABAP >}}
IF NOT do_check( ).
  do_something( ).
ENDIF.
{{< /highlight >}}

It works well both for simple and structured return values.

I know that REDUCE and _inline_ and all the comprehensions and etc are much more useful and extraordinary. But, well, I like this small improvement so here it is for those who still didn't know about it.

Greetings from Abapinho.
