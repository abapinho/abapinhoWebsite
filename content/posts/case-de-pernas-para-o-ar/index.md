---
title: 'CASE de pernas para o ar'
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
Qual é a tua cor preferida?


{{< highlight ABAP >}}
SELECTION-SCREEN BEGIN OF BLOCK b1.
PARAMETERS: p_azul BUTTONGROUP GROUP COR DEFAULT 'X',
            p_verde BUTTONGROUP GROUP COR,
            p_roxo BUTTONGROUP GROUP COR.
SELECTION-SCREEN END OF BLOCK b1.
{{< /highlight >}}

Se respondeste azul [sobrevives e podes atravessar a ponte][1].

De qualquer das formas, em ABAP costuma fazer-se o seguinte para descobrir a cor que o utilizador escolheu:


{{< highlight ABAP >}}
IF p_azul = 'X'.
  lv_cor = 'AZUL'.
ELSE IF p_verde = 'X'.
  lv_cor = 'VERDE'.
ELSE IF p_roxo = 'X'.
  lv_cor = 'ROXO'.
ENDIF.
{{< /highlight >}}

Mas há uma forma curiosa e muito mais elegante de conseguir o mesmo. É aquilo a que se pode chamar de CASE de pernas para o ar:


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

E esta, heim?

Obrigado ao itspaulkelly pela foto.

O Abapinho saúda-vos.

   [1]: https://www.youtube.com/watch?v=wTuojHso3YA
