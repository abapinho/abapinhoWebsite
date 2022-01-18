---
title: 'Thou shalt use command TABLES only when unavoidable'
slug: usaras-o-comando-tables-so-quando-inevitavel
date: 2014-07-31 09:00:20
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2727
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Using SELECT-OPTIONS is one of the very few reasons for using TABLES. For all other cases, explicitly declare a local variable for the equivalent structure. TABLES basically creates obscure global variables which increase ambiguity in the code. And global variables should be avoided anyway.
