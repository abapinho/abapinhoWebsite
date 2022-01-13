---
title: 'SPLIT INTO TABLE'
slug: split-into-table
date: 2011-10-03 10:00:13
tags: [estilo]
categories: [dicas]
wordpressId: 1014
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Aqui vos mostro uma forma criativa de preencher uma tabela interna com constantes que aprendi num programa standard. Imagina que querias criar uma tabela interna com os seguintes tipos de documento financeiro:

AB
AF
CH
DG
DZ
EX
F3
F4.

A forma mais convencional seria assim:


{{< highlight ABAP >}}
DATA: t_blart TYPE STANDARD TABLE OF blart,
      wa_blart LIKE LINE OF t_blart.

wa_blart = 'AB'.
APPEND wa_blart TO t_blart.
wa_blart = 'AF'.
APPEND wa_blart TO t_blart.
wa_blart = 'CH'.
APPEND wa_blart TO t_blart.
wa_blart = 'DG'.
APPEND wa_blart TO t_blart.
wa_blart = 'DZ'.
APPEND wa_blart TO t_blart.
wa_blart = 'EX'.
APPEND wa_blart TO t_blart.
wa_blart = 'F3'.
APPEND wa_blart TO t_blart.
wa_blart = 'F4'.
APPEND wa_blart TO t_blart.
{{< /highlight >}}

Mas há uma forma muito mais sintética e curiosa:


{{< highlight ABAP >}}
DATA: lv_blart_list TYPE string,
      t_blart TYPE STANDARD TABLE OF blart,
      wa_blart LIKE LINE OF t_blart.

lv_blart_list = 'AB AF CH DG DZ EX F3 F4'.
SPLIT lv_blart_list AT space INTO TABLE t_blart.
{{< /highlight >}}

O preenchimento da tabela é feito em apenas 2 linhas, bem menos que as 16 da forma convencional.

Fica aqui mais um exemplo copiado do standard que é interessante por ter dois níveis:


{{< highlight ABAP >}}
l_action_list = 'A01 A02 A03 A04'.
SPLIT l_action_list AT ' ' INTO TABLE lt_action.
LOOP AT lt_action INTO l_action.
  CASE l_action.
    WHEN 'A01'. l_refdoc_list = 'R01 R02 R03 R04 R05 R06 R14'.
    WHEN 'A02'. l_refdoc_list = 'R07 R08 R10 R12'.
    WHEN 'A03'. l_refdoc_list = 'R07 R08 R10 R11 R12 R13'.
    WHEN 'A04'. l_refdoc_list = 'R09'.
  ENDCASE.
  SPLIT l_refdoc_list AT ' ' INTO TABLE lt_refdoc.
  LOOP AT lt_refdoc INTO l_refdoc.
    ls_cust-action = l_action.
    ls_cust-refdoc = l_refdoc.
    APPEND ls_cust TO t_cust.
  ENDLOOP.
ENDLOOP.
{{< /highlight >}}

O Abapinho saúda-vos.
