---
slug: prefixos-fixos
title: Fix prefixes
description: SAP lets you create rules for your object prefixes
date: 2023-05-01T09:00:00+01:00
tags: [segredo]
categories: [artigos]
keywords: [packages]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

It's very easy to mess up with object names in SAP. I recently found a way to minimize that problem: set rules to fix per-package prefixes for certain object types.

<!--more-->

You're working on a development called `DEV1`. The first thing you do (because you're a [neat][1] [person][2]) is to create a package dedicated to that development. You call it, for example, `ZDEV1`. From here on (and because, unfortunately, SAP still doesn't have decent _namespaces_) every object name should include a prefix that associates it with `DEV1`:

- Classes: `ZCL_DEV1_*`
- Tables: `ZDEV1_*`
- Functions: `Z_DEV1_*`
- Programs: `ZDEV1*`
- etc: `ZDEV1*`.

This is usually left implicit and up to the goodwill of whoever comes next.

But there is a way to fix these rules for the future: `SM30 V_TRESN`. Isn't it great? You can set prefixes by package and object type.

An example for our case would be:

- Program ID: `R3TR`
- Object type: `CLAS`
- Name range: `ZCL_DEV1_`
- Package: `ZDEV1`
- Reservation type: `H`

The _reservation type_ has three options, but only two are useful to us: _Package (D)_ and _Package hierarchy (H)_. The difference is that the _package hierarchy_ is also valid for sub-packages and, as such, it seems to me the most appropriate for most cases.

Once this prefix is set, `SE24` will fail if you try to create a class under the `ZDEV1` package that does not start with `ZCL_DEV1_`. This ensures that the names of the objects in `DEV1` will remain decent.

Greetings from Abapinho.

[1]: {{< ref "pacotes-2-0" >}}
[2]: {{< ref "empacota-tudo" >}}
