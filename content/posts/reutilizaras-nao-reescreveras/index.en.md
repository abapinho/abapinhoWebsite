---
title: 'Thou shalt reuse, thou shalt not rewrite'
slug: reutilizaras-nao-reescreveras
date: 2015-05-04 09:00:28
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2717
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
If the same piece of code is repeated at least once, question yourself why and try to avoid it by creating a reusable routine.
If there is more than one SELECT for the same table in a program, make sure you can’t merge them into a single one. Sometimes a smart use of RANGEs to unify parameters can avoid the need for multiple SELECTs.
If the same code is used in 2 different programs, don’t repeat the code. Instead, create a class for it which can be shared by both and move the reused code to the common class.
https://abapinho.com/en/2012/06/mais-ranges-menos-selects/
