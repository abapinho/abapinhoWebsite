---
title: 'LOOP ASSIGNING instead of LOOP INTO'
slug: assigning-vs-into
date: 2011-07-02 12:25:03
tags: [estilo, performance]
categories: [artigos]
wordpressId: 865
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
In the beginning there was INTO.
Actually, in the beginning it was not even INTO.

<!--more-->

At the end of the 20th century, the most common thing to do was this:


{{< highlight ABAP >}}
DATA: BEGIN OF itbl OCCURS 0,
    kunnr LIKE kna1-kunnr,
    name1 LIKE kna1-name1,
  END OF itbl.

SELECT (...)

LOOP AT itbl.
  (...)
  itbl-name1 = itbl-kunnr.
  MODIFY itbl.
ENDLOOP.

{{< /highlight >}}

Which is very messy because tables with an implicit work area are confusing and ambiguous, to say the least.

Then, at the beginning of this century, a sense of shame began to be acquired and it was done like this:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_kna1,
    kunnr TYPE kunnr,
    name1 TYPE name1,
  END OF ty_kna1.

DATA: lt_kna1 TYPE STANDARD TABLE OF ty_kna1,
      ls_kna1 LIKE LINE OF lt_kna1.

SELECT (...)

LOOP AT lt_kna1 INTO ls_kna1.
  (...)
  ls_kna1-name1 = ls_kna1-kunnr.
  MODIFY lt_kna1 FROM ls_kna1.
ENDLOOP.
{{< /highlight >}}

This is a bit better because an explicit work area is now used. But even so the ABAP has to spend most of the time quite needlessly copying the data from _lt_kna1_ to _ls_kna1_ and vice versa, and it also requires the explicit invocation of _MODIFY_.

But now that the first decade of the new century is over, and even the parties of the 80s and the Bee Gees are beginning to die out and be replaced by the 90s parties with Pearl Jam, there’s no excuse for not doing this:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_kna1,
    kunnr TYPE kunnr,
    name1 TYPE name1,
  END OF ty_kna1.

DATA: lt_kna1 TYPE STANDARD TABLE OF ty_kna1.
FIELD-SYMBOLS: <lt_kna1> TYPE ty_kna1.

SELECT (...)

LOOP AT lt_kna1 ASSIGNING <lt_kna1>.
  <lt_kna1>-name1 = <lt_kna1>-kunnr.
ENDLOOP.

{{< /highlight >}}

This is the fastest solution of all ([pre-HANA][1], of course). There’s no more need to do MODIFY because any change made to <lt_kna1> is immediately reflected in lt_kna1, since the field-symbol is just a pointer.

Now that we’re well into the 21st century, avoid using work areas whenever possible. So, I’d say, off the cuff, that the only time they still make sense is when new entries need to be inserted in an internal table.

Greetings from Abapinho.

   [1]: http://www.sap.com/platform/in-memory-computing/index.epx
