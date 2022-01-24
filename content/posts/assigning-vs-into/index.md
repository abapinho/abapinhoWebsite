---
title: 'LOOP ASSIGNING em vez de LOOP INTO'
slug: assigning-vs-into
date: 2011-07-02 12:25:03
tags: [estilo, performance]
categories: [artigos]
wordpressId: 865
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
No princípio era o INTO.
Aliás, no princípio nem sequer era o INTO.

<!--more-->

No final do século XX o mais comum era fazer-se isto:


{{< highlight ABAP >}}
DATA: BEGIN OF itbl OCCURS 0,
    kunnr LIKE kna1-kunnr,
    name1 LIKE kna1-name1,
  END OF itbl.

SELECT (...)

LOOP AT itbl.
  (...)
  itbl-name1 = itbl-kunnr.
  MODIFY itbl.
ENDLOOP.

{{< /highlight >}}

O que é uma grande javardice porque tabelas com área de trabalho implícita são no mínimo confusas e ambíguas.

Depois, no início do século contemporâneo, começou a ganhar-se algum pudor e passou a fazer-se isto:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_kna1,
    kunnr TYPE kunnr,
    name1 TYPE name1,
  END OF ty_kna1.

DATA: lt_kna1 TYPE STANDARD TABLE OF ty_kna1,
      ls_kna1 LIKE LINE OF lt_kna1.

SELECT (...)

LOOP AT lt_kna1 INTO ls_kna1.
  (...)
  ls_kna1-name1 = ls_kna1-kunnr.
  MODIFY lt_kna1 FROM ls_kna1.
ENDLOOP.
{{< /highlight >}}

É melhorzinho porque já usa uma área de trabalho explícita. Mas mesmo assim obriga a que o ABAP passe boa parte do tempo a copiar os dados da _lt_kna1_ para a _ls_kna1_ e vice-versa sem necessidade nenhuma e ainda requer a invocação explícita do _MODIFY_.

Mas agora que a primeira década do novo século findou e que até as festas dos anos 80 e dos Bee Gees já começam a caducar e a dar lugar a festas dos anos 90 com Pearl Jam, já não há desculpa para não fazerem assim:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_kna1,
    kunnr TYPE kunnr,
    name1 TYPE name1,
  END OF ty_kna1.

DATA: lt_kna1 TYPE STANDARD TABLE OF ty_kna1.
FIELD-SYMBOLS: <lt_kna1> TYPE ty_kna1.

SELECT (...)

LOOP AT lt_kna1 ASSIGNING <lt_kna1>.
  <lt_kna1>-name1 = <lt_kna1>-kunnr.
ENDLOOP.

{{< /highlight >}}

E é esta a solução mais rápida de todas (pré-HANA, claro). Já não é preciso fazer MODIFY porque qualquer alteração feita a <lt_kna1> é imediatamente reflectida na lt_kna1 visto que o field-symbol não é mais do que um ponteiro.

Em pleno século XXI, evite-se usar áreas de trabalho sempre que possível. Assim de repente diria que a única circunstância em que ainda fazem sentido é quando se pretende inserir novos registos numa tabela interna.

O Abapinho saúda-vos.
