---
title: 'Lookup em tabela sem ter de lidar com a excepção CX_SY_ITAB_LINE_NOT_FOUND'
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
Antes do 7.40 ter modernizado o ABAP, um lookup a uma tabela obrigava a declarar uma variável auxiliar e a pelo menos 4 linhas de código.

<!--more-->

Temos a seguinte tabela interna:

{{< highlight ABAP >}}
DATA(itbl) = VALUE t_t001( ( bukrs = 'COCA' butxt = 'Coca-cola' )
                            ( bukrs = 'PEPS' butxt = 'Pepsi' ) ).
{{< /highlight >}}

Antes da 7.40 tinha de ser assim:

{{< highlight ABAP >}}
DATA wa LIKE LINE OF itbl.
DATA butxt TYPE butxt.
READ TABLE itbl INTO wa WITH KEY bukrs = 'SPRI'.
IF SY-SUBRC = 0.
  butxt = wa-butxt.
ENDIF.
{{< /highlight >}}

Com o 7.40 a coisa tornou-se muito mais elegante. Mas mesmo assim, se o lookup falhar salta a excepção CX_SY_ITAB_LINE_NOT_FOUND com a qual temos de lidar, o que torna o código feio:


{{< highlight ABAP >}}
TRY.
    DATA(butxt) = itbl[ bukrs = 'SPRI' ]-butxt.
  CATCH CX_SY_ITAB_LINE_NOT_FOUND.
    CLEAR butxt.
ENDTRY.
{{< /highlight >}}

Mas agora descobri que podemos recorrer ao VALUE e à sua funcionalidade OPTIONAL para nos ajudar a tornar a coisa muito mais simples:


{{< highlight ABAP >}}
DATA(butxt) = VALUE #( itbl[ bukrs = 'SPRI' ]-butxt OPTIONAL ).
{{< /highlight >}}

Mais legível e mais sintético e por isso muito mais bonito e elegante.

O Abapinho saúda-vos.
