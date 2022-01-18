---
title: 'Convert class exception to BAPIRET2'
slug: converte-classe-excepcao-numa-bapiret2
date: 2016-12-12 09:00:06
tags: [oo]
categories: [dicas]
wordpressId: 3679
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['BAPIRET2']
description: 'Como converter uma classe de excepção numa estrutura tipo BAPIRET2 para, por exemplo, poder adicioná-la a uma tabela de logs.'
---
Some time ago I wrote an article explaining a way to automatically [convert classic exceptions to exception classes][1]. Today I use this technique in almost all the exception classes that I create (and I've even improved it, but I'll leave that for another post).

This tip explains the exact opposite.

<!--more-->

It is less likely but not impossible that you need to convert an exception class into a BAPIRET2 message. To save it to a log table, for example.

And SAP already has a function module that does exactly this:

RS_EXCEPTION_TO_BAPIRET2

And that’s it really. A simple tip.

Greetings from Abapinho.

   [1]: https://abapinho.com/en/2015/06/converter-except-in-exception-class
