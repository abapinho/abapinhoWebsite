---
title: 'The simplest route to go from SELECT to RANGE'
slug: o-caminho-mais-curto-para-ir-de-select-a-range
date: 2019-11-13 10:21:31
tags: [7.4, estilo]
categories: [artigos]
wordpressId: 4314
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['SELECT to RANGE']
description: 'Várias formas diferentes de converter um SELECT num RANGE. Da pior com 15 linhas e 7 comandos à melhor com apenas 5 linhas e 1 comando.'
---
Today we'll try to optimize the code to convert a SELECT into a RANGE

<!--more-->

Let's start with the simplest code, without any optimization attempt:

{{< highlight ABAP >}}
DATA: lt_kunnr TYPE STANDARD TABLE OF kunnr,
        lr_kunnr TYPE RANGE OF kunnr,
        wa_kunnr LIKE LINE OF lr_kunnr.
FIELD-SYMBOLS: <kunnr> LIKE LINE OF lt_kunnr.

SELECT kunnr
  INTO CORRESPONDING FIELDS OF TABLE lt_kunnr
  FROM kna1.

wa_kunnr-sign = 'I'.
wa_kunnr-option = 'EQ'.
LOOP AT lt_kunnr ASSIGNING <kunnr>.
  wa_kunnr-low = <kunnr>.
  APPEND wa_kunnr TO lr_kunnr.
ENDLOOP.
{{< /highlight >}}

  * 7 commands

  * 4 variabls

  * 15 lines

Around 8 years ago I [suggested][1] that this could be improved:

{{< highlight ABAP >}}
DATA: r_kunnr TYPE RANGE OF kunnr,
      wa_kunnr LIKE LINE OF r_kunnr.

SELECT kunnr AS low
  INTO CORRESPONDING FIELDS OF TABLE r_kunnr
  FROM kna1.

wa_kunnr-sign = 'I'.
wa_kunnr-option = 'EQ'.
MODIFY r_kunnr FROM wa_kunnr TRANSPORTING sign option WHERE low <> ''.
{{< /highlight >}}

  * 4 commands

  * 2 variables

  * 10 lines

Meanwhile, with ABAP 7.40, manipulating internal tables became much simpler:

{{< highlight ABAP >}}
DATA r_kunnr TYPE RANGE OF kunnr.

SELECT kunnr AS low
INTO CORRESPONDING FIELDS OF TABLE r_kunnr
FROM lfa1.

r_kunnr = VALUE #( FOR wa IN r_kunnr
                   option = 'EQ' sign = 'I'
                   ( low = wa-low ) ).
{{< /highlight >}}

  * 2 commands

  * 1 variables!

  * 9 lines

But then Sérgio Fraga showed me that SQL also got better and now this can be done:

{{< highlight ABAP >}}
DATA r_kunnr TYPE RANGE OF kunnr.

SELECT 'EQ' AS option, 'I' AS sign, kunnr AS low
INTO CORRESPONDING FIELDS OF TABLE @r_kunnr
FROM lfa1.
{{< /highlight >}}

  * 1 command!

  * 1 variable!

  * 5 lines

Not bad! The only possible improvement would be declaring that variable inline. But I don't know how it could be done.

Update: Gabriel showed that it is indeed possible to declare the variable inline:

{{< highlight ABAP >}}
SELECT 'I' AS sign, 'EQ' AS option, kunnr AS low, kunnr AS high
INTO TABLE @DATA(r_kunnr)
FROM lfa1.
{{< /highlight >}}
It is crucial that all the 4 fields are explicitly listed (HIGH too) in this order for the inline internal table generated to be considered as a valid RANGE. Thank you Gabriel!

  * 1 command!

  * 0 variables!

  * 3 lines!

The 7 commands, 4 variables and 15 lines are now reduced down to 1 command and 3 lines. I dare say that now it is finally impossible to further simplify this.

Greetings from Abapinho.

   [1]:  {{< ref "range-instantaneo" >}}
