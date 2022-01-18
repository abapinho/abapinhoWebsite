---
title: 'Convert amount to numeric external format'
slug: converter-montante-para-formato-externo-numerico
date: 2020-06-02 09:09:10
tags: []
categories: [dicas]
wordpressId: 4489
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'montantes formato externo'
description: 'Como converter um montante do formato interno para o formato interno atribuindo o resultado a uma variável de tipo numérico.'
---
As is well known, SAP stores amounts internally in variables with 2 decimal places. When we want to convert it to its external format, we use WRITE with the CURRENCY option. But WRITE writes to an alphanumeric variable. What if we need to write it to a numeric variable?

<!--more-->

In that case we can use this wonderful function module:


{{< highlight ABAP >}}
DATA gross_amount TYPE bapicurr_d.
    CALL FUNCTION 'BAPI_CURRENCY_CONV_TO_EXTERNAL'
      EXPORTING
        currency        = s_headerdata-currency
        amount_internal = s_headerdata-gross_amount
      IMPORTING
        amount_external = gross_amount.
{{< /highlight >}}

That's it. You Korean and Japanese users will be happy now.

Greetings from Abapinho.
