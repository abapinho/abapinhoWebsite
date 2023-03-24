---
slug: exclamation-point
title: O ponto de exclamação!
description: Sabes para que serve o ponto de exclamação em ABAP?
date: 2023-03-27T09:00:00Z
tags: [segredo]
categories: [dicas]
keywords: [ponto de exclamação]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Quando se olha para o código fonte ABAP, a declaração dos métodos prefixa sempre os parâmetros de entrada com um ponto de exclamação. Isto sempre me intrigou. Finalmente sei o porquê.

<!--more-->

Esta é uma assinatura de um método gerada pela `SE24`:

```abap
METHODS get_amount_with_tax
  IMPORTING
    !price TYPE wrbtr
    !tax_code TYPE c003
  RETURNING
    VALUE(result) TYPE wrbtr .
```

Para quê os pontos de exclamação?

O ponto de exclamação é um caracter de _escape_ em ABAP. Pode ser usado em qualquer nome e avisa o compilador de que não se trata de uma palavra reservada mas sim de um nome. Normalmente não são necessários porque o compilador consegue concluir sozinho o que é que são nomes e o que é que são comandos e operadores. Mas haverá casos em que pode ser necessário torná-lo explícito.

Imagina por exemplo que alguém tinha a péssima ideia de começar a usar palavras reservadas de ABAP como variáveis. Nesse caso se calhar era melhor ter a cautela de usar pontos de exclamação para ajudar o compilador:

```abap
METHODS !methods
  IMPORTING
    !importing TYPE wrbtr
    !type TYPE c003
  CHANGING
    !changing TYPE wrbtr.
```

E é por isto que a `SE24` usa os pontos de exclamação: pelo sim, pelo não!

O Abapinho saúda-vos.
