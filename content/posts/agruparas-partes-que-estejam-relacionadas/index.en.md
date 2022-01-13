---
title: 'Thou shalt group related parts together'
slug: agruparas-partes-que-estejam-relacionadas
date: 2014-07-17 09:00:16
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2721
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Sometimes you find an IMPORT in the code but you have no idea where the corresponding EXPORT is. When communication is needed between programs, it should be done using a pair of methods belonging to the same class. This way, when we run into one, we’ll always know where the other one is.
Anyway, try to use EXPORT/IMPORT only when unavoidable. If possible, use static class variables instead.
