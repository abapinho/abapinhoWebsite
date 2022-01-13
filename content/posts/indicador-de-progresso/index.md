---
title: 'Indicador de progresso'
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
Sabes aquelas barras de progresso que vão indicando quanto falta para terminar um processo? Aquelas que às vezes quando chegam ao fim voltam ao princípio e te deixam frustrado e baralhado sem entender para que servem afinal? Eis como as podes usar num programa ABAP.


{{< highlight ABAP >}}
DATA: lv_texto TYPE char40,
      lv_valor type i.

DO 10 TIMES.

  WAIT UP TO 1 SECONDS.

  CLEAR lv_texto.
  lv_valor = sy-index * 10.
  lv_texto(3) = lv_valor.
  CONCATENATE lv_texto '%!' INTO lv_texto.
  CONCATENATE 'Já só falta' lv_texto INTO lv_texto SEPARATED BY space.

  CALL FUNCTION 'SAPGUI_PROGRESS_INDICATOR'
    EXPORTING
      percentage = lv_valor
      text       = lv_texto.

ENDDO.
{{< /highlight >}}

Nota que o cronómetro vai ficando preenchido. Infelizmente o comando _WAIT UP TO N SECONDS_ está limitado a inteiros e por isso não sei como se pode fazer uma contagem mais rápida. Mas já é melhor que nada.

E atenção ao comando _WAIT_ porque faz um _COMMIT_ à base de dados.

O Abapinho saúda-vos.
