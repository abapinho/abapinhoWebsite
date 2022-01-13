---
title: 'NÃO'
slug: nao
date: 2020-04-28 12:08:03
tags: [7.4, estilo]
categories: [dicas]
wordpressId: 4456
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Não,
o ABAP
[nunca vai ter][1]
o operador NOT.

<!--more-->

Antes da 7.4 tínhamos, por exemplo, de fazer assim:

{{< highlight ABAP >}}
IF a = abap_false.
  b = abap_true.
ELSE.
  b = abap_false.
ENDIF.
{{< /highlight >}}

Apareceu a 7.4 e pudemos começar a inventar um bocado:

{{< highlight ABAP >}}
b = COND #( WHEN a = abap_false THEN abap_true ELSE abap_false ).
{{< /highlight >}}

Mas mesmo assim é uma montanha a parir um rato.

No entanto, a função booleana XSDBOOL pode deixar-nos mais perto do NOT ideal:

{{< highlight ABAP >}}
b = XSDBOOL( a = abap_false ).
{{< /highlight >}}

É o melhorzinho que encontrei até agora. Se conseguires melhor, avisa.

O Abapinho saúda-vos.

   [1]: https://blogs.sap.com/2014/09/29/abap-news-for-740-sp08-logical-expressions/#comment-82607
