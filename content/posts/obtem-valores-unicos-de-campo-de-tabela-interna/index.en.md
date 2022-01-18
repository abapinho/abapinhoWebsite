---
title: 'Get unique values of an internal table field'
slug: obtem-valores-unicos-de-campo-de-tabela-interna
date: 2020-03-16 09:00:08
tags: []
categories: [dicas]
wordpressId: 4423
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'valores únicos de campo'
description: 'Como obter os valores únicos de um campo de uma tabela interna usando apenas um único comando em vez dos clássicos LOOP e COLLECT.'
---
In SQL you can get a list of unique values of a field using DISTINCT. When the data is already in an internal table, before ABAP 7.40 you had to use a LOOP and a COLLECT.

But now that we live in more modern times, there is a simpler and more elegant way to achieve the same with a single command.

<!--more-->

Like this:


{{< highlight ABAP >}}
TYPES ty_t_land1 TYPE STANDARD TABLE OF land1 WITH KEY table_line.

SELECT * FROM kna1 INTO TABLE @data(t_kna1).

DATA(t_land1) =  VALUE ty_t_land1(
    FOR GROUPS land1 OF wa IN t_kna1
    GROUP BY wa-land1 ASCENDING
    WITHOUT MEMBERS
    ( land1 ) ).
{{< /highlight >}}

Nice? Nice!

Update: Vasco Nascimento noted that this code only works for flat structures and proposed an alternative which also works with deep structures:


{{< highlight ABAP >}}
TYPES:
  BEGIN OF ty_land1,
    land1 TYPE land1,
  END OF ty_land1.
TYPES ty_t_land1 TYPE STANDARD TABLE OF ty_land1.

SELECT * FROM kna1 INTO TABLE @data(t_kna1).

DATA(lt_land1) = VALUE ty_t_land1(
  FOR GROUPS land1 OF wa IN t_kna1
  GROUP BY wa-land1 ASCENDING
  WITHOUT MEMBERS
  ( land1 = land1 ) ).
{{< /highlight >}}

Thank you Vasco!

Greetings from Abapinho.
