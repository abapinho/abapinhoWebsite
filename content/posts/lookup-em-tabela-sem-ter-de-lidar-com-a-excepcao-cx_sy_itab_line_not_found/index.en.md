---
title: 'Table lookup without having to deal with CX_SY_ITAB_LINE_NOT_FOUND'
slug: lookup-em-tabela-sem-ter-de-lidar-com-a-excepcao-cx_sy_itab_line_not_found
date: 2020-06-15 09:00:08
tags: [7.4, estilo]
categories: [dicas]
wordpressId: 4501
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['lookup sem excepção']
description: 'Como fazer lookup a uma tabela interna de forma elegante, numa única linha, e sem ter de tratar a excepção CX_SY_ITAB_LINE_NOT_FOUND.'
---
Before the modernization of ABAP in 7.40, a table lookup required an auxiliary variable and at least 4 lines of code.

<!--more-->

Take this pre-populated internal table:

{{< highlight ABAP >}}
DATA(itbl) = VALUE t_t001( ( bukrs = 'COCA' butxt = 'Coca-cola' )
                           ( bukrs = 'PEPS' butxt = 'Pepsi' ) ).
{{< /highlight >}}

This is what you had to do before 7.40:

{{< highlight ABAP >}}
DATA wa LIKE LINE OF itbl.
DATA butxt TYPE butxt.
READ TABLE itbl INTO wa WITH KEY bukrs = 'SPRI'.
IF SY-SUBRC = 0.
  butxt = wa-butxt.
ENDIF.
{{< /highlight >}}

7.40 made it more elegante. No more auxiliary variable and one line of code. Except that we have to deal with the CX_SY_ITAB_LINE_NOT_FOUND exception even in the cases (like this one) in which we don't care about it:

{{< highlight ABAP >}}
TRY.
    DATA(butxt) = itbl[ bukrs = 'SPRI' ]-butxt.
  CATCH CX_SY_ITAB_LINE_NOT_FOUND.
    CLEAR butxt.
ENDTRY.
{{< /highlight >}}

But now I found that we can use VALUE together with OPTIONAL to help us make it truly simple:

{{< highlight ABAP >}}
DATA(butxt) = VALUE #( itbl[ bukrs = 'SPRI' ]-butxt OPTIONAL ).
{{< /highlight >}}

It's easier to read and much easier to understand. This is beautiful code.

Greetings from Abapinho.
