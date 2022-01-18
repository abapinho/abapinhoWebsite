---
title: 'Como correr uma CL_GUI_ALV_GRID em background'
slug: como-correr-uma-cl_gui_alv_grid-em-background
date: 2020-03-09 09:00:48
tags: [alv]
categories: [dicas]
wordpressId: 4414
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'alv grid background'
description: 'Quando se tenta correr uma ALV Grid editável em background dá dump. Encontrei uma solução que é muito simples mas pouco óbvia.'
---
Alguém decidiu correr em background uma ALV editável. Deu dump. A solução é simples mas pouco óbvia.
<!--more-->

Basta não atribuir um container à ALV Grid no caso de processamento em background.

Há até um método próprio:


{{< highlight ABAP >}}
    IF NOT cl_gui_alv_grid=>offline( ).
      DATA(o_container) = get_container( ).
    ENDIF.
    go_grid = NEW cl_gui_alv_grid( i_parent = o_container ).
{{< /highlight >}}

E assim já funciona tanto em background como online.

O Abapinho saúda-vos.
