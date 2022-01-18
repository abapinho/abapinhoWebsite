---
title: 'Usarás o comando TABLES só quando inevitável'
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
Uma das únicas situações onde é inevitável é com SELECT-OPTIONS. Em todos os outros casos, declara explicitamente uma variável local com uma estrutura equivalente. Basicamente o comando TABLES cria variáveis globais obscuras que aumentam a ambiguidade do código. E variáveis globais devem ser evitadas na maior parte dos casos.
