---
title: 'Create templates in SE80 by dragging stuff into the code'
slug: modelos-na-se80-arrastando-para-o-codigo
date: 2016-11-14 09:00:26
tags: [sapgui]
categories: [dicas]
wordpressId: 3659
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['Modelo por arrasto']
description: 'Aprende como criar modelos de código arrastando métodos (e outros) com o rato directamente para o código na transacção SE80.'
---
While coding, it's always good to have ways to speed up what we're doing. A good one is automatic generation of templates for function and method calls.

I know 3 ways to achieve this.

<!--more-->

The more classic one is to use the "Pattern" button in the toolbar. It lets you choose a function/method/etc, and SAP will inject in your code the template of the desired call. Then you just need to complete it with your variables and that's it.

Another, more sophisticated way, is by using the keyboard shortcut CTRL-SPACE, and this was already explained [here][1].

The third one only works in SE80. When you have the desired method (or whatever) on the left pane tree, just drag it into the desired point in your code and the ABAP Workbench will automatically generate a template for it.

In this screen capture you can see an example where I first dragged and dropped method CONSTRUCTOR and then method GET_COLUMN, both from class CL_SALV_COLUMNS:

[![se80_drag_n_drop][2]][2]

Greetings from Abapinho.

   [1]: https://abapinho.com/en/2014/09/modelo-automatico-so-com-ctrl-space/
   [2]: images/se80_drag_n_drop.jpg
