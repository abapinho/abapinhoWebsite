---
title: 'Debug de um job'
slug: debug-de-um-job
date: 2015-06-15 09:00:40
tags: [debug, segredo]
categories: [dicas]
wordpressId: 3129
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Para fazeres _debug_ a um programa que faça parte de um _job_ faz o seguinte:

<!--more-->

  1. Posiciona o cursor em cima do _job_ a que queres fazer _debug_ (não pode estar activo);

  2. Na linha de comando escreve "jdbg" (em vez do habitual "/h").

Saltará imediatamente um _debugger_. Infelizmente não começa posicionado no nosso programa. Mas é simples: fazendo F7 até aparecer o teu programa (eu tive de fazer 10 vezes). Também podes colocar antecipadamente um break-point no início do programa e fazer logo F8.

Isto permite recriar em _debug_ as condições exactas em que o programa correu, correrá ou correria.

Esta técnica só funciona com _jobs_ que ainda não esteja ou que já não estejam activos. Para fazer _debug_ a um job activo terás de usar outra técnica como fazer _debug_ directamente ao processo na SM50 ou usar a ST05 para fazer _trace_ ao SQL ou outra forma qualquer de que te lembres.

Obrigado Sérgio Fraga pela dica.

Obrigado Taran Rampersad pela [foto][1].

   [1]: https://www.flickr.com/photos/knowprose/101872870
