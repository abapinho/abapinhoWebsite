---
slug: substituir-campo-em-tabela
title: Substitui valor de campo numa tabela interna
description: Substitui o valor de um campo de um determinado registo de uma tabela interna com um único comando.
date: 2026-07-13T09:00:00Z
tags: [7.4]
categories: [dicas]
keywords: [campo em tabela interna]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Agora que o ABAP tem _compreensions_ há uma série de super poderes que nem sempre são evidentes. Aqui vou ensinar-te a mudar o valor de um único campo em todos, vários ou um registos de uma tabela interna.

<!--more-->

Imagina que tens uma tabela interna:
```abap
SELECT * FROM t001 INTO TABLE @DATA(companies).
```

Antes, fazias assim de forma imperativa:

```abap
LOOP AT companies INTO FIELD-SYMBOL(<company>).
  <company>-butxt = 'Abapinho'.
ENDLOOP.
```

Agora, usando a sintaxe funcional fazes assim:
```abap
FINAL(hacked_companies) = VALUE t_t001(
  FOR company IN companies
  ( VALUE #( BASE company
             butxt = 'Abapinho' ) ) ).
```

Se só quiseres alterar o campo em alguns ou mesmo apenas um registo adicionas um `WHERE`:
```abap
FINAL(hacked_companies) = VALUE t_t001(
  FOR company IN companies
  WHERE ( bukrs = 'SAP' )
  ( VALUE #( BASE company
             butxt = 'Abapinho' ) ) ).
```

O truque é usar o `BASE` com o `company` para definir o ponto de partida e depois alterar só os campos que quiseres. Neste caso alterei só o `BUTXT`.

O Abapinho saúda-vos.
