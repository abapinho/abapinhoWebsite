---
title: 'Thou shalt modularize, modularize, modularize'
slug: encapsularas-encapsularas-encapsularas
date: 2015-05-11 11:40:10
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2715
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Historically ABAP programs tend to grow very loooong. All programming best practices teach us there is not a single advantage in this approach.
If any routine, be it a program, a method, a function or anything else, becomes longer than 200-300 lines, question it and seriously consider refactoring it into several sub-routines.
This has the added advantage of potentially increasing code reuse. But the greatest advantage is encapsulation, isolating variables in their local context, instead of having all of them together, resulting in safer and more readable code.
The Official ABAP Programming Guidelines book advises this in its chapter 2.2 KISS (pages 32-34).
https://help.sap.com/abapdocu_731/en/abenencapsulation_guidl.htm
