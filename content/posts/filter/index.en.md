---
slug: filter
title: FILTER
description: Use FILTER on internal tables
date: 2025-11-03T09:00:00Z
tags: [filter]
categories: [dicas]
keywords: [ABAP filter]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

The FILTER function is new and still relatively unknown. I will give you an example of how it can be used.

<!--more-->

Imagine a scenario where you have two internal tables, one with the headers and the other with the items of a document:

```abap
SELECT * FROM vbak INTO TABLE headers.
SELECT * FROM vbap INTO TABLE items.
```

You need to LOOP through the headers and then process the items. The normal thing to do is something like this:

```abap
LOOP AT headers INTO FINAL(header).
  calculate_doc_quantity(
  header = header
  items = items ).
ENDLOOP.

METHOD calculate_doc_quantity.
  RETURN REDUCE #(
    INIT quantity TYPE mng13
    FOR item IN items
    WHERE ( vbeln = header-vbeln )
    NEXT quantity = quantity + item-lfmng ).
ENDMETHOD.
```

Note that we send all items to `process_header` and then, inside, we have to filter only those that actually belong to the current header. It's very ugly and doesn't make sense. We only don't find it strange because we are trained to think this aberration is normal.

Now look at this alternative way of doing it using `FILTER`:

```abap
LOOP AT headers INTO FINAL(header).
  FINAL(header_items) = FILTER #( items WHERE vbeln = header-vbeln ).
  calculate_doc_quantity( header_items ).
ENDLOOP.

METHOD calculate_doc_quantity.
  RETURN REDUCE #(
    INIT quantity TYPE mng13
    FOR item IN items
    NEXT quantity = quantity + item-lfmng ).
ENDMETHOD.
```

See? Isn't it better? Notice how you don't need to filter the items inside because you only have the ones that interest you. And notice also how, because of this, you don't even need to pass the header. From a semantic point of view, this approach is much healthier, easier to understand and maintain.

Greetings from Abapinho.
