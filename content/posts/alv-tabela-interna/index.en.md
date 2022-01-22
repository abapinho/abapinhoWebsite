---
title: 'Show internal table content on an ALV'
slug: alv-tabela-interna
date: 2019-09-30 09:00:54
tags: [alv, debug]
categories: [dicas]
wordpressId: 4279
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['tabela interna alv debug']
description: 'Como ver o conteúdo de uma tabela interna numa ALV durante o debug para poder filtrar, ordenar e manipular o seu conteúdo de forma mais práctica.'
---
I don't know for how long has this been available but I just now found out about it. In the debugger it is, after all, super easy to see the content of an internal table in an ALV.

<!--more-->

Since ever, when I needed to do something more complex with the content of an internal table, I'd have to export it into Excel. Boring. And after all, you can see it in an ALV right there just by clicking a button:

[![image][1]][1]

There it is, the magical button I had never noticed. Or... maybe it showed up with the recent upgrade to 7.50. You click it and the internal table's content is shown in an ALV, ready to be reordered, filtered and what not. So great.

Greetings from Abapinho.

   [1]: images/debug_table_alv.jpg
