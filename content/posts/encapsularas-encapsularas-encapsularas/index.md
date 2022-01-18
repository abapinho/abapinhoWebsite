---
title: 'Encapsularás, encapsularás, encapsularás'
slug: encapsularas-encapsularas-encapsularas
date: 2015-05-11 11:40:10
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2715
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Historicamente os programas ABAP tendem a ser muito loooongos. Todas as boas prácticas de programação ensinam que não há uma única vantagem nisso.
Se uma rotina, seja ela um programa, um método, uma função ou outra coisa, tiver mais do que 200-300 linhas, desconfia e considera seriamente modularizá-la em várias sub-rotinas.
Esta abordagem tem a vantagem adicional de potenciar a reutilização de código. Mas a maior vantagem é o encapsulamento, isolando variáveis no seu contexto local, em vez de as ter todas juntas, tendo como resultado código mais seguro e mais claro.
O livro Official ABAP Programming Guidelines aconselha istos no capítulo 2.2 KISS (páginsa 32-34).
http://help.sap.com/abapdocu_731/en/abenencapsulation_guidl.htm
