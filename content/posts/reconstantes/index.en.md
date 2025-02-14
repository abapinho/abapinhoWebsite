---
slug: reconstantes
title: Reconstants
description: Reconstants
date: 2025-02-17T09:00:00Z
tags: [estilo]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
In my current project constants are all over the place, with confusing or wrong names. It's a mess. I've found a way to reorganize and rearrange the constants so that the new code can use pretty constants without messing up the old code, which can continue to use the confusing ones.

<!--more-->
There are hundreds of constants in various includes, classes and interfaces. And all of them are used in dozens and even hundreds of places.

Several times, when writing new code, I've considered starting to tidy them up, but I've always abandoned the idea because it would require messing with old code that still uses them. I also considered creating copies of the old ones in the right place and with a decent name, but I abandoned that idea too because they would be duplicated, which would be dangerous and messy.

Today, out of the blue, I thought of a way to get the best of both worlds: have new ones tidied up without moving or duplicating the old ones. Imagine you have these old constants:

```abap
(class ZCL_OLD)

CONSTANTS c_status_001 TYPE i VALUE '001'. “ Start
CONSTANTS c_Status_002 TYPE i VALUE '002'. “ End
```

You can do this:

```abap
(class ZIF_NEW)

CONSTANTS:
  BEGIN OF c_status,
    start TYPE i VALUE zcl_old=>c_status_001,
    end TYPE i VALUE zcl_old=>c_status_002,
  END OF c_status.
```

Get it?

You create new constants, with the right name, in the right place, and in the `VALUE` you refer to the old one.

The day the old code stops using the old one, you can easily delete it and the update the new constant to define the value instead of pointing to the old one. Until then you live with both: the new code uses the new one, the old code continues to use the old one, but they are explicitly linked to each other.

Greetings from Abapinho.
