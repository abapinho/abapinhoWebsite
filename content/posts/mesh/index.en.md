---
slug: mesh
title: Don't MESH with ABAP
description: The new MESH command
date: 2022-08-29T09:00:00+01:00
tags: [7.4]
categories: [article]
keywords: [mesh]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
draft: true
---

ABAP 7.4 brought a lot of lauded novelties. Of all of them, the one less talked about is `MESH`. Let's analyse it and see how unfair that has been.

<!--more-->

## What

`MESH` allows you to create relationships between several internal tables the same way external keys do for tables in a relational database.

## How

You first define the `MESH` data type, then create and populate the actual `MESH` and finally use it to access data in the internal tables.

### Define it

The `MESH` data type declaration references internal table types.

```abap
TYPES ty_t_bkpf TYPE SORTED TABLE OF bkpf
  WITH UNIQUE KEY bukrs gjahr belnr.
TYPES ty_t_bseg TYPE SORTED TABLE OF bseg
  WITH UNIQUE KEY bukrs gjahr belnr buzei.

DATA t_bkpf TYPE ty_t_bkpf.
DATA t_bseg TYPE ty_t_bseg.

TYPES:
* Option 1: reference the data types
  BEGIN OF MESH ty_mesh,
    bkpf TYPE ty_t_bkpf ASSOCIATION my_bseg TO bseg
      ON bukrs = bukrs AND gjahr = gjahr AND belnr = belnr,
    bseg TYPE ty_t_bseg ASSOCIATION my_bkpf TO bkpf
      ON bukrs = bukrs AND gjahr = gjahr AND belnr = belnr,
  END OF MESH ty_mesh,
```

As you can see, `MESH` is just one more data type. You can also use `LIKE` instead of `TYPE` if you want to
reference the actual internal tables instead of their data types.

### Instantiate it

Let's now declare the `MESH` variable and then populate it.

```abap
DATA m TYPE ty_mesh.
m-bkpf = t_bkpf.
m-bseg = t_bseg.
```

### Use it

Instead of using the key fields of internal tabela A to access internal table B, you kind of use `MESH` to navigate between them,
without the need to explicitly compare the key fields since they were already predefined in the `MESH` data type declaration.

```abap
LOOP AT t_bkpf ASSIGNING FIELD-SYMBOL(<bkpf>).
  LOOP AT m-bkpf\my_bseg[ <bkpf> ] ASSIGNING FIELD-SYMBOL(<bseg>).
    count = count + 1.
    " If we didn't have it we could fetch the BKPF record like this:
    DATA(bkpf2) =  m-bseg\my_bkpf[ <bseg> ].
  ENDLOOP.
ENDLOOP.
```

## When

But what is the advantage of this new `MESH`, you ask?

Well, it makes your code somewhat simpler and easier to understand, since the relationship between tables is done only once during the
data types declaration, instead of having to explicitly establish it every time you need to access the data.

But the big plus is speed. I made some tests (soon to be shared) and, unless I made a mistake, `MESH` is around 27% faster than the
classic `LOOP AT itbl WHERE`. Unbelievable, right?

So, what are you waiting for? Go use it!

Thank you [Craiyon][1] for imagining this picture.

Greetings from Abapinho

   [1]: https://www.craiyon.com/
