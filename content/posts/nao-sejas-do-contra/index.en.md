---
title: "Don't be so negative"
slug: nao-sejas-do-contra
date: 2021-11-30 09:00:14
tags: []
categories: [dicas]
wordpressId: 4764
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['evita negativas']
description: 'Aqui fica um par de dicas para ajudar a tornar expressões booleanas mais legíveis.'
---
Legibility is very important in all written text. Except, maybe, in [concrete poetry][1].

As a follow up to the [previous post][2], here are a couple of rules to help you deal with the negative in boolean expressions.

<!--more-->

1\. [Try to make conditions positive][3]. "I want to go" is easier to understand" than "I do not want to stay".

2\. If you really must use the negative, [prefer IS NOT to NOT IS][4]. While in English you would say "I do not want to stay", in programming languages it's better to say "I want to not stay".

Greetings from Abapinho.

   [1]: https://cdn.culturagenial.com/imagens/aranha.jpg
   [2]: {{< ref "as-condicoes-if-devem-ser-simples-de-entender" >}}
   [3]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#try-to-make-conditions-positive
   [4]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#prefer-is-not-to-not-is
