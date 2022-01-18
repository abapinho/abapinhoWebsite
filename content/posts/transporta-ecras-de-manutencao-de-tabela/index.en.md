---
title: 'Transport a local table with its maintenance screens'
slug: transporta-ecras-de-manutencao-de-tabela
date: 2018-10-01 12:47:47
tags: [segredo, sysadmin]
categories: [dicas]
wordpressId: 4037
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'transportar tabela local'
description: 'Como transportar os ecrãs de manutenção de uma tabela que foi originalmente criada localmente? Duas soluções. manual e automática.'
---
Some time ago you created a table and its maintenance screens as local objects.

When, later, you regret it and decide to transport the table, how will you be able to also transport the maintenance screens?

Transporting the maintenance screens function group together with the table is not enough.

<!--more-->

There's something more you need to transport:


{{< highlight ABAP >}}
R3TR | FUGR | function group name
R3TR | TOBJ | ZTABS (table name with suffixed with an S)
R3TR | TABU | TVDIR
R3TR | TABU | TDDAT
{{< /highlight >}}

But it's even better if you use this tool which does the same in an automatic way:


{{< highlight ABAP >}}
SE54 > Utilities > Total Transport
{{< /highlight >}}

Thank you Ricardo Monteiro for the tip.

Photo: [Wanderin' Weeta][1].

Greetings from Abapinho.

   [1]: https://visualhunt.com/author/7f395d
