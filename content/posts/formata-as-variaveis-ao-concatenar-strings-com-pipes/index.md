---
title: 'Formata as variáveis ao concatenar strings com <i>pipes</i>'
slug: formata-as-variaveis-ao-concatenar-strings-com-pipes
date: 2015-11-16 09:00:22
tags: []
categories: [dicas]
wordpressId: 3272
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
A nova moda em _strings_ é usar _pipes_. Tipo:


{{< highlight ABAP >}}
str = |Olá { sy-uname }, | &
      |a data de hoje é { sy-datum }.|.
{{< /highlight >}}

Além de ter pinta é muito mais práctico do que usar o CONCATENATE que é horrível.

Mas o que eu só descobri recentemente é que é possível aplicar formatação às variáveis:

<!--more-->


{{< highlight ABAP >}}
str = |Olá { sy-uname CASE = LOWER }, | &
      |a data de hoje é { sy-datum DATE = USER }.|.
{{< /highlight >}}

Se fizeres F1 em cima do CASE ou do DATE podes ver todas as possibilidades:

[![embeded_expressions_format_options][1]][1]

Obrigado Sérgio Fraga pela dica.

Obrigado Pierre Andrews pela [foto][2].

O Abapinho saúda-vos.

   [1]: images/embeded_expressions_format_options.png
   [2]: https://www.flickr.com/photos/mortimer/299646160
