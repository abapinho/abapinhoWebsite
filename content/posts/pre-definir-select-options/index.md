---
title: 'Pré-definir SELECT-OPTIONs'
slug: pre-definir-select-options
date: 2015-02-09 09:00:23
tags: [estilo]
categories: [dicas]
wordpressId: 2993
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
O Abapinho recebeu uma carta.

Sr Abapinho,

Todos sabemos como colocar valores por defeito em select options usando o comando DEFAULT. O que nem toda a gente sabe é que podemos também definir por defeito a opção e o sinal e mesmo o botão para restingir o select options.

<!--more-->

Assim:


{{< highlight ABAP >}}
DATA: s_registo TYPE ZDATA.

SELECT-OPTIONS so_cod1 FOR s_registo-codigo
                       DEFAULT '20140805'
                       OPTION GE SIGN I.

SELECT-OPTIONS so_cod2 FOR s_registo-codigo
                       NO INTERVALS.
{{< /highlight >}}

Um forte Abraço Sr. Abapinho

Obrigado Sr. Sérgio Fraga.

Obrigado David Sjunnesson pela [foto][1].

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/sjunnesson/4968803264
