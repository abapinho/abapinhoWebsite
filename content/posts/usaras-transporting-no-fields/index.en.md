---
title: 'Thou shalt use TRANSPORTING NO FIELDS'
slug: usaras-transporting-no-fields
date: 2015-03-09 09:00:02
tags: [estilo, performance]
categories: [boaspracticas]
wordpressId: 2735
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Many times we do READ TABLE itbl or LOOP AT itbl just to do a CHECK SY-SUBRC = 0. In these cases, the actual data read is not needed. For these cases always use TRANSPORTING NO FIELDS. This way is faster and avoids having to declare a target structure.
