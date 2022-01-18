---
title: 'Thou shalt consider using SM34 clusters'
slug: consideraras-usar-clusters-sm34
date: 2014-09-11 09:00:14
tags: [ddic]
categories: [boaspracticas]
wordpressId: 2741
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
If a development requires more than one customising table consider grouping their maintenance views under a cluster. This way it will be more intuitive to maintain them. This makes even more sense if one depends on the other since in the cluster definition these relations can be explicitly defined.

Example: [Como encavalitar tabelas][1] (portuguese)

   [1]: {{< ref "encavalitartabelas" >}} (Como encavalitar tabelas)
