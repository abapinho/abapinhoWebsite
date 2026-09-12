---
slug: union-all
title: Use UNION ALL whenever possible
description: Use UNION ALL whenever possible. It's faster.
date: 2026-09-14T09:00:00+01:00
tags: [cds]
categories: [dicas]
keywords: [UNION ALL]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
In SQL, `UNION` is used to combine the results of two _queries_. But in many cases, `UNION ALL` should be used instead.
<!--more-->

Did you know that `UNION`, after combining the two results, performs a deduplication operation to ensure that the result does not contain duplicate records? And that takes quite a lot of work.

In most cases, we already know from the outset that the results are mutually exclusive. For example, when selecting distinct data:

```sql
SELECT id FROM ZDOC_HEADER
UNION
SELECT id FROM ZDOC_ITEM
```

In this case, it makes sense to prevent the system from wasting time (and it’s a lot of time!) deduplicating something we already know has no duplicates. And in such cases, you should `UNION ALL`:

```sql
SELECT id FROM ZDOC_HEADER
UNION ALL
SELECT id FROM ZDOC_ITEM
```

Depending on the number of records, the _query_ can easily become 20 per cent faster.

Greetings from Abapinho
