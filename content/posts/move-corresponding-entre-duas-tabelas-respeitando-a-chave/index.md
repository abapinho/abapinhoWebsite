---
title: 'MOVE-CORRESPONDING entre duas tabelas respeitando a chave'
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
O Abapinho não tem falado muito sobre o 7.40 porque as suas novidades têm já sido amplamente descritas em vários sites. Tentamos não inventar a roda.

Mas há pequenas pérolas úteis que ainda são pouco conhecidas. Esta é sobre uma delas.

<!--more-->

Tens como objectivo preencher esta tabela T_DATA com itens de documentos financeiros:


{{< highlight ABAP >}}
BSEG-BUKRS
BSEG-BELNR
BSEG-GJAHR
BSEG-BUZEI
BSEG-LIFNR
LFA1-NAME1
{{< /highlight >}}

Imagina a tabela já está preenchida com dados da BSEG, faltando preencher a coluna NAME1 que tem de ser obtida na LFA1. E que tens já outra tabela interna T_LFA1 preenchida com os dados da LFA1:


{{< highlight ABAP >}}
LFA1-LIFNR
LFA1-NAME1
{{< /highlight >}}

Até à 7.40 terias de fazer algo neste género:


{{< highlight ABAP >}}
LOOP AT t_data ASSIGNING <s_data>.
  READ TABLE t_lfa1 ASSIGNING <s_lfa1> WITH KEY lifnr = <s_data>-lifnr.
  IF sy-subrc = 0.
    <s_data>-name1 = <s_lfa1>-name1.
  ENDIF.
ENDLOOP.
{{< /highlight >}}

Agora olha só esta maravilha na 7.40:


{{< highlight ABAP >}}
t_data = CORRESPONDING #( t_data FROM t_lfa1 USING lifnr = lifnr ).
{{< /highlight >}}

Coisa mais linda! Num único comando, a coluna NAME1 da T_DATA fica preenchida a partir das tabela T_LFA1, respeitando a chave LIFNR. E podes adicionar-lhe um MAPPING caso alguns dos campos não sejam iguais nas duas estruturas.

O que até aqui dava um trabalhão porque obrigava a LOOP, READ TABLE, variáveis auxiliares e atribuições manuais, reduz-se agora a uma única operação de uma linha, que ainda por cima é mais legível e fácil de compreender!

E o novo commando CORRESPONDING tem uma série de afinações possíveis. Dá, por exemplo, para definir quais os campos que se quer copiar e quais os que não se quer copiar. Por exemplo, assim copiamos apenas o NAME1 sem correr o risco de destruir os restantes campos:

{{< highlight ABAP >}}
t_data = CORRESPONDING #( t_data FROM t_lfa1 USING lifnr = lifnr
                          MAPPING name1 EXCEPT * ).
{{< /highlight >}}

O Abapinho saúda-vos.
