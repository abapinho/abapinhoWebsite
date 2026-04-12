---
slug: if-metodo-booleano-implicito
title: Test boolean methods implicitly
description: No need to compare it with ABAP_TRUE
date: 2026-04-13T09:00:00+01:00
tags: []
categories: [dicas]
keywords: [IF sem IS INITIAL]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
A quick reminder. I thought this was obvious but I keep seeing IF statements that explicitly test the result of a boolean method against ABAP_TRUE or using INITIAL. There's no need! ABAP is clever in this regard.

<!--more-->
Instead of this:

```abap
IF dog->is_happy( ) = abap_false.
  dog->feed( treat ).
ENDIF.
```

Just do this:

```abap
IF dog->is_happy( ).
  dot->feed( treat ).
ENDIF.
```

Simpler, cleaner, more readable.

Abapinho sends his regards.
