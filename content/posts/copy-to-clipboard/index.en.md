---
slug: copy-to-clipboard
title: Copy from SAPGui to the clipboard
description: Your program can use the clipboard
date: 2023-09-25T09:00:00+01:00
tags: [segredo]
categories: [dicas]
keywords: [ABAP clipboard]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Did you know that your ABAP programme can copy content to your operating system's clipboard?

<!--more-->

My friend Nuno Morais used this feature because he created a programme to generate GUIDs. Once generated, he had to select and manually copy them to the clipboard. Until he realised that the programme could do it for him. And then the world became slightly simpler. His world at least.

Like this:

```abap
DATA data_for_clipboard TYPE STANDARD TABLE OF char100.
DATA return_code TYPE sysubrc.

data_for_clipboard = VALUE #( ( generate_guid( ) ) ).

cl_gui_frontend_services=>clipboard_export(
  IMPORTING
    data = data_for_clipboard
  CHANGING
    rc = return_code
  EXCEPTIONS
    cntl_error = 1
    error_no_gui = 2
    not_supported_by_gui = 3
    no_authority = 4
    others = 5 ).
```

I've probably come across this `CL_GUI_FRONTEND_SERVICES` method before, but I only paid attention to it after Nuno showed me how to use it.

Thanks Nuno Morais for the tip.

Greetings from Abapinho.
