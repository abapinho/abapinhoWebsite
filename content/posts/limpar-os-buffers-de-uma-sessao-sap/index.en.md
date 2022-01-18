---
title: 'Clearing the buffers of an SAP session'
slug: limpar-os-buffers-de-uma-sessao-sap
date: 2014-10-13 09:00:25
tags: [sapgui]
categories: [dicas]
wordpressId: 2904
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
I keep learning new transaction commands. Today I learned some which solve a problem which, although rarely, has happened to me in the past.

Did this happen to you? You make a change to a text of a data element you’re using in a table to be edited through SM30. But when you go and edit that table in SM30 the old text is still there. You activate objects, close windows, open windows, no matter what you do, the new text is not shown.

<!--more-->

The old text is cached somewhere in SAPGui.

To solve this you can write the following commands in the transaction field:

  * /$sync (clear buffer)

  * /$tab (clear table related buffers)

It’s always nice to know these obscure little secrets. Thank you Sérgio Serra for revealing this one to me.

Thank you Prime Number for the [photo][1].

Greetings from Abapinho.

   [1]: https://flic.kr/p/4q2bt4
