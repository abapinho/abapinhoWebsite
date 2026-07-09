---
slug: substituir-campo-em-tabela
title: Replace value of an internal table field
description: Replaces the value of a field in a specific record of an internal table with a single command.
date: 2026-07-13T09:00:00Z
tags: [7.4]
categories: [dicas]
keywords: [campo em tabela interna]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Now that ABAP has _comprehensions_, there are a number of superpowers that aren’t always obvious. Here, I’ll show you how to change the value of a single field in all, several or just one record of an internal table.

<!--more-->

Imagine you have an internal table:
```abap
SELECT * FROM t001 INTO TABLE @DATA(companies).
```

Previously, you would have done this imperatively:
```abap
LOOP AT companies INTO FIELD-SYMBOL(<company>).
  <company>-butxt = 'Abapinho'.
ENDLOOP.
```

Now, using functional syntax, you do it like this:
```abap
FINAL(hacked_companies) = VALUE t_t001(
  FOR company IN companies
  ( VALUE #( BASE company
             butxt = 'Abapinho' ) ) ).
```

If you only want to change the field in some records, or even just one, add a `WHERE` clause:
```abap
FINAL(hacked_companies) = VALUE t_t001(
  FOR company IN companies
  WHERE ( bukrs = 'SAP' )
  ( VALUE #( BASE company
             butxt = 'Abapinho' ) ) ).
```

The trick is to use `BASE` together with `company` to define the starting point and then change only the fields you want. In this case, I’ve only changed the `BUTXT`.

Greetings from Abapinho.
