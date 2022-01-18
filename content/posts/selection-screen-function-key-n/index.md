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
Há tantas coisas que se podem fazer nos ecrãs de selecção. Aqui está mais uma: cinco botões na barra de ferramentas.

<!--more-->

Para usar estes botões é preciso:

  * declarar uma estrutura especial chamada SSCRFIELDS;

  * preencher os seus campos FUNCTXT_01 até 05 com os textos dos botões;

  * declarar os botões que queremos usar com o comando SELECTION-SCREEN FUNCTION KEY N (em que N é um número de 1 a 5);

  * Usar o SSCRFIELDS-UCOMM no AT SELECTION-SCREEN para saber que botão foi empurrado.

Aqui está um programa exemplo:


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

E aqui está o resultado:
[![][1]][1]

O Abapinho saúda-vos.

   [1]: images/pandemic_se38.png
