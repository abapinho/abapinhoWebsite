---
title: 'Thou shalt use LIKE LINE OF itbl'
slug: usaras-like-line-of-itbl
date: 2014-10-20 10:25:10
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2747
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When declaring structures which will receive data from an internal table, instead of declaring its type directly, use LIKE LINE OF. This way not only it becomes clear that they are related but also, if you happen to change the type of the internal table, you won’t have to worry about updating the structure’s type.
