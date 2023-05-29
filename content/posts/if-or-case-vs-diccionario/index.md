---
slug: diccionario-vs-if-ou-case
title: Usa um diccionário em vez de IF ou CASE
description: Um diccionário é uma boa técnica para evitar IFs e CASEs em determinados cenários
date: 2023-05-29T09:00:00+01:00
tags: []
categories: [dicas]
keywords: [if vs lookup]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Quanto menos IFs e CASEs melhor, certo? Cada ramo de um IF ou de um CASE é uma excepção. E nós gostamos mais de regras do que de excepções. Aqui está mais uma técnica para o conseguir.

<!--more-->

Atenta neste código:

```abap
METHOD get_tax_value_by_code.
IF tax_code = 'VAT23'.
  result = 23.
ELSEIF tax_code = 'VAT6'.
  result = 6.
ENDIF.
```

Assim como está é um IF bastante inócuo. Mas depois de amanhã aparece outro tipo de imposto, e depois outro, e depois outro. Claro que rapidamente um CASE seria preferível ao IF. Mas ainda assim há uma forma melhor.

```abap
TYPES:
  BEGIN OF ty_tax,
    tax_code TYPE mwskz,
    ratio TYPE f,
  END OF ty_tax,
  ty_taxes TYPE SORTED TABLE OF ty_tax with unique key tax_code.

METHOD get_taxes.
  result = VALUE ty_taxes(
   ( tax_code = 'VAT23' ratio = 23 )
   ( tax_code = 'VAT6' ratio = 6 ) ).
ENDMETHOD.

METHOD get_tax_value_by_code.
  DATA(taxes) = get_taxes( ).
  result = taxes[ tax_code = tax_code ].
ENDMETHOD.
```

Vantagens:

- Já não se subdivide em vários ramos (_branches_) como acontecia com o `IF` ou o `CASE` ficando assim muito mais fácil de testar;
- O que antes era completamente imperativo passou a ser quase tudo declarativo e por isso fica muito mais simples de se ler e compreender;
- Separas a definição dos dados do escolha de um deles e assim passas a ter muito mais liberdade para alterar a forma como defines essa relação. Podes, por exemplo, com muita facilidade optar por definir a relação numa tabela `ZTAX`:

```abap
METHOD get_taxes.
  SELECT * FROM ztax INTO TABLE result.
ENDMETHOD.
```

Topas?

O Abapinho saúda-vos.
