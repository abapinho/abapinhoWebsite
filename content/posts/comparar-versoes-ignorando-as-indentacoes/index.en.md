---
title: 'Ignore indentions when comparing version'
slug: comparar-versoes-ignorando-as-indentacoes
date: 2016-12-05 09:00:31
tags: [sapgui]
categories: [dicas]
wordpressId: 3672
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'comparar versões ignorando indentação'
description: 'Quando se comparar versões por vezes aparecem diferenças que são alterações na indentação do código. Torna tudo confuso. Mas há solução.'
---
Sometimes, when comparing versions, several differences show up even when we did not make changes to the code. These differences may simply be a consequence of a Pretty Printer that altered code indentations. This makes comparing the versions confusing.

But ABAP Workbench lets you configure the diff tool to ignore indentations and even comments.

Just press F5 while there or go to the "Display Format> Settings" menu and adapt it to your needs:

[![diff][1]][1]

You're welcome ;)

Greetings from Abapinho.

   [1]: images/diff.jpg
