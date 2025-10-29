---
slug: filter
title: FILTER
description: Usa o FILTER em tabelas internas
date: 2025-11-03T09:00:00Z
tags: [filter]
categories: [dicas]
keywords: [ABAP filter]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

A função FILTER é nova e ainda pouco conhecida. Olhemos para dela.

<!--more-->

Imagina um cenário em que tens duas tabelas internas, uma com os cabeçalhos e outroa com os ítens de um documento:

```abap
SELECT * FROM vbak INTO TABLE headers.
SELECT * FROM vbap INTO TABLE items.
```

Tens de fazer LOOP aos cabeçalhos e depois processar os ítens. O normal é fazer algo assim:

```abap
LOOP AT headers INTO data(header).
  calculate_total_quantity(
    header = header
    items = items
  ).
ENDLOOP.

METHOD calculate_total_quantity.
  LOOP AT items INTO DATA(item) WHERE vbeln = header-vbeln.
    " etc
  ENDLOOP.
ENDMETHOD.
```

Repara que enviamos os itens todos para dentro do `process_header` e depois, lá dentro, temos de filtrar só pelos que realmente pertencem ao cabeçalho actual. É muito feio e não faz sentido. Só não estranhamos porque estamos treinados a achar esta aberração normal.

Agora imagina isto:

```abap
LOOP AT headers INTO data(header).
  DATA(header_items) = FILTER #( items WHERE vbeln = header-vbeln ).
  calculate_total_quantity( header_items ).
ENDLOOP.

METHOD calculate_total_quantity.
  LOOP AT items INTO DATA(item).
    " etc
  ENDLOOP.
ENDMETHOD.
```

Já viste? Não é melhor? Nota como lá dentro não é necessário filtrar os items porque já só tens os que tem interessam. E nota também como, por causa disso, já nem é preciso passar o cabeçalho. Do ponto de vista semântico esta abordagem é muito mais fácil de entender e manter.

O Abapinho saúda-vos.


```abap
FINAL(total_quantity) = COMPUTE #(
  INIT header_quantity TYPE meng13
  FOR header IN headers
  NEXT header_quantity = header_quantity + calculate_doc_quantity(
    header = header
    items = items
  ) ).

METHOD calculate_doc_quantity.
  RETURN COMPUTE #(
    INIT quantity TYPE meng13
    FOR item IN items
    WHERE ( vbeln = header-vbeln )
    NEXT quantity = quantity + item-lfmng ).
ENDMETHOD.


FINAL(total_quantity) = COMPUTE #(
  INIT header_quantity TYPE meng13
  FOR header IN headers
  LET header_items = FILTER #( items WHERE vbeln = header-vbeln )
  NEXT header_quantity = header_quantity + calculate_doc_quantity( header_items ) ) ).

METHOD calculate_doc_quantity.
  RETURN COMPUTE #(
    INIT quantity TYPE meng13
    FOR item IN items
    NEXT quantity = quantity + item-lfmng ).
ENDMETHOD.
```
