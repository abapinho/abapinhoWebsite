---
slug: eclipse-adt-abap-doc
title: Eclipse ADT puts ABAP Doc to good use
description: SAPGUI doesn't even know what ABAP Doc is
date: 2025-04-29T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT ABAP Doc]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

ABAP Doc is an excellent way of integrating documentation into the code.

<!--more-->

## SAPGUI

SAPGUI doesn't even know what that is.

## Eclipse ADT

Eclipse ADT not only allows you to create ABAP Docs, it's also excellent at consuming them. Unlike normal comments, which are only useful if you go there to read them, ABAP Docs allow you to generate documentation that will actually be read, even remotely. As I explained in the [previous post][1], when you press `F2` on a word, be it a class, a method, a variable or anything else, a small contextual window appears with _Code element information_ which gives a series of details about that word: the data type, the description, and the ABAP Docs associated with it.

## Conclusion

So, if you're still using SAPGUI and you could be using Eclipse ADT, you're not the sharpest tool in the shed, are you?

Greetings from Abapinho.

[1]: {{< ref "eclipse-adt-f2" >}}
