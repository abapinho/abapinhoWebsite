---
title: 'Mete variáveis dentro de textos standard'
slug: mete-variaveis-dentro-de-textos-standard
date: 2012-04-30 10:00:06
tags: [i18n]
categories: [artigos]
wordpressId: 1652
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Textos standard toda a gente usa. Mas sabias que os textos standard podem ter campos dinâmicos lá pelo meio? A SAP chama-lhes "símbolos de texto". A forma de o conseguir é igual à dos velhos formulários da nefasta SE71, ou seja, envolvendo-os com o símbolo &. Assim: &KNA1-NAME1;&. Dá um jeitão. Vou mostrar-te como se faz.

<!--more-->

Primeiro tens de definir o texto na SO10. Escolhe um ID (que representa um grupo de textos), depois um nome único para o nosso texto e finalmente a língua em que o vais definir:

![][1]

A seguir define o texto:

![so10b][2]

Agora que tens o texto definido, podes obtê-lo em qualquer lado utilizado a função READ_TEXT. O resultado desta função é uma tabela interna com as linhas do texto:

![][3]

Como vês, ainda lá estão os campos dinâmicos por substituir. Até aqui, tudo banal. Agora é que vem o truque. Para isto vamos usar duas funções: TEXT_SYMBOL_SETVALUE e TEXT_SYMBOL_REPLACE. A primeira deve ser invocada uma vez por cada símbolo de texto para substituir individualmente cada um deles pelo valor desejado. Esta limita-se a preparar em memória essas alterações. Para as efectivar é necessário invocar a segunda. Tudo junto fica assim:


{{< highlight ABAP >}}
DATA: w_thead TYPE thead,
           t_tline TYPE STANDARD TABLE OF tline.

    CALL FUNCTION 'READ_TEXT'
      EXPORTING
        id                      = 'ZZST'
        language                = 'P'
        name                    = 'ABAPINHO'
        object                  = 'TEXT'
      IMPORTING
        header                  = w_thead
      TABLES
        lines                   = t_tline
      EXCEPTIONS
        id                      = 1
        language                = 2
        name                    = 3
        not_found               = 4
        object                  = 5
        reference_check         = 6
        wrong_access_to_archive = 7
        OTHERS                  = 8.
   CHECK sy-subrc = 0.

*     Substitui valor da encomenda
        CALL FUNCTION 'TEXT_SYMBOL_SETVALUE'
          EXPORTING
            name  = '&VBAK-NETWR&'
            value = w_vbak-netwr.

*      Substitui moeda da encomenda
        CALL FUNCTION 'TEXT_SYMBOL_SETVALUE'
          EXPORTING
            name  = '&VBAK-WAERK&'
            value = w_vbak-waerk.

        CALL FUNCTION 'TEXT_SYMBOL_REPLACE'
          EXPORTING
            header = w_thead
          TABLES
            lines  = t_tline.
{{< /highlight >}}

Se olhares agora para as linhas vais ver que os símbolos foram substituídos pelos valores desejados.

A carta pode seguir para fazer mais uma mãe e um filho felizes.

O Abapinho saúda-vos.

   [1]: images/so10a.png (so10a)
   [2]: images/so10b.png
   [3]: images/read_text.png (read_text)
