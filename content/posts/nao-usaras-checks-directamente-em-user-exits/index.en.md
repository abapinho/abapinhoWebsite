---
title: 'Thou shalt not use CHECKs directly in user-exits'
slug: nao-usaras-checks-directamente-em-user-exits
date: 2014-11-10 09:00:51
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2745
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
User-exits (and enhancements) are usually crowded with CHECKs. The tragic consequence is that, if the check fails, nothing else after it will run. Not even the standard code. Always try to correct these. Encapsulating the code inside a routine (ideally a method) is enough to render it harmless.
