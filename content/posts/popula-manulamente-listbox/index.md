---
title: 'Popula manulamente uma LISTBOX'
slug: popula-manulamente-listbox
date: 2021-06-14 12:47:10
tags: [segredo, ui]
categories: [dicas]
wordpressId: 4682
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Em 2012 [lamentei que a LISTBOX fosse tão pouco usada][1]. Ensinei a usá-la com elementos de dado standard, que a populam automaticamente. Hoje vou-te ensinar como a podes popular tu próprio se quiseres listar opções que não venham de um elemento de dados.

<!--more-->

É fácil. Mas pouco óbvio. Há uma FM standard que a popula a partir de uma tabela interna:


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

É isto.

[![][2]][2]

Foto: [MarianaLeme][3].

O Abapinho saúda-vos.

   [1]: https://abapinho.com/en/2012/10/ninguemligaaolistbox/
   [2]: images/listbox.png
   [3]: https://visualhunt.co/a6/66ca720f
