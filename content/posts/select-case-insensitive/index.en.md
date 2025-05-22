---
slug: select-case-insensitive
title: Case insensitive SELECTs
description: Case insensitive SELECTs
date: 2025-05-26T09:00:00+01:00
tags: [segredo]
categories: [dicas]
keywords: [select case insensitive]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

In SAP it's normal to have tables in the database with a `NAME` field and another `NAME_SEARCH` which is filled in with exactly the same thing as `NAME` but in upper case.

Then, when you want to do case-insensitive searches you use `NAME_SEARCH`. You don't need to do this anymore.

<!--more-->

ABAP now lets you do this in SQL:

```abap
FINAL(search_pattern) = |%{ to_upper( search_string ) }%|.
SELECT full_name FROM zuser
 WHERE upper( full_name ) LIKE @search_pattern
 INTO TABLE @FINAL(full_names).
```

Crazy, right? ABAP SQL has come a long way!

Greetings from Abapinho
