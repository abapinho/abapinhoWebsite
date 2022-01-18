---
title: 'Thou shalt always use a predefined structure with ALV'
slug: usaras-sempre-uma-estrutura-pre-definida-nas-alvs
date: 2015-03-16 09:00:30
tags: [alv, ddic, salv]
categories: [boaspracticas]
wordpressId: 2751
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
It is common to find an ALV data structure explicitly defined in the code. If this is done, the field catalog has to be manually constructed. If a predefined structure (from DDIC or declared as a TYPE) is used instead, the field catalog can be automatically built. This approach is always better and results in less code, even if the field catalog needs to be adjusted here and there.
https://abapinho.com/en/2011/12/automatizar-catalogo-alv/
