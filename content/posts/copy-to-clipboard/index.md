---
slug: copy-to-clipboard
title: Copia do SAPGUI para o clipboard
description: O teu programa pode usar o clipboard
date: 2023-09-25T09:00:00+01:00
tags: [segredo]
categories: [dicas]
keywords: [ABAP clipboard]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Sabias que o teu programa ABAP pode copiar conteúdo para o clipboard do teu sistema operativo?

<!--more-->

O meu amigo Nuno Morais lembrou-se de usar esta funcionalidade porque criou um programa para gerar GUIDs. Depois de gerados ele tinha de os seleccionar e depois copiar manualmente para o _clipboard_. Até que se lembrou que o programa poderia fazer isso por ele. E aí o mundo ficou ligeiramente mais simples. O mundo dele pelo menos.

Assim:

```abap
DATA data_for_clipboard TYPE STANDARD TABLE OF char100.
DATA return_code TYPE sysubrc.

data_for_clipboard = VALUE #( ( 'ABC' ) ).

cl_gui_frontend_services=>clipboard_export(
  IMPORTING
    data                 = data_for_clipboard
  CHANGING
    rc                   = return_code
  EXCEPTIONS
    cntl_error           = 1
    error_no_gui         = 2
    not_supported_by_gui = 3
    no_authority         = 4
    others               = 5 ).
```

Provavelmente já me tinha cruzado com este método do `CL_GUI_FRONTEND_SERVICES` mas só lhe prestei atenção depois do Nuno me mostrar como o usa.

Obrigado Nuno Morais pela dica.

O Abapinho saúda-vos.
