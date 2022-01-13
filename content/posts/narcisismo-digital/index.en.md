---
title: 'Digital narcissism '
slug: narcisismo-digital
date: 2012-08-27 09:00:38
tags: [dinamico]
categories: [dicas]
wordpressId: 1904
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
_Reflection_ is the ability of a program to see itself. ABAP has a series of reflective capabilities, such as RTTS or the ability to dynamically generate code. There are also a few other so-and-so functions that do this and that. Today I present one of them to you:

GET_GLOBAL_SYMBOLS

<!--more-->

This function returns an internal table with the list of all the variables used in a particular program. It couldn’t be easier to use:


{{< highlight ABAP >}}
DATA: t_fieldlist TYPE STANDARD TABLE OF rfieldlist.

CALL FUNCTION 'GET_GLOBAL_SYMBOLS'
  EXPORTING
    program      = sy-repid
*   NAME_PATTERN = '*'
  TABLES
    fieldlist    = t_fieldlist.
{{< /highlight >}}

The function populates the T_FIELDLIST internal table with 16 records, when running: 15 system variables and the T_FIELDLIST proper. If there were more variables declared in the program and more records they would appear there.

Thank you Nuno Morais for showing me this function.

And a very special thank you to Caravaggio for painting the picture that illustrates this text (Unfortunately, I had to cut off a bit at the top and bottom for it to fit. Anyway ... removing bits is no greater crime than reducing it to 150x150 pixels. Well, we can live with it.)

Greetings from Abapinho.
