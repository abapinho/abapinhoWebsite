---
title: 'Controla mais o teu ecrã de selecção'
slug: controla-ecra-seleccao
date: 2018-03-12 09:00:08
tags: [segredo]
categories: [dicas]
wordpressId: 3957
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Os PARAMETERS e os SELECT-OPTIONS até têm algumas opções de configuração. Mas muitas vezes dava jeito conseguir configurá-los ainda mais. E curiosamente, ainda que não seja assim tão simples, é possível fazê-lo, através de uma função standard.

<!--more-->

A função SELECT_OPTIONS_RESTRICT.

Vejamos então como se pode usar.
Aqui está um ecrã de selecção:


{{< highlight ABAP >}}
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text- s01.
PARAMETERS: p_db AS CHECKBOX DEFAULT 'X' USER-COMMAND uc1.
PARAMETERS: p_bu AS CHECKBOX DEFAULT ' ' USER-COMMAND uc2.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text- s04.
SELECTION-SCREEN BEGIN OF LINE .
SELECTION-SCREEN COMMENT 1(22 ) text- c01 MODIF ID db1 .
SELECTION-SCREEN END OF LINE .
SELECT-OPTIONS: s_iwerko FOR mpos- iwerk NO INTERVALS MODIF ID db1. 
SELECTION-SCREEN SKIP.
SELECTION-SCREEN BEGIN OF LINE .
SELECTION-SCREEN COMMENT 1(22 ) text- c02 MODIF ID db1 .
SELECTION-SCREEN END OF LINE .
SELECT-OPTIONS: s_iwerkd FOR mpos- iwerk NO INTERVALS MODIF ID db1. 
SELECT-OPTIONS: s_gsber FOR mpos- gsber  MODIF ID db2 .
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE text- s05.
SELECT-OPTIONS: s_mptyp FOR mpla- mptyp MODIF ID db3 ,
                s_warpl FOR mpos -warpl MODIF ID db3,
                s_wapos FOR mpos -wapos MODIF ID db3,
                s_plnty FOR mpos -plnty MODIF ID db1.
SELECT-OPTIONS: s_iwerk FOR mpos- iwerk MODIF ID db2 .
SELECTION-SCREEN END OF BLOCK b3.

SELECTION-SCREEN BEGIN OF BLOCK b4 WITH FRAME TITLE text- s02.
PARAMETERS: p_empty AS CHECKBOX MODIF ID fcb USER-COMMAND uc2 .
PARAMETERS: p_file LIKE rlgrap- filename MODIF ID fil .
SELECTION-SCREEN END OF BLOCK b4.
{{< /highlight >}}

E aqui está o código que demonstra como usar a função SELECT_OPTIONS_RESTRICT:


{{< highlight ABAP >}}
FORM so_plant_restrictions. 
* Include type pool SSCR 
  TYPE-POOLS sscr. 

* Define the object to be passed to the RESTRICTION parameter 
  DATA restrict TYPE sscr_restrict.

* Auxiliary objects for filling RESTRICT 
  DATA opt_list TYPE sscr_opt_list.
  DATA ass      TYPE sscr_ass. 

* Define the option list 

* ONLY EQ Allowed 
  CLEAR opt_list. 
  MOVE 'JUST_EQ'  TO opt_list-name .
  MOVE 'X'        TO opt_list -options- eq.
  APPEND opt_list TO restrict-opt_list_tab .

* KIND = 'S': applies to SELECT-OPTION S_TIMEST 
  CLEAR ass. 
  MOVE: 'S'        TO ass- kind,
        'S_IWERKO' TO ass- name,
        'I'        TO ass- sg_main,
*        '*'        to ass-sg_addy, 
        'JUST_EQ'  TO ass- op_main,
        'JUST_EQ'  TO ass- op_addy.
  APPEND ass TO restrict-ass_tab .
  MOVE: 'S'        TO ass- kind,
        'S_IWERKD' TO ass- name,
        'I'        TO ass- sg_main,
*        '*'        to ass-sg_addy, 
        'JUST_EQ'  TO ass- op_main,
        'JUST_EQ'  TO ass- op_addy.
  APPEND ass TO restrict-ass_tab .

* Call function module 
  CALL FUNCTION 'SELECT_OPTIONS_RESTRICT'
    EXPORTING 
      restriction                = restrict
    EXCEPTIONS 
      too_late                   = 1
      repeated                   = 2
      not_during_submit          = 3 
      db_call_after_report_call  = 4
      selopt_without_options     = 5 
      selopt_without_signs       = 6 
      invalid_sign               = 7
      report_call_after_db_error = 8
      empty_option_list          = 9 
      invalid_kind               = 10
      repeated_kind_a            = 11 
      OTHERS                     = 12. 
ENDFORM.                    "so_plant_restrictions
{{< /highlight >}}

Como vês, com esta função consegues um grande controlo sobre o ecrã de selecção. Não vais usar isto todos os dias. Mas é daquelas coisas que vale a pena saberes para aquele dia eme que for necessário.

Obrigado Luís Rocha pela dica.

O Abapinho saúda-vos.
