---
title: 'SELECT from a set of known values'
slug: select-de-um-conjunto-de-valores-conhecidos
date: 2015-12-14 09:00:36
tags: [sql]
categories: [dicas]
wordpressId: 3343
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Someone asks you to select records based on a criteria for which you'll have a small set of known values which you're told will never change. Did you know you can do it directly in the SELECT?

<!--more-->

{{< highlight ABAP >}}
SELECT * INTO T_T005T
FROM T005T
WHERE LAND1 = I_LAND1 AND
           SPRAS IN ( 'PT', EN' ).
{{< /highlight >}}

I need to remind you that hard coding values in programs is not the best idea so make sure you know what you're doing when you choose to apply this approach.

Thank you Sérgio Fraga for the tip.

Greetings from Abapinho.
