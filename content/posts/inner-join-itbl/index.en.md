---
slug: inner-join-itbl
title: INNER JOIN instead of FOR ALL ENTRIES
description: If SELECT is possible, what about INNER JOIN?
date: 2023-10-30T09:00:00+01:00
tags: []
categories: [dicas]
keywords: [INNER JOIN itbl]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

A while ago [I showed you][1] that you could SELECT from an internal table. And then I asked myself: if that is possible, shouldn't INNER JOIN be possible too?

<!--more-->

And yes, it is possible.

```abap
SELECT kunnr, name1
FROM kna1
INNER JOIN @itbl AS customers ON customers~kunnr = kna1~kunnr
INTO TABLE @DATA(output).
```

And there you have it. The only thing that needs to be done is name the table using `@itbl AS customers`.

Unless I'm missing something, this seems to be a better alternative to `SELECT FOR ALL ENTRIES`.

Why does it seem better to me? Because, [according to SAP][2], `FOR ALL ENTRIES` executes `SELECT` for each row in the internal table, running it as many times as there are rows in the internal table. In the case of `INNER JOIN`, the internal table is sent to the database all at once and then used as if it were a database table.

And you no longer have to stress about having to check if the internal table is not empty before performing the `SELECT`.

Also, `FOR ALL ENTIES` has the annoying limitation that, in the `WHERE` clause, the data type of the variable must be of the same type of the field. For some reason in `INNER JOIN` this is no longer necessary.

Are these really just advantages or am I missing something and there are drawbacks?

Thank you Silk Road Collection for the [photo][3].

Greetings from Abapinho.

[1]: {{< ref "select-itbl" >}}
[2]: <https://help.sap.com/doc/abapdocu_752_index_htm/7.52/en-US/abenwhere_logexp_itab.htm>
[3]: <https://visualhunt.com/f7/photo/4886903818/dfe17b5198/>
