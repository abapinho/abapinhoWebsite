---
title: 'SALV consistency report'
slug: relatorio-consistencia-salv
date: 2017-07-18 09:00:08
tags: [salv, segredo]
categories: [dicas]
wordpressId: 3822
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['relatório consistência SALV']
description: 'Aprende como utilizar o relatório de consistência da SALV para descobrires todos os problemas que ela possa ter que de outra forma não descobririas'
---
Sometimes a SALV has inconsistencies which can go unnoticed. For example, if its structure has an amount field which doesn't have an associated currency field:

<!--more-->


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_s_data,
         bukrs TYPE bukrs,
         wrbtr TYPE wrbtr,
       END OF ty_s_data.

DATA: o_salv TYPE REF TO cl_salv_table,
      t_data TYPE STANDARD TABLE OF ty_s_data.

START-OF-SELECTION.

  cl_salv_table=>factory(
    IMPORTING
      r_salv_table   = o_salv
    CHANGING
      t_table        = t_data ).

  o_salv->display( ).
{{< /highlight >}}

Although hardly anyone knows it, SALV has its own consistency report. To run it you just need to press SHIFT+RIGHT_DOUBLE_CLICK in a white space of the screen. This is what you'll get for the code above:

[![Relatório SALV][1]][1]

Now that you know, don't go saying an ALV is ready until you've run its consistency check.

Thank you Pierre Ameye for the tip.

The photo is out of focus, I know, but I liked it.

Greetings from Abapinho.

   [1]: images/salv_relatorio.jpg
