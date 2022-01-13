---
title: 'Use CL_GUI_ALV_GRID without having to create a screen'
slug: usa-cl_gui_alv_grid-sem-ter-de-criar-um-ecra
date: 2020-03-02 09:00:14
tags: [alv, segredo]
categories: [dicas]
wordpressId: 4410
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Nowadays I rarely use CL_GUI_ALV_GRID because SALV is so much better. But when I am asked to make an editable ALV I still use it. Until very recently, I thought that, in order to use it, I needed a screen with a container. And because I'm using ABAP OO, I'd need a function group to host it and a function module to call it. Painful.
<!--more-->

But no. It is possible to get a default container like this:


{{< highlight ABAP >}}
DATA(container) =
  NEW cl_gui_custom_container(
    parent =  cl_gui_container=>default_screen
    container_name = 'CONTAINER').
DATA(grid) = NEW cl_gui_alv_grid( i_parent = container ).
{{< /highlight >}}

Wow!

I would like to thank Pedro, who taught me this in a comment on [another post][1].

Greetings from Abapinho

   [1]: https://abapinho.com/en/2020/03/usa-cl_gui_alv_grid-sem-ter-de-criar-um-ecra/
