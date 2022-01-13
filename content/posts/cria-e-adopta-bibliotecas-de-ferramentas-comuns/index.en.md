---
title: 'Thou shalt build up and adopt toolkits with common tools'
slug: cria-e-adopta-bibliotecas-de-ferramentas-comuns
date: 2014-08-21 09:00:04
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2723
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Code which is used very often should be made available centrally, if possible under a single package (ex: ZTOOLS) so that it’s easily identified.

  * There is a lot of code already available on the Internet to accomplish several common functions (ex: ABAP2XLSX). Adopt it;

  * For your most common tasks, develop your own tools which you can reuse and add them to the central library;

  * Advertise the existence of that library among your colleagues to avoid that they waste time come up with duplicate code wasting;

  * Whenever you develop specific code which you think can one day be reused somewhere else consider making it more generic and add it to the central library.
