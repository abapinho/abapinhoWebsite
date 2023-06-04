---
slug: funcoes-para-sm30
title: Call SM30 or SM34 from a function module
description: Use these functions to call SM30 in no time
date: 2023-06-05T09:00:00+01:00
tags: [sm30, sm34]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

If you want to call the SM30 from a program you can use `CALL TRANSACTION` but there is a simpler way.

<!--more-->

SAP provides some functions to make this easier:

- `VIEW_MAINTENANCE_CALL`
- `VIEW_MAINTENANCE_SINGLE_ENTRY`
- `VIEWCLUSTER_MAINTENANCE_CALL` (for SM34)

Here's an example:

```abap
DATA(v_t001w) = VALUE v_t001w(
  mandt = sy-mandt
  werks = '0001' ).

CALL FUNCTION 'VIEW_MAINTENANCE_SINGLE_ENTRY'.
  EXPORTING
    action = 'SHOW'.
    view_name = 'V_T001W'
  CHANGING
    entry = v_t001w.
```

Nice?

Thank you Luís Rocha for the tip.

Greetings from Abapinho.
