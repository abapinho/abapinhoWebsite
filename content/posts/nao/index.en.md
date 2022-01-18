---
title: 'NOT'
slug: nao
date: 2020-04-28 12:08:03
tags: [7.4, estilo]
categories: [dicas]
wordpressId: 4456
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['NOT ABAP']
description: 'Por razões históricas, a linguagem ABAP não tem nem nunca vai ter o operador NOT. Sugerimos aqui a melhor forma de o conseguir emular.'
---
No,
ABAP
[will never have][1]
the NOT operator.

<!--more-->

Before 7.4 we had to do this, for example:

{{< highlight ABAP >}}
IF a = abap_false.
  b = abap_true.
ELSE.
  b = abap_false.
ENDIF.
{{< /highlight >}}

Then came 7.4 and we were able to start improvising:

{{< highlight ABAP >}}
b = COND #( WHEN a = abap_false THEN abap_true ELSE abap_false ).
{{< /highlight >}}

But even this is too far fetched for such a simple need.

Nevertheless, the boolean function XSDBOOL can help us get a little closer to the ideal NOT:

{{< highlight ABAP >}}
b = XSDBOOL( a = abap_false ).
{{< /highlight >}}

This is the best I could find. If you know of a better way, please let me know.

Greetings from Abapinho.

   [1]: https://blogs.sap.com/2014/09/29/abap-news-for-740-sp08-logical-expressions/#comment-82607
