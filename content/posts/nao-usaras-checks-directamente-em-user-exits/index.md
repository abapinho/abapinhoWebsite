---
title: 'Não usarás CHECKs directamente em user-exits'
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
É comum encontrar o comando CHECK em user-exits. A trágica consequência disto é que, se o CHECK falha, nenhum do código que se segue a esse CHECK será alcançado. Como é comum (ainda que má prática) que num user-exit sejam tratados vários assuntos diferentes, um CHECK relacionado com um assunto pode inibir o acesso aos assuntos seguintes. Uma forma simples de evitar este risco é, como sempre aconselho, encapsular o código em rotinas.
