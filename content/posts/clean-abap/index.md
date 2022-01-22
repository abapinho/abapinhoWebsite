---
title: 'Clean ABAP'
slug: clean-abap
date: 2020-05-13 12:54:21
tags: [estilo, oo]
categories: [dicas]
wordpressId: 4473
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['Clean ABAP']
description: 'A SAP criou um guia de boas prácticas inspirado no Clean Code do Robert Martin onde explica exaustivamente qual a melhor forma de programar em ABAP OO. '
---
Durante muitos anos, quando entrava em discussões sobre ABAP OO ser melhor do que FORMs, INCLUDEs e CALL FUNCTIONs, o mais comum é a pessoa do lado de lá continuar convencida de que OO é bom nas outras linguagens mas não traz vantagens para o ABAP. Logo a começar pelo atroz código standard SAP que parece ter sido escrito para provar que é possível fazer algo que viola todas as boas prácticas de programação e mesmo assim funciona.

<!--more-->

ABAP OO traz muitas vantagens. Mas, contra todas as evidências, o mais comum continua a ser ABAP clássico ou fazer uma classe com 200 métodos estáticos, o que, sendo um pouco melhor do que ABAP clássico (sempre permite encapsular um pouco melhor e usar excepções), continua a não ser OO.

No entanto, é muito fácil fazer asneira com OO. Não só porque passar de ABAP clássico para ABAP OO requer uma completa mudança de paradigma como porque as prácticas de programação OO que aprendi na universidade estão, em boa parte, caducas (ex.: composição é preferível a herança). As coisas evoluiram muito. A minha referência preferida é o [Clean Code do Robert Martin][1].

Mas de repente a SAP faz isto: <https://github.com/SAP/styleguides>.

A SAP já não é o que era. Criou um repositório com um guia de estilo muito completo, baseado no _Clean Code_ , a que chamaram Clean ABAP. É um manual de referência exemplar, que está em constante evolução e para o qual qualquer um pode contribuir. Dá gosto ler e cada vez que lá vou aprendo qualquer coisa.

E se tu ainda não usas ABAP OO, penso que depois de leres este guia vais ficar convencido de que o devias adoptar.

O Abapinho saúda-vos.

   [1]: https://cleancoder.com/products
