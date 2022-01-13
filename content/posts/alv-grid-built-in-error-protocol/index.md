---
title: 'Protocolo de erros da ALV Grid'
slug: alv-grid-built-in-error-protocol
date: 2017-09-11 09:00:20
tags: [alv, estilo]
categories: [artigos]
wordpressId: 3856
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
A lei do menor esforço, esse grande axioma da Humanidade, tem, no mundo da programação, a particularidade de, em muitos casos, acabar por ser simplesmente a lei do esforço adiado. Porque é muito provável que algo que tenha sido desenvolvido de acordo com esta lei venha mais tarde a precisar de um grande esforço extra. Seja dos utilizadores que vão utilizar esse algo ou dos programadores que mais tarde terão de o manter.

Atire a primeira pedra aquele que não se deixou guiar por esta lei ao desenvolver este ou aquele programas.

Eu não atiro.

<!--more-->

Não atiro porque durante muito tempo, quando usava ALV Grids editáveis, quando queria dar um erro de validação dos dados, usava o MESSAGE ou uma popup.

Ao que parece, a lei do menor esforço impediu-me de explorar melhor as funcionalidade da ALV Grid e descobrir que ela tem já nela um protocolo de gestão de erros.

Funciona assim:

1\. Quando criares a ALV associa-lhe um método HANDLE_DATA_CHANGED registado como “handler” do evento DATA_CHANGED. Além disso tens de chamar o método REGISTER_EDIT_EVENT da ALV Grid para lhe pedir para lançar este evento sempre que se carrega em ENTER:

{{< highlight ABAP >}}
  SET HANDLER handle_data_changed FOR go_grid.
  go_grid->register_edit_event( cl_gui_alv_grid=>mc_evt_enter ).
{{< /highlight >}}

2\. É no método HANDLE_DATA_CHANGED que vais validar os dados e actualizar o protocolo de erros da ALV Grid:

{{< highlight ABAP >}}
METHOD handle_data_changed.

  DATA: amount TYPE wrbtr,
        dummy.

  FIELD-SYMBOLS: <s_mod_cell> LIKE LINE OF er_data_changed->mt_mod_cells.

  LOOP AT er_data_changed->mt_mod_cells 
    ASSIGNING <s_mod_cell> 
    WHERE fieldname = ‘WRBTR’.

    er_data_changed->get_cell_value(
      EXPORTING
        i_row_id    = <s_mod_cell>-row_id
        i_fieldname = ‘WRBTR'
      IMPORTING 
        e_value     = amount ).

    IF amount > 100.
      MESSAGE e003(ZMSG) INTO dummy.
      er_data_changed->add_protocol_entry(
        EXPORTING
          i_msgid     = SY-MSGID
          i_msgty     = SY-MSGTY
          i_msgno     = SY-MSGNO
          i_fieldname = ‘WRBTR'
          i_row_id    = <s_mod_cell>-row_id ).
    ENDIF.

  ENDLOOP.

ENDMETHOD.
{{< /highlight >}}

3\. Verifica se está tudo bem
Quando quiseres saber se há algum erro na ALV Grid (tipicamente farás isto algures dentro do método USER_COMMAND), basta chamares o seguinte método:


{{< highlight ABAP >}}
go_grid->check_changed_data( IMPORTING e_valid = valid ).
IF valid.
  SAVE() “ grava dados / save data  
ENDIF.
{{< /highlight >}}

Se alguma coisa estiver mal, a própria ALV Grid mostra uma janela modal com uma lista dos erros, tanto os internos (formatos de data inválidos, etc.) como os que foram adicionados por nós através do método ADD_PROTOCOL_ENTRY().

A partir de agora já vou passar a reportar de forma decente os erros de uma ALV Grid.

Aprendi nestas duas discussões nos fóruns da SAP:
<https://archive.sap.com/discussions/thread/1509379>
<https://archive.sap.com/discussions/thread/1629201>

A imagem do gajo que ilustra este artigo não tem nada a ver. Mas decidi escolhê-la para o Abapinho não ser o único site da Internet sem imagens de gatos. Talvez isto chame novos leitores.

O Abapinho saúda-vos.
