---
title: 'Manually populate a LISTBOX'
slug: popula-manulamente-listbox
date: 2021-06-14 12:47:10
tags: [segredo, ui]
categories: [dicas]
wordpressId: 4682
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'listbox'
description: 'O LISTBOX é raramente usado em ecrãs de selecção. Este artigo ensina como populá-lo manualmente com os nossos próprios valores.'
---
In 2012 I [wondered why LISTBOX is so rarely used][1]. I taught how to use it with standard data elements, which automatically populate it. Today I'll teach you how you can populate it yourself.

<!--more-->

It's easy. But not obvious at all. You need to use a standard FM which populates it from an internal table:


{{< highlight ABAP >}}
PARAMETERS: p_virus TYPE C AS LISTBOX VISIBLE LENGTH 25.

INITIALIZATION.
  DATA(values) =
    VALUE vrm_values(
      ( key = '1' text = 'COVID-19' )
      ( key = '2' text = 'Bird flu' )
      ( key = '3' text = 'Spanish flu' )
    ).

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = 'P_VIRUS'
      values          = values
    EXCEPTIONS
      id_illegal_name = 1
      OTHERS          = 2.
{{< /highlight >}}

Done.

[![][2]][2]

Photo credit: [MarianaLeme][3].

Greetings from Abapinho.

   [1]: https://abapinho.com/en/2012/10/ninguemligaaolistbox/
   [2]: images/listbox.png
   [3]: https://visualhunt.co/a6/66ca720f
