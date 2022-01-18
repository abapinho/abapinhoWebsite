---
title: 'Lê código da net e executa-o'
slug: ler-codigo-da-net-e-executa-lo
date: 2013-07-01 09:00:42
tags: [dinamico]
categories: [artigos]
wordpressId: 2358
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Este artigo é um dois em um. Ou seja, vais aprender duas coisas de uma só vez.

Mas prepara-te, o que vais aprender é dinamite e, nas mãos erradas, pode fazer implodir o teu universo.

Primeiro vais aprender a ir ler conteúdo à net. E logo a seguir, assumindo que esse conteúdo é código ABAP, aprendes de rajada a executá-lo.

<!--more-->

Imagina que tens um texto ascii acessível a partir de um url. Para o obteres fazes assim. Primeiro lês o conteúdo do url, juntas tudo numa linha e separas pelo "enter" e populas uma tabela de strings:


{{< highlight ABAP >}}
DATA: t_data TYPE TABLE OF char255,
          line TYPE c LENGTH 2048,
          code TYPE TABLE OF string.

FIELD-SYMBOLS: <data> LIKE LINE OF t_data.

CALL FUNCTION 'DP_GET_STREAM_FROM_URL'
  EXPORTING
    url  = 'https://abapinho.com/qualquercoisa.txt'
  TABLES
    data = t_data.
IF sy-subrc <> 0.
*   Ops
ENDIF.

LOOP AT t_data ASSIGNING <data>.
  CONCATENATE line <data> INTO line.
ENDLOOP.
SPLIT line AT cl_abap_char_utilities=>cr_lf INTO TABLE code.
{{< /highlight >}}

E depois, crias um report no sistema com este código e corre-lo:


{{< highlight ABAP >}}
INSERT REPORT 'ZCODIGO_DA_NET' FROM code.
SUBMIT zcodigo_da_net.
{{< /highlight >}}

E cá temos mais um artigo extremamente perigoso.

Basta o ficheiro dizer DELETE FROM KNA1 WHERE KUNNR <> 'ANARQUISTA' e perdes o emprego.

Obrigado Paweł Grześkowiak pelas (duas) dicas e pelo código original.

Obrigado Gustavo Vargas pela [foto][1].

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/mdverde/8146635628
