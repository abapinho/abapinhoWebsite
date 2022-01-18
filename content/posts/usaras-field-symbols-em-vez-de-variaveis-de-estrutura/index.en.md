---
title: 'Thou shalt use FIELD-SYMBOLs instead of working areas'
slug: usaras-field-symbols-em-vez-de-variaveis-de-estrutura
date: 2014-07-24 09:00:50
tags: [estilo, performance]
categories: [boaspracticas]
wordpressId: 2725
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
READ TABLE itbl ASSIGNING  is always faster than READ TABLE itbl INTO wa.
Besides, when making changes to internal tables, not only it doesn’t require the explicit MODIFY but it also does away with the auxiliary TABIX variable.
The only situation in which a working area is better is when adding new lines to an internal table.
Some people contend that working areas should still be used when no changes are to be made to the data. This is still slower, but visually can be more intuitive.
