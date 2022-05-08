---
slug: modifica-tabela-interna
title: Easily modify internal table record
description: The easiest way to update a record of an internal table
date: 2022-05-09T09:00:00+01:00
tags: [7.4, itbl]
categories: [dicas]
keywords: [modifica tabela interna]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
The new way to get data from internal tables is also the new way to put data into internal tables.

<!--more-->

In the past, in order to modify data in an existing internal table record, you could either `LOOP` it into a structure, update the structure and then use `MODIFY`, or `READ TABLE` into a `FIELD-SYMBOL` which you could then modify. What were they thinking?

With 7.4, you can now get data from an internal table in this very simple way which I'm sure you're already using:

```abap
DATA(text) = itbl[ kunnr = customer ]-text.
```

But did you know that this also works for modifications?

```abap
itbl[ kunnr = customer ]-text = text.
```

Maybe this was already obvious to everyone but me. I just realised it some days ago. If you knew it already... well, sorry about it.

Photo credit: [mvongrue][1].

Greetings from Abapinho.

  [1]: <https://visualhunt.com/f7/photo/3222974360/3b9a746a54/>
