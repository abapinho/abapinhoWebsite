---
slug: blocos-curtos
title: Os blocos de código devem ser curtos
description: Todos os blocos de código em ABAP deviam ser curtos. Muito muito curtos.
date: 2022-02-07T09:00:00Z
tags: [estilo]
categories: [artigo]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Infelizmente isto não acontece no código Z dos clientes onde tenho trabalhado. Tanto os IFs como os LOOPs tendem a ser tão grandes que ninguém percebe nada do que lá está. Ainda no outro dia vi um `LOOP` com mais de 1500 linhas.

<!--more-->

A única vantagem que há em ter blocos de código gigantes é magoar o próximo. E isso só é uma vantagem quando o próximo merece ser magoado.

Porquê que os programadores ABAP se andam todos a magoar uns aos outros?

## Falha rápido

Muitas vezes, a forma mais simples de evitar ter blocos grandes é _falhar rápido_ ou, como se diz em inglês, [_fail fast_](1).

Em vez de fazer isto:

```ABAP
IF c1.
  " 5000
  " linhas
  " de
  " código
ENDIF.
```

é preferível fazer isto:

```ABAP
IF NOT c1.
  RETURN.
ENDIF.

" 5000
" linhas
" de
" código
```

Magoa menos.

## Código pouco profundo

Outra vantagem de falhar rápido é, como o Clean ABAP aconselha, [manter o código pouco profundo](2).

Em vez de fazer isto:

```ABAP
IF c1.
  IF c2.
    IF c3.
      " Mais
      " montes
      " de
      " linhas
      " de
      " código
    ENDIF.
  ENDIF.
ENDIF.
```

é melhor fazer isto:

```ABAP
IF NOT c1.
  RETURN.
ENDIF.

IF NOT c2.
   RETURN.
ENDIF.

IF NOT c3.
    RETURN.
ENDIF.

" Mais
" montes
" de
" linhas
" de
" código
```

Tão mais simples de entender, não é?

E no entanto vejo tanta vez código com mais de 10 níveis de profundidade. Para quê magoar os outros?

## Modulariza

Mas a melhor estratégia de todas para manter os blocos de código curtos é modularizar.

Em vez de fazer isto:

```ABAP
IF c1.
  " 5000
  " linhas
  " de
  " código
ELSE.
  " mais
  " 5000
  " linhas
  " de
  " código
  " às
  " vezes
  " até
  " muito
  " parecidas
  " com
  " as
  " outras
  " 5000
ENDIF.
```

é preferível fazer isto:

```ABAP
IF c1.
  faz_isto( ).
ELSE.
  faz_aquilo( ).
ENDIF.
```

Ou, se os métodos forem funções que retornam um valor:

```ABAP
DATA(result) = COND #( WHEN c1 THEN da_isto( ) ELSE da_aquilo( ) ).
```

E mandas os milhares de linhas para dentro das rotinas. Se nessas rotinas fizeres a mesma coisa acabas com muitas rotinas pequenas que vão magoar muito menos que poucas rotinas grandes.

Vamos lá parar de nos magoar uns aos outros.

O Abapinho saúda-vos.

[1]: https://en.wikipedia.org/wiki/Fail-fast
[2]: https://github.com/SAP/styleguides/blob/main/clean-abap/CleanABAP.md#keep-the-nesting-depth-low
