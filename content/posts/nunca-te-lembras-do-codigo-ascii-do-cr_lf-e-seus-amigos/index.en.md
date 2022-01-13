---
title: 'Do you know the ASCII code for CR_LF and its buddies?'
slug: nunca-te-lembras-do-codigo-ascii-do-cr_lf-e-seus-amigos
date: 2015-12-21 09:00:56
tags: []
categories: [dicas]
wordpressId: 3348
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
I don't.

And I don't want to. Why waste memory on stuff like that?

And I don't need to because ABAP has a class just for that.

<!--more-->

Meet **CL_ABAP_CHAR_UTILITIES**. It has some methods to convert ENDIAN to number and vice-versa, but that's not why I'm talking about it. It's because of the constants it defines:

  * HORIZONTAL_TAB

  * VERTICAL_TAB

  * NEWLINE

  * CR_LF

  * FORM_FEED

  * BACKSPACE

  * and some more

When you need a CR_LF, instead of trying to find its ASCI code you can simply type CL_ABAP_CHAR_UTILITIES=>CR_LF and there you have it.

Thank you Sérgio Serra for the tip.

Greetings from Abapinho.
