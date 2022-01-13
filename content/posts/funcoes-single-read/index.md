---
title: 'As funções *_SINGLE_READ'
slug: funcoes-single-read
date: 2011-08-01 10:43:04
tags: [estilo]
categories: [artigos]
wordpressId: 920
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Quando se quer obter um único registo de uma tabela da base de dados é costume usar-se o SELECT SINGLE que, como toda a gente sabe, na sua forma mais básica reza assim:


{{< highlight ABAP >}}
SELECT SINGLE *
  FROM KNA1
  WHERE KUNNR = '1234567890'.
{{< /highlight >}}

<!--more-->

Claro que no caso de estar interessado em apenas alguns campos o ideal é seleccioná-los explicitamente para evitar andar a copiar dados desnecessários de um lado para o outro:


{{< highlight ABAP >}}
DATA: lv_name1 TYPE name1.

SELECT SINGLE name1 INTO lv_name1
  FROM KNA1
  WHERE KUNNR = '1234567890'.
{{< /highlight >}}

Mas isso é óbvio e já me estou a desviar do assunto porque não é nada disto que me traz aqui hoje. Hoje venho falar das valiosas funções standard que substituem o SELECT SINGLE. Para muitas das tabelas principais do SAP existem umas funções que o substituem pois servem exactamente para obter um registo dessas tabelas. Por exemplo, a função para obter um registo da KNA1 chama-se KNA1_SINGLE_READ:


{{< highlight ABAP >}}
DATA: wa_kna1 TYPE kna1.

CALL FUNCTION 'KNA1_SINGLE_READ'
  EXPORTING
    kna1_kunnr       = '1234567890'
  IMPORTING
    WKNA1            = wa_kna1
  EXCEPTIONS
    NOT_FOUND        = 1
    OTHERS           = 2.
{{< /highlight >}}

A grande vantagem de utilizar estas funções em vez de fazer SELECT SINGLE é que elas fazem cache dos valores já pedidos. Imagina um cenário em que temos 1000 ordens de venda para as quais queremos obter o registo da KNA1. O mais provável é que essas 1000 ordens pertençam a um pequeno número de clientes. Assim, se fizermos 1000 SELECT SINGLES à KNA1 estaremos desnecessariamente a pedir várias vezes a mesma coisa à base de dados:


{{< highlight ABAP >}}
LOOP AT lt_vbak ASSIGNING <vbak>.
  SELECT SINGLE * FROM KNA1
    INTO wa_kna1
    WHERE kunnr = <vbak>-kunnr.
  " (...)
ENDLOOP.
{{< /highlight >}}

Em termos de performance isto é muito mau. A alternativa, chata e trabalhosa, é obter primeiro uma lista dos diferentes clientes e depois fazer um LOOP a esses clientes:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_kna1,
        kunnr TYPE kunnr,
        name1 TYPE name1,
      END OF ty_kna1 .

DATA: lt_vbak TYPE STANDARD TABLE OF vbak,
      lt_kna1 TYPE STANDARD TABLE OF ty_kna1,
      wa_kna1 LIKE LINE OF lt_kna1.

FIELD-SYMBOLS: <vbak> LIKE LINE OF lt_vbak,
               <kna1> LIKE LINE OF lt_kna1.

* 1. Obter todas as ordens de venda
SELECT * FROM vbak
  INTO TABLE lt_vbak
  WHERE vbeln IN so_vbeln  " parâmetro do report

* 2. Obter os diferentes KUNNRs
LOOP AT lt_vbak ASSIGNING <vbak>.
  wa_kna1-kunnr = <vbak>-kunnr.
  COLLECT wa_kna1 INTO lt_kna1.
ENDLOOP.

* 3. Obter os NAME1 da KNA1
LOOP AT lt_kna1 ASSIGNING <kna1>.
  SELECT SINGLE name1 INTO <kna1>-name1
    FROM kna1
    WHERE kunnr = <kna1>-kunnr.
ENDLOOP.

* 4 Loop das ordens de venda
LOOP AT lt_vbak ASSIGNING <vbak>.
  READ TABLE lt_kna1 ASSIGNING <kna1> WITH KEY kunnr = <vbak>-kunnr.
  " (...)
ENDLOOP.
{{< /highlight >}}

Mas vê agora quão mais simples é usar a KNA1_SINGLE_READ:


{{< highlight ABAP >}}
DATA: lt_vbak TYPE STANDARD TABLE OF vbak,
          wa_kna1 TYPE kna1.

FIELD-SYMBOLS: <vbak> LIKE LINE OF lt_vbak.

* 1. Obter todas as ordens de venda
SELECT * FROM vbak
  INTO TABLE lt_vbak
  WHERE vbeln IN so_vbeln  " parâmetro do report

* 2. Loop das ordens de venda
LOOP AT lt_vbak ASSIGNING <vbak>.
  CALL FUNCTION 'KNA1_SINGLE_READ'
    EXPORTING
      kna1_kunnr = <vbak>-kunnr
    IMPORTING
      wkna1      = wa_kna1
    EXCEPTIONS
      not_found  = 1
      OTHERS     = 2.
  IF sy-subrc <> 0.
    " (...)
  ENDIF.
ENDLOOP.
{{< /highlight >}}

Um bocado mais simples, não? E esta solução é tão ou mais rápida do que a anterior porque a KNA1_SINGLE_READ faz cache automática dos registos que já foram pedidos. E não sou eu quem o diz. A SAP aconselha a usar-se as funções *_SINGLE_READ sempre que possível.

Nota que se souberes que nunca vais pedir duas vezes o mesmo registo não vale a pena usá-las e mais vale fazeres o SELECT SINGLE porque não farás usufruto da cache.

Além das *_SINGLE_READ existem também para muitas das tabelas funções semelhantes mas que permitem ler vários registos de uma só vez. Por exemplo, a MARA_ARRAY_READ. É explorares.

Como já disse, nem todas as tabelas têm funções destas mas não vou agora dizer como deves fazer com cada uma das tabelas do SAP porque, como são dezenas de milhares, o artigo ficava muito grande. Por isso vais ter de ser tu a descobri-las. Mas encontrar estas funções é muito fácil e faz-se quase sempre da mesma maneira: na SE37 pesquisar pelo nome da tabela seguido de *. Se ainda não entendeste dou um exemplo: para a tabela T001W pesquisas por T001W*, e fica certo de que encontrarás qualquer coisa.

O Abapinho saúda-vos.

Actualização: leiam o comentário do André abaixo porque eu acho que ele tem razão. A solução dele parece-me melhor do que a que eu proponho no último exemplo.
