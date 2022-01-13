---
title: 'Abracadabra revela parâmetro secreto'
slug: parametro-secreto
date: 2017-10-23 09:00:29
tags: [sapgui]
categories: [dicas]
wordpressId: 3875
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Aqui está uma forma pouco ortodoxa de lidar com o ecrã de selecção de um programa.

Se tiveres um parâmetro que pretendes manter escondido dos olhos dos utilizadores e mesmo assim poder ter acesso a ele (ex.: um pisco para entrar em modo de debug) podes usar a palavra mágica ABRACADABRA para lhe aceder.

Funciona assim:


{{< highlight ABAP >}}
DATA: unhide_parameters TYPE flag.

PARAMETERS: p_debug AS CHECKBOX.

AT SELECTION-SCREEN.
  CASE sy-ucomm.
    WHEN 'ABRACADABRA'.
      unhide_parameters = abap_true.
    WHEN 'NORMAL'.
      CLEAR unhide_parameters.
  ENDCASE.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-name = 'P_DEBUG' AND unhide_parameters IS INITIAL.
      screen-active = 0.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
{{< /highlight >}}

Quando estiveres no ecrã de selecção basta escreveres ABRACADABRA no campo de comandos e o teu parâmetro secreto aparece magicamente. Se for preciso depois podes escrever NORMAL e ele torna a desaparecer.

O Abapinho saúda-vos.
