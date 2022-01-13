---
title: 'MOVE-CORRESPONDING between two tables with automatic look up'
slug: move-corresponding-entre-duas-tabelas-respeitando-a-chave
date: 2020-03-23 09:00:04
tags: [7.4, estilo]
categories: [dicas]
wordpressId: 4427
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Abapinho hasn't been talking a lot about 7.40 because most of the new possibilities have already been widely discussed in other sites and we don't want to reinvent the wheel.

But, here and there, I find small useful jewels which seem to still be under the radar. This is one of them.

<!--more-->

I need to populate the internal table T_DATA with FI document items:


{{< highlight ABAP >}}
BSEG-BUKRS
BSEG-BELNR
BSEG-GJAHR
BSEG-BUZEI
BSEG-LIFNR
LFA1-NAME1
{{< /highlight >}}

Let's assume T_DATA is already filled with data from table BSEG except for column NAME1 which comes from table LFA1. And that we already have table T_LFA1 filled with the required data from table LFA1:


{{< highlight ABAP >}}
LFA1-LIFNR
LFA1-NAME1
{{< /highlight >}}

Before 7.40 I would need to do this in order to populate column NAME1 of T_DATA with the contents of table T_LFA1:


{{< highlight ABAP >}}
LOOP AT t_data ASSIGNING <s_data>.
  READ TABLE t_lfa1 ASSIGNING <s_lfa1> WITH KEY lifnr = <s_data>-lifnr.
  IF sy-subrc = 0.
    <s_data>-name1 = <s_lfa1>-name1.
  ENDIF.
ENDLOOP.
{{< /highlight >}}

Now take a look at how this can be done in 7.40:


{{< highlight ABAP >}}
t_data = CORRESPONDING #( t_data FROM t_lfa1 USING lifnr = lifnr ).
{{< /highlight >}}

How lovely! In a single command, column T_DATA-NAME1 is filled with data from T_LFA1 respecting its key LIFNR. And the command can be enhanced with MAPPING in case some of field names don't match.

What before required a LOOP, a READ TABLE, auxiliary variables and explicit attributions, is now reduced to a single one-line operation which, as a bonus, is also much simpler to read and understand.

And the new CORRESPONDING command has several extra options. You can define which fields should be copied and which should not. For example, here we just copy NAME1 without overwriting any other field:

{{< highlight ABAP >}}
t_data = CORRESPONDING #( t_data FROM t_lfa1 USING lifnr = lifnr
                          MAPPING name1 EXCEPT * ).
{{< /highlight >}}

Greetings from Abapinho.
