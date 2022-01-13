---
title: 'Progress indicator'
slug: indicador-de-progresso
date: 2011-03-07 12:04:18
tags: [ui]
categories: [dicas]
wordpressId: 648
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
You know those progress bars that show how long it will take for a process to end? The ones that sometimes go back to the beginning when they reach the end and leave you frustrated and confused and wondering what use they are anyway? Here’s how you can use them in an ABAP program.


{{< highlight ABAP >}}
DATA: lv_texto TYPE char40,
      lv_valor type i.

DO 10 TIMES.

  WAIT UP TO 1 SECONDS.

  CLEAR lv_texto.
  lv_valor = sy-index * 10.
  lv_texto(3) = lv_valor.
  CONCATENATE lv_texto '%!' INTO lv_texto.
  CONCATENATE 'Time remaining' lv_texto INTO lv_texto SEPARATED BY space.

  CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
    EXPORTING
      percentage = lv_valor
      text       = lv_texto.

ENDDO.
{{< /highlight >}}

You see that the timer bar is filling up. Unfortunately the _WAIT UP TO N SECONDS_ command is limited to whole numbers, so I don’t know how you can do a faster count. But it’s better than nothing.

And watch out for the _WAIT_ command, because it does a _COMMIT_ to the database.

Greetings from Abapinho.
