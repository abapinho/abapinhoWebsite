---
title: 'Thou shalt use a constants table'
slug: usa-uma-tabela-de-constantes
date: 2014-08-28 09:00:45
tags: [ddic, estilo]
categories: [boaspracticas]
wordpressId: 2733
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Whenever you feel a constant value can change and you can’t add it as a user parameter, store it in ZCONSTS. This table should never be used directly. Instead, a class like ZCL_CONSTS should be created to properly access it, like shown in this article:
<{{< ref "constantes" >}}> (portuguese only)

Resist the temptation of using T900 or similar tables for this purpose. It's true that a lot of people do it. But it's ugly, durty and besides these tables don't even have an adequate key because they were not designed with this in mind.
