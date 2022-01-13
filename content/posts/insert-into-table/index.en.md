---
title: 'Insert without raising exception in internal table with unique key'
slug: insert-into-table
date: 2021-07-05 09:00:51
tags: [estilo]
categories: [dicas]
wordpressId: 4690
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
How many times in your ABAP consultant life did you have to deal with dumps happening as a consequence of a program trying to insert duplicate lines into an internal table defined with a UNIQUE KEY?

Enough.

<!--more-->

Since the 20th century that we've gotten used to always using the APPEND command to insert in an internal table. But it's a been a while since [SAP is telling us][1] to stop using it and use INSERT INTO TABLE instead.

APPEND always adds a line at the end of the table. This is fine for STANDARD TABLEs, but if you try it on a SORTED TABLE you'll probably run into problems at some point. But INSERT INTO TABLE works with every kind of table.

INSERT INTO TABLE has another advantage: it doesn't raise exceptions. Instead, it uses SY-SUBRC to signal errors. This error must be handled, of course. But I don't really see a reason to use APPEND anymore.

This said, I have nothing against exceptions and my now favourite way to insert entries in an internal table is the new VALUE #() which raises exceptions when there are duplicate keys in tables with UNIQUE KEYs. It would be even more useful if they'd add a DISTINCT option to it.

Greetings from Abapinho.

Photo credit: [Jo Zimny][2]

   [1]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#prefer-insert-into-table-to-append-to
   [2]: https://visualhunt.co/a6/22e2dcd9
