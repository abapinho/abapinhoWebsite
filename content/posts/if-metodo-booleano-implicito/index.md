---
slug: if-metodo-booleano-implicito
title: Testa implicitamente os métodos booleanos
description: Não é preciso comparar com ABAP_TRUE
date: 2026-04-13T09:00:00+01:00
tags: []
categories: [dicas]
keywords: [IF sem IS INITIAL]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Lembrete singelo. Pensei que já fosse óbvio mas continuo a ver muitos IFs que testam explicitamente o resultado de um método booleano contra ABAP_TRUE ou INITIAL. Não é preciso! O ABAP neste caso é esperto.

<!--more-->
Em vez disto:

```abap
IF dog->is_happy( ) = abap_false.
  dog->feed( treat ).
ENDIF.
```

Basta fazeres isto:

```abap
IF dog->is_happy( ).
  dot->feed( treat ).
ENDIF.

Mais simples, mais bonito, mais legível.

O Abapinho saúda-vos.
