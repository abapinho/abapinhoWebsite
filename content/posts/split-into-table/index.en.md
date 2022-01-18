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
  src: 'images/thumbnail.jpg'
---
I’m going to show you a creative way of filling out an internal table with constants that I learned in a standard program. Imagine you want to create an internal table with the following kinds of financial documents:

AB
AF
CH
DG
DZ
EX
F3
F4.

The more conventional way would be this:


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

But there is a much more concise and neat way:


{{< highlight ABAP >}}
DATA: lv_blart_list TYPE string,
      t_blart TYPE STANDARD TABLE OF blart,
      wa_blart LIKE LINE OF t_blart.

lv_blart_list = 'AB AF CH DG DZ EX F3 F4'.
SPLIT lv_blart_list AT space INTO TABLE t_blart.
{{< /highlight >}}

To fill in the table using SPLIT INTO TABLE, you just need 2 lines, plenty less than the 16 needed in the conventional way.

Here's an example copied from a standard program which is interesting because it creates a two-dimensional table using the same system:


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

Greetings from Abapinho.
