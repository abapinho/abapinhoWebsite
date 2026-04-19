---
slug: value-cardinal-mais-nada
title: "VALUE #( ) mais nada"
description: "Podes usar VALUE #( ) para passar uma ponteiro vazio para uma instância"
date: 2026-04-20T09:00:00
tags: [value]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Uma vez queria testar uma classe cujo construtor recebia vários parâmetros em que cada um pedia uma instância de um interface diferente. Essas instâncias não eram fáceis de criar e não eram relevantes para o teste. Depois de alguma experimentação descobri uma forma de contornar o problema.

<!--more-->

Idealmente a classe é instanciada com os seguintes parâmetros:

```abap
FINAL(cut) = NEW zcl_person(
  head = my_head
  arms = my_arms
  legs = my_legs ).
```

Eu tenho uma instância da `head` mas não tenho os `arms` nem as `legs` nem me apetece criá-las porque não preciso delas para o teste. Então posso fazer o seguinte:

Uma hipótese é fazer isto:

```abap
DATA my_arms TYPE REF TO zif_arms.
DATA my_legs TYPE REF TO ZIF_legs.
FINAL(cut) = NEW zcl_person(
  head = my_head
  arms = my_arms
  legs = my_legs ).
```

Mas há uma forma mais fixe:

```abap
FINAL(cut) = NEW zcl_person(
  head = my_head
  arms = VALUE #( )
  legs = VALUE #( ) ).
```

Assim consegues instanciar a classe mesmo sem teres os parâmetros todos. O resultado é que o `arms` e o `legs` vão estar `INITIAL` por isso, se forem acedidos lá dentro vai dar asneira, claro. Mas se não forem acedidos tens aqui uma forma facilitada para instanciar a classe.

O Abapinho saúda-vos.
