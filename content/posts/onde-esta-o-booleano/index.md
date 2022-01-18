---
title: 'Onde está o booleano?'
slug: onde-esta-o-booleano
date: 2014-12-10 18:12:58
tags: [estilo]
categories: [dicas]
wordpressId: 2937
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Não está.

Mas eles - os senhores que fazem e refazem o ABAP propriamente dito - vão tentando remediar a situação.

Olha por exemplo esta nova funcionalidade.

<!--more-->

Antes tinhas de fazer isto:

{{< highlight ABAP >}}
IF valor = 3.
  flag = abap_true.
ELSE.
  flag = abap_false.
ENDIF.
{{< /highlight >}}

Agora sempre já podes fazer assim:

{{< highlight ABAP >}}
flag = BOOLC( valor = 3 ).
{{< /highlight >}}

;-)

O abapinho saúda-vos.
