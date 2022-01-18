---
title: 'Não substituirás simplesmente ‘.’ por ‘,’'
slug: nao-substituiras-simplesmente-por
date: 2014-08-08 09:00:08
tags: [i18n]
categories: [boaspracticas]
wordpressId: 2729
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Se precisas de adaptar o conteúdo de um ficheiro com valores (CURR) tem sempre em consideração a parametrização do utilizador (USR01-DSCFM).
Se precisares de converter um alfa-numérico num número, usa o FM MOVE_CHAR_TO_NUM.
Se precisares de converter um número num alfa-numérico, usa WRITE curr TO str [CURRENCY waers].
