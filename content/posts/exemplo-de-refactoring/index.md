---
slug: exemplo-de-refactoring
title: exemplo-de-refactoring
description: exemplo-de-refactoring
date: 2025-04-03T22:16:13+02:00
tags: []
categories: []
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

<!--more-->


Nota que uma possibilidade alternativa seria escolher a classe `ZCL_SD_CUSTOMER` e o método `GET_SALESORDERS`. O problema disto é que podes vir a associar imensas funcionalidades ao cliente. Se assim for, rapidamente a classe `ZCL_CUSTOMER` se tornará ingerível. E por isso a opção que escolhemos acima é preferível. Mas repara que,podes ter o melhor dos dois mundos. Crias o método `ZCL_SD_CUSTOMER->GET_SALESORDERS` que se limita a chamar o método `ZCL_SD_SALESORDERS->GET_LIST`. Topas? Assim a classe `ZCL_SD_CUSTOMER`, por ser de mais alto nível, serve apenas de fachada para as suas funcionalidades que estão implementadas em várias outras classes de mais baixo nível.
