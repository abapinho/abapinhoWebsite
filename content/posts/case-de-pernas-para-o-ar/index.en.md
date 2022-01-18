---
title: 'Upside down CASE'
slug: case-de-pernas-para-o-ar
date: 2011-08-08 10:00:47
tags: [estilo]
categories: [dicas]
wordpressId: 938
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
What is your favourite colour?


{{< highlight ABAP >}}
SELECTION-SCREEN BEGIN OF BLOCK b1.
PARAMETERS: p_azul BUTTONGROUP GROUP COR DEFAULT 'X',
            p_verde BUTTONGROUP GROUP COR,
            p_roxo BUTTONGROUP GROUP COR.
SELECTION-SCREEN END OF BLOCK b1.
{{< /highlight >}}

If you said ‘blue’ [you live and can cross the bridge][1].

In any case, the following normally happens in ABAP to discover the colour the user chose:


{{< highlight ABAP >}}
IF p_azul = 'X'.
  lv_cor = 'AZUL'.
ELSE IF p_verde = 'X'.
  lv_cor = 'VERDE'.
ELSE IF p_roxo = 'X'.
  lv_cor = 'ROXO'.
ENDIF.
{{< /highlight >}}

But there is a curious and far more elegant way to do the same thing. This is what we call upside down CASE:


{{< highlight ABAP >}}
CASE 'X'.
  WHEN p_azul.
    lv_cor = 'AZUL'.
  WHEN p_verde.
    lv_cor = 'VERDE'.
  WHEN p_roxo.
    lv_cor = 'ROXO'.
ENDCASE.
{{< /highlight >}}

How about that?

(Thanks to [itspaulkelly][2] for the photo.)

Greetings from Abapinho.

   [1]: http://www.youtube.com/watch?v=wTuojHso3YA
   [2]: http://www.flickr.com/photos/itspaulkelly/3366424586/
