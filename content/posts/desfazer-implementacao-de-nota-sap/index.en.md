---
title: 'Reset SAP note implementation'
slug: desfazer-implementacao-de-nota-sap
date: 2020-08-13 09:00:32
tags: []
categories: [dicas]
wordpressId: 4554
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['SNOTE']
description: 'Como desfazer facilmente uma nota implementada através da transacção SNOTE utilizando a própria transacção SNOTE.'
---
I remember when SAP notes had to be inserted by hand. Copy paste and pray that no mistake was made. Wild.

I actually remember a project which, for some strange obscure reason, instead of upgrading, decided to implement hundreds and hundreds of notes by hand. They printed them all and made a huge pile of paper and about 10 ABAP consultants spent the whole weekend trying to process the whole pile. We did it. But I have no idea what were the consequences and how many bugs were introduced. Many for sure.

<!--more-->

Fortunately we now have the SNOTE transaction which made this process automatic.

But... what if you regret having implemented a note in SNOTE?

While not everyone knows it, SNOTE can also help undoing it:

Menu **SAP Note > Reset SAP Note Implementation**.

[![image][1]][1]

Thank you Sérgio Fraga for the tip.

Photo credit: dps.

Greetings from Abapinho.

   [1]: images/undo_sap_note.png
