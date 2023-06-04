---
slug: funcoes-para-sm30
title: Chama a SM30 ou a SM34 a partir de uma função
description: Com estas funções chamas a SM30 num instante
date: 2023-06-05T09:00:00+01:00
tags: [sm30, sm34]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Se quiseres chamar a SM30 a partir de um programa podes fazer um `CALL TRANSACTION` mas há uma forma mais simples.

<!--more-->

O SAP disponibiliza algumas funções que facilitam o processo:

- `VIEW_MAINTENANCE_CALL`
- `VIEW_MAINTENANCE_SINGLE_ENTRY`
- `VIEWCLUSTER_MAINTENANCE_CALL` (para a SM34)

Aqui vai um exemplo:

```abap
DATA(v_t001w) = VALUE v_t001w(
  mandt = sy-mandt
  werks = '0001' ).

CALL FUNCTION 'VIEW_MAINTENANCE_SINGLE_ENTRY'
  EXPORTING
    action    = 'SHOW'
    view_name = 'V_T001W'
  CHANGING
    entry     = v_t001w.
```

Boa?

O Abapinho saúda-vos.
