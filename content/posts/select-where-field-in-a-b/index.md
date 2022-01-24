---
title: 'SELECT WHERE field IN (*, x)'
slug: select-where-field-in-a-b
date: 2021-07-19 09:00:53
tags: [estilo]
categories: [artigos]
wordpressId: 4701
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['SELECT multi key custom table']
description: 'A forma mais simples de fazer SELECT a uma tabela de parametrização com vários níveis de detalhe contemplando wildcards.'
---
Vamos por partes.

Imagina um cenário em que tens uma tabela de parametrização com vários níveis de detalhe que podem ou não estar definidos:

  1. BUKRS (empresa)

  2. WERKS (plant)

  3. LGORT (depósito)

Quando um dos campos está vazio, é um wildcard, ou seja, é válido para todos os valores.

<!--more-->

A configuração da tabela é a seguinte:

BUKRS
| WERKS
| LGORT
| VALUE

---|---|---|---

|
|
| Z1

E1
| W1
|
| Z2

E1
| W1
| L1
| Z4

E1
| W2
|
| Z3

Portanto, a primeira linha define o valor por defeito e as outras definem valores de outros cenários mais ou menos específicos.

Já vi código com um SELECT para cada possível combinação, que é a coisa mais estúpida possível porque neste casos já são 8 SELECTs e se amanhã alguém adicionar um quarto campo terá de fazer 16 SELECTs.

O mais comum, que na minha opinião é igualmente lamentável, é presumir que os campos se preenchem a partir da esquerda, o que reduz a lógica a um SELECT por cada campo chave da tabela. Algo assim:

{{< highlight ABAP >}}
SELECT value INTO result
FROM zparams
WHERE BUKRS = i_bukrs
  AND WERKS = i_werks
  AND LGORT = i_lgort.

IF sy-subrc <> 0.
  SELECT value INTO result
  FROM zparams
  WHERE BUKRS = i_bukrs
    AND WERKS = i_werks.

  IF sy-subrc <> 0.
    SELECT value INTO result
    FROM zparams
    WHERE BUKRS = i_bukrs.
  ENDIF.

ENDIF.
{{< /highlight >}}

São 3 SELECTs e 2 IFs. É muita coisa.

Até há pouco tempo eu fazia um RANGE para cada campo chave e depois resolvia a coisa com um único SELECT ordenado de forma a que as linhas mais específicas sejam as primeiras:


{{< highlight ABAP >}}
DATA r_bukrs TYPE RANGE OF bukrs.
DATA r_werks TYPE RANGE OF werks_d.
DATA r_lgort TYPE RANGE OF lgort_d.

IF i_bukrs IS NOT INITIAL.
  r_burks = VALUE #( option = 'EQ' sign = 'I' ( low = i_bukrs ) ).
ENDIF.
IF i_werks IS NOT INITIAL.
  r_werks = VALUE #( option = 'EQ' sign = 'I' ( low = i_werks ) ).
ENDIF.
IF i_lgort IS NOT INITIAL.
  r_lgort = VALUE #( option = 'EQ' sign = 'I' ( low = i_lgort ) ).
ENDIF.

SELECT value INTO result
UP TO 1 ROWS
FROM zparams
WHERE BUKRS IN r_bukrs
  AND WERKS IN r_werks
  AND LGORT IN r_lgort
ORDER BY bukrs DESCENDING werks DESCENDING lgort DESCENDING.
ENDSELECT.
{{< /highlight >}}

Ainda é muito código e usa 3 variáveis auxiliares mas ao menos a lógica é mais simples de manter: um SELECT e nenhum IF.

Mas recentemente lembrei-me de que é possível simplificar imenso:


{{< highlight ABAP >}}
SELECT value INTO result
UP TO 1 ROWS
FROM zparams
WHERE BUKRS IN (space, i_bukrs)
  AND WERKS IN (space, i_werks)
  AND LGORT IN (space, i_lgort)
ORDER BY bukrs DESCENDING werks DESCENDING lgort DESCENDING.
ENDSELECT.
{{< /highlight >}}

Olé!! Um SELECT, zero IFs, zero variáveis auxiliares.

Obrigado hello-julie pela foto.

O Abapinho saúda-vos.
