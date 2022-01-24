---
title: 'ALV com múltipla escolha num ecrã de diálogo modal'
slug: alv-popup
date: 2011-12-19 10:00:31
tags: [alv, ui]
categories: [dicas]
wordpressId: 1249
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Sabes apresentar, numa janela de diálogo, uma ALV com uma lista de registos permitindo escolha múltipla? Eu não sabia e agora já sei. Vou explicar como é.

<!--more-->

Faz de conta que queres escolher uns clientes:


{{< highlight ABAP >}}
DATA: t_kna1 TYPE STANDARD TABLE OF kna1.

SELECT * FROM kna1 INTO TABLE t_kna1.
{{< /highlight >}}

Pronto, agora já enchemos à bruta uma tabela interna com os clientes todos. O próximo passo é criar o catálogo de campos:


{{< highlight ABAP >}}
  DATA: ls_fieldcat TYPE slis_fieldcat_alv,
        lt_fieldcat TYPE slis_t_fieldcat_alv.

  CLEAR ls_fieldcat.
  ls_fieldcat-row_pos   = '1'.
  ls_fieldcat-tabname   = 'T_KNA1'.

  ls_fieldcat-col_pos   = '1'.
  ls_fieldcat-fieldname = 'CHECKBOX'.
  ls_fieldcat-seltext_m = 'SELECT'.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-col_pos   = '2'.
  ls_fieldcat-fieldname = 'KUNNR'.
  ls_fieldcat-seltext_m = 'Nº cliente'.
  ls_fieldcat-outputlen = 10.
  APPEND ls_fieldcat TO lt_fieldcat.

  ls_fieldcat-col_pos   = '3'.
  ls_fieldcat-fieldname = 'NAME1'.
  ls_fieldcat-seltext_m = 'Nome'.
  ls_fieldcat-outputlen = 35.
  APPEND ls_fieldcat TO lt_fieldcat.

{{< /highlight >}}

Claro que o catálogo pode ser criado automaticamente recorrendo à FM REUSE_ALV_FIELDCATALOG_MERGE se for caso disso. Mas nota que, para poder fazer a selecção múltipla, terás de adicionar uma coluna chamada CHECKBOX (ou com o nome que bem entenderes).

A seguir vamos criar uma tabela com as funções a excluir da ALV (para que em vez de aparecerem todos os comandos apareçam apenas o OK e o CANCEL:


{{< highlight ABAP >}}
  DATA: lt_excl     TYPE slis_t_extab,
        ls_excl     TYPE slis_extab.

  ls_excl-fcode = '&ETA'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '%SC'.  APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '%SC+'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&OUP'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&ODN'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&ILT'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&OL0'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&CRB'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&CRL'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&CRR'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&CRE'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&ALL'. APPEND ls_excl TO lt_excl.
  ls_excl-fcode = '&SAL'. APPEND ls_excl TO lt_excl.
{{< /highlight >}}

Depois chamamos a função mágica que faz aparecer o popup com a ALV:


{{< highlight ABAP >}}
  CALL FUNCTION 'REUSE_ALV_POPUP_TO_SELECT'
    EXPORTING
      i_zebra              = 'X'
      it_fieldcat          = lt_fiedcat
      i_tabname            = 'T_KNA1'
      i_screen_start_column = 1
      i_screen_start_line   = 1
      i_screen_end_column   = 100
      i_screen_end_line     = 25
      i_checkbox_fieldname = 'CHECKBOX'
    TABLES
      t_outtab             = t_kna1.
{{< /highlight >}}

Esta função mostra o popup que permite ao utilizador seleccionar um ou mais registos. Quando o utilizador carrega em OK ou CANCEL, o programa continua e podemos utilizar o campo CHECKBOX para determinar quais as linhas por ele seleccionadas:


{{< highlight ABAP >}}
  LOOP AT it_output INTO wa_output WHERE checkbox = 'X'.
"  Faz aqui o que te apeteceer
  ENDLOOP.
{{< /highlight >}}

E já está.

Obrigado a Ayelie pela foto.

O Abapinho saúda-vos.
