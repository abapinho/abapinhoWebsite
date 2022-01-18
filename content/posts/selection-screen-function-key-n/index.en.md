---
title: 'SELECTION-SCREEN FUNCTION KEY N'
slug: selection-screen-function-key-n
date: 2021-06-07 09:00:33
tags: [secret, ui]
categories: [dicas]
wordpressId: 4672
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
description: 'Aprende a usar 5 botões na barra de ferramentas dos ecrãs de selecção dos teus reports.'
---
There's so many things you can do on the selection screen. Here's another one: five buttons in the toolbar.

<!--more-->

In order to use them you need to:

  * declare a special structure called SSCRFIELDS;

  * fill in its fields FUNCTXT_01 to 05 with the button texts;

  * Declare which buttons you want to show using command SELECTION-SCREEN FUNCTION KEY N (N being a integer from 1 to 5);

  * Use SSCRFIELDS-UCOMM in AT SELECTION-SCREEN to know which button was clicked.

Here's an example:


{{< highlight ABAP >}}
REPORT zvirus.

TABLES sscrfields.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.
PARAMETERS: p_matnr TYPE matnr.
SELECTION-SCREEN: FUNCTION KEY 1,
                  FUNCTION KEY 2,
                  FUNCTION KEY 3.
SELECTION-SCREEN END OF BLOCK b1.

initialization.
    sscrfields-functxt_01 = 'COVID-19'.
    sscrfields-functxt_02 = 'Bird flu'.
    sscrfields-functxt_03 = 'Spanish flu'.

AT SELECTION-SCREEN.
  CASE sscrfields-ucomm.
    WHEN'FC01'.
      p_matnr = 'SARS-COV-2'.
    WHEN 'FC02'.
      p_matnr = 'H5N1'.
    WHEN 'FC03'.
      p_matnr = 'H1N1'.
  ENDCASE.
{{< /highlight >}}

And here's the result:
[![][1]][1]

Greetings from Abapinho.

   [1]: images/pandemic_se38.png
