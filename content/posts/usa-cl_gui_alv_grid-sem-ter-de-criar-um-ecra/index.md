---
title: 'Usa CL_GUI_ALV_GRID sem ter de criar um ecrã'
slug: usa-cl_gui_alv_grid-sem-ter-de-criar-um-ecra
date: 2020-03-02 09:00:14
tags: [alv, segredo]
categories: [dicas]
wordpressId: 4410
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['alv grid']
description: 'Depois de tantos anos, quem diria que afinal não era necessário criar um ecrã e um container para poder usar a CL_GUI_ALV_GRID.'
---
Hoje em dia é raro usar o CL_GUI_ALV_GRID porque uso quase sempre a SALV. Mas quando é preciso fazer ALVs editáveis continuo a recorrer à CL_GUI_ALV_GRID. Durante muito tempo julguei que, para a usar, tinha de criar um ecrã com um container, o que é uma chatice. E como eu uso ABAP OO, precisava de criar um function group para alojar o ecrã e um function module para o chamar, o que era outra chatice.
<!--more-->

Mas não. Afinal é possível obter um container por defeito assim:


{{< highlight ABAP >}}
DATA(container) =
  NEW cl_gui_custom_container(
    parent =  cl_gui_container=>default_screen
    container_name = 'CONTAINER').
DATA(grid) = NEW cl_gui_alv_grid( i_parent = container ).
{{< /highlight >}}

Uau!

O meu obrigado ao Pedro que me ensinou isto num comentário [noutro artigo][1].

O Abapinho saúda-vos.

   [1]: {{< ref "usa-cl_gui_alv_grid-sem-ter-de-criar-um-ecra" >}}
