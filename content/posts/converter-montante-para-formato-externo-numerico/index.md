---
title: 'Converter montante para formato externo numérico'
slug: converter-montante-para-formato-externo-numerico
date: 2020-06-02 09:09:10
tags: []
categories: [dicas]
wordpressId: 4489
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['montantes formato externo']
description: 'Como converter um montante do formato interno para o formato interno atribuindo o resultado a uma variável de tipo numérico.'
---
Como é conhecido, o SAP guarda internamente os montantes e variáveis com 2 casas decimais. Quando queremos convertê-los no formato externo costumamos usar o WRITE com a opção CURRENCY. Mas o WRITE escreve numa variável alfa-numérica. E se quisermos escrever numa variável numérica?

<!--more-->

Nesse caso podemos usar esta bela função:


{{< highlight ABAP >}}
DATA amount_internal TYPE wrbtr.
DATA amount_external TYPE bapicurr_d.
CALL FUNCTION 'BAPI_CURRENCY_CONV_TO_EXTERNAL'
  EXPORTING
    currency        = currency
    amount_internal = amount_internal
  IMPORTING
    amount_external = amount_external.
{{< /highlight >}}

Pronto. Os coreanos e os japoneses já podem ficar descansados.

O Abapinho saúda-vos.
