---
title: 'Benefits of LIKE LINE OF'
slug: vantagens-do-like-line-of
date: 2012-11-26 09:00:40
tags: [estilo]
categories: [dicas]
wordpressId: 2061
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Let's start by assuming that you have some dignity and so you don't use internal tables with HEADER LINE anymore ;)

Given this, let's suppose you declare an internal table:

<!--more-->


{{< highlight ABAP >}}
DATA: T_KNA1 TYPE STANDARD TABLE OF KNA1.
{{< /highlight >}}

If you want to read data of T_KNA1 by doing LOOP or READ TABLE, you need to save the read register in a structure or in a FIELD-SYMBOL. Let's choose a structure.

Traditionally we would declare it like this:


{{< highlight ABAP >}}
DATA: S_KNA1 TYPE KNA1.
{{< /highlight >}}

Instead, my suggestion is that you declare it this way:


{{< highlight ABAP >}}
DATA: S_KNA1 LIKE LINE OF T_KNA1.
{{< /highlight >}}

The two main advantages of doing so are:

  * If the register type changes you just need to update it somewhere;

  * It becomes clearer that S_KNA1 is connected to T_KNA1.

Thank you [thienzieyung][1] for the photo.

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/thienzieyung/6937202094/
