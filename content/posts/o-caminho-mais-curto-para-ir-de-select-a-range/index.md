---
title: 'O caminho mais curto para ir de SELECT a RANGE'
slug: o-caminho-mais-curto-para-ir-de-select-a-range
date: 2019-11-13 10:21:31
tags: [7.4, estilo]
categories: [artigos]
wordpressId: 4314
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'SELECT to RANGE'
description: 'Várias formas diferentes de converter um SELECT num RANGE. Da pior com 15 linhas e 7 comandos à melhor com apenas 5 linhas e 1 comando.'
---
Hoje debruçamo-nos sobre como tentar optimizar o código para transformar um SELECT num RANGE.

<!--more-->

Comecemos pelo código mais simplório, sem qualquer tentativa de optimização:

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

  * 7 comandos

  * 4 variáveis

  * 15 linhas

Há 8 anos atrás [sugeri][1] que podia ser um pouco melhorado:

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

  * 4 comandos

  * 2 variáveis

  * 10 linhas

Entretanto, com o ABAP 7.40 a manipulação de tabela internas sofisticou e permite simplificar mais:

{{< highlight ABAP >}}
DATA r_kunnr TYPE RANGE OF kunnr.

SELECT kunnr AS low
INTO CORRESPONDING FIELDS OF TABLE r_kunnr
FROM kna1.

r_kunnr = VALUE #( FOR wa IN r_kunnr
                   option = 'EQ' sign = 'I'
                   ( low = wa-low ) ).
{{< /highlight >}}

  * 2 comandos

  * 1 variável!

  * 9 linhas

Mas depois o Sérgio Fraga mostrou-me que o SQL também sofisticou e permite agora fazer algo que não podia ser mais simples:

{{< highlight ABAP >}}
DATA r_kunnr TYPE RANGE OF kunnr.

SELECT 'EQ' AS option, 'I' AS sign, kunnr AS low
INTO CORRESPONDING FIELDS OF TABLE @r_kunnr
FROM kna1.
{{< /highlight >}}

  * 1 comando!

  * 1 variável!

  * 5 linhas

Nada mau! Melhor só mesmo se conseguisse declarar a variável _inline_ mas não sei como o poderia fazer.

Actualização: o Gabriel mostrou que é de facto possível declarar a variável _inline_ :

{{< highlight ABAP >}}
SELECT 'I' AS sign, 'EQ' AS option, kunnr AS low, kunnr AS high
INTO TABLE @DATA(r_kunnr)
FROM kna1.
{{< /highlight >}}
É apenas fundamental que os campos sejam listados nesta ordem, incluindo o HIGH, para que a tabela interna gerada _inline_ seja considerada um RANGE válido. Obrigado Gabriel!

  * 1 comando!

  * 0 variáveis!

  * 3 linhas!

Os 7 comandos, 4 variáveis e 15 linhas ficaram reduzidos a 1 comando e 3 linhas. Agora sim, parece-me impossível simplificar mais!

O Abapinho saúda-vos.

   [1]:  {{< ref "range-instantaneo" >}}
