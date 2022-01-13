---
title: 'Narcisismo digital'
slug: narcisismo-digital
date: 2012-08-27 09:00:38
tags: [dinamico]
categories: [dicas]
wordpressId: 1904
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---

Chama-se _reflexão_ à capacidade de um programa se ver a si próprio. O ABAP tem uma série de capacidades reflexivas como o RTTS ou a capacidade de gerar código dinamicamente. Além disso há mais umas funções assim e assado que fazem isto e aquilo. Hoje apresento-vos uma delas:

GET_GLOBAL_SYMBOLS

<!--more-->

Esta função devolve uma tabela interna com a lista de todas as variáveis utilizadas num determinado programa. Não podia ser mais simples de usar:


{{< highlight ABAP >}}
DATA: t_fieldlist TYPE STANDARD TABLE OF rfieldlist.

CALL FUNCTION 'GET_GLOBAL_SYMBOLS'
  EXPORTING
    program      = sy-repid
*   NAME_PATTERN = '*'
  TABLES
    fieldlist    = t_fieldlist.
{{< /highlight >}}

Ao correr, a função popula a tabela interna T_FIELDLIST com 16 registos: 15 variáveis de sistema e a própria T_FIELDLIST. Houvessem mais variáveis declaradas no programa e mais registos lá apareceriam.

Obrigado Nuno Morais por me mostrares esta função.

E um obrigado muito especial ao Caravaggio por ter pintado o quadro que ilustra este texto (ao qual, ignomínia!, recortei um bocado em cima e em baixo para caber. Mas também... subtrair-lhe bocados não é maior crime do que reduzi-lo a 150x150 pixels. Enfim, aguente-se).

O Abapinho saúda-vos.
