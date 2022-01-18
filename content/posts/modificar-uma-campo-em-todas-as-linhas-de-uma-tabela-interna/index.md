---
title: 'Modificar uma campo em todas as linhas de tabela interna'
slug: modificar-uma-campo-em-todas-as-linhas-de-uma-tabela-interna
date: 2015-08-31 09:00:25
tags: [estilo]
categories: [dicas]
wordpressId: 3209
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O que vos vou mostrar não é propriamente uma novidade. Até [já foi usado antes][1] no Abapinho. Mas como se continua a ver por aí muita gente a fazer LOOPs a tabelas internas para alterar um campo, achei que valia a pena recordar.

Tens uma tabela com um milhão e duzentas mil linhas e queres que o campo ICON tenha sempre o valor '@FM@'.

Em vez de fazeres isto:

{{< highlight ABAP >}}
LOOP AT lt_data ASSIGNING <data>.
  <data>-icon = '@FM@'.
ENDLOOP.
{{< /highlight >}}

Experimenta fazer antes isto:

{{< highlight ABAP >}}
ls_data-icon = '@FM@'.
MODIFY lt_data FROM ls_data TRANSPORTING icon WHERE icon <> 'PATO DONALD'.
{{< /highlight >}}

Como é óbvio, na condição podes escolher outra personagem qualquer dos Tio Patinhas.

Obrigado Sérgio Serra por sugerires que poderia ser interessante ensinar isto.
Obrigado Andrew Becraft pela [foto][2].

O Abapinho saúda-vos.

   [1]: {{< ref "range-instantaneo" >}}
   [2]: https://www.flickr.com/photos/dunechaser/2936382027
