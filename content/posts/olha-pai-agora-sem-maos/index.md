---
title: 'Olha pai, agora sem mãos'
slug: olha-pai-agora-sem-maos
date: 2012-09-17 09:00:48
tags: [ui]
categories: [artigos]
wordpressId: 1948
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Neste artigo vou mostrar-te (e explicar-te!) como podes fazer com que um ecrã de selecção de um programa se refresque periodicamente sem intervenção do utilizador.

Estás preparado?

<!--more-->

O nosso exemplo mostra um parâmetro que se vai actualizando sozinho a cada segundo. Como o código é simples mostro-o todo de uma vez e explico-o a seguir:


{{< highlight ABAP >}}
PARAMETERS : p_conta TYPE t DEFAULT 300.

CLASS lcl_handler DEFINITION.
  PUBLIC SECTION.
    METHODS: corre_handler FOR EVENT finished OF cl_gui_timer.
ENDCLASS.

DATA o_temporizador TYPE REF TO cl_gui_timer .
DATA o_handler TYPE REF TO lcl_handler .

CLASS lcl_handler IMPLEMENTATION.
  METHOD corre_handler.
    CALL METHOD o_temporizador ->run.
    CALL METHOD cl_gui_cfw =>set_new_ok_code
      EXPORTING
        new_code = 'REFR'.
  ENDMETHOD.
ENDCLASS.

INITIALIZATION.
  CREATE OBJECT o_temporizador.
  CREATE OBJECT o_handler.
  o_temporizador-> interval = '1' .
  CALL METHOD o_temporizador-> run .
  SET HANDLER o_handler-> corre_handler FOR ALL INSTANCES.

AT SELECTION-SCREEN OUTPUT .
  p_conta = p_conta - 1 .
{{< /highlight >}}

O truque está em usar a classe CL_GUI_TIMER em interacção com o evento AT SELECTION-SCREEN OUTPUT.

  1. Primeiro declaramos o tal parâmetro que vai ser automaticamente actualizado.

  2. Depois declaramos uma pequena classe que há-de implementar o _handler_ do evento espoletado pelo final do temporizador do CL_GUI_TIMER.

  3. A seguir declaramos as duas instâncias, uma do temporizador (CL_GUI_TIMER) e a outra do nosso _handler_ LCL_HANDLER.

  4. O evento INITIALIZATION cria os objectos temporizador e _handler_ , configura o temporizador e associa o seu evento ao nosso _handler_.

  5. A implementação do método do _handler_ reinicia o temporizador e lança um _OK code_ que refresca o ecrã, correndo o evento AT SELECTION-SCREEN OUPUT.

  6. Finalmente o evento AT SELECTION-SCREEN OUTPUT limita-se a decrementar o nosso contador.

Simples, não? Dúvidas?

Obrigado a Evil Saltine pela foto.

O Abapinho saúda-vos.
