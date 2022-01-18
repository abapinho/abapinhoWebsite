---
title: 'Call RFC functions AS SEPARATE UNIT'
slug: as-separate-unit
date: 2021-05-17 09:00:43
tags: []
categories: [dicas]
wordpressId: 4646
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['AS SEPARATE UNIT']
description: 'Chama um módulo de função por RFC garantindo que os dados globais não serão reutilizados dando cabo dos resultados.'
---
Imagine that you are calling an RFC function module several times in a row. Maybe you think that each call is completely independent from the others. It is not. The remote function group remains in memory and so does its global data. That global data will be reused on every call.

This is probably irrelevant in most cases. But there will be scenarios in which, for some reason, the function module being called is storing data in global variables which will negatively affect the outcome of the subsequent calls.

If you want to make sure you'll have a clear slate every time the remote function module is called, just add AS SEPARATE UNIT to its call. It's that simple.


{{< highlight ABAP >}}
CALL FUNCTION 'Z_DO_BUT_WITH_GLOBAL_VARIABLES'
DESTINATION rfcdest
AS SEPARATE UNIT.
{{< /highlight >}}

Greetings from Abapinho.
