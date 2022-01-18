---
title: 'How  to render CL_GUI_ALV_GRID in background'
slug: como-correr-uma-cl_gui_alv_grid-em-background
date: 2020-03-09 09:00:48
tags: [alv]
categories: [dicas]
wordpressId: 4414
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['alv grid background']
description: 'Quando se tenta correr uma ALV Grid editável em background dá dump. Encontrei uma solução que é muito simples mas pouco óbvia.'
---
Someone decided to run an editable ALV (based on CL_GUI_ALV_GRID) in background. It dumped. The solution is simple but not that obvious.
<!--more-->

You just don't provide a container to the ALV Grid when you are running it in background.

There is even a specific method for it:


{{< highlight ABAP >}}
    IF NOT cl_gui_alv_grid=>offline( ).
      DATA(o_container) = get_container( ).
    ENDIF.
    go_grid = NEW cl_gui_alv_grid( i_parent = o_container ).
{{< /highlight >}}

You can now run it both online and in background.

Greetings from Abapinho.
