---
title: 'The *_SINGLE_READ functions'
slug: funcoes-single-read
date: 2011-08-01 10:43:04
tags: [estilo]
categories: [artigos]
wordpressId: 920
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When you need to derive a single record from a database table, you normally use SELECT SINGLE, which is like this in its most basic form, as everyone knows:


{{< highlight ABAP >}}
SELECT SINGLE *
  FROM KNA1
  WHERE KUNNR = '1234567890'.
{{< /highlight >}}

Of course, if you are interested in just a few fields, ideally you select them explicitly to avoid copying unnecessary data from one side to the other:


{{< highlight ABAP >}}
DATA: lv_name1 TYPE name1.

SELECT SINGLE name1 INTO lv_name1
  FROM KNA1
  WHERE KUNNR = '1234567890'.
{{< /highlight >}}

But this is all obvious and I am rambling as none of this is what brings me to this subject today. Today I want to talk about the valuable standard functions that replace SELECT SINGLE. Many of SAP's main tables have functions that replace it as their job is precisely to derive records from those tables. For example, the function to derive a record of KNA1 is called KNA1_SINGLE_READ:


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

The big advantage of using these functions instead of SELECT SINGLE is that they make a cache of the values requested already. Imagine a scenario where we have 1000 sales orders for which we want to derive the KNA1 record. Most probably, those 1000 orders belong to a small number of clients. So if we do 1000 SELECT SINGLES on KNA1 we will request the same thing several times unnecessarily from the database:


{{< highlight ABAP >}}
LOOP AT lt_vbak ASSIGNING <vbak>.
  SELECT SINGLE * FROM KNA1
    INTO wa_kna1
    WHERE kunnr = <vbak>-kunnr.
  " (...)
ENDLOOP.
{{< /highlight >}}

Performance-wise this is very bad. The dull and laborious alternative is first to derive a list of the different clients and then do a LOOP on those clients:


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

But now see how much easier it is to use KNA1_SINGLE_READ:


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

A little simpler, no? And this solution is as fast as or faster than the previous one because KNA1_SINGLE_READ makes a cache automatically of the records already requested. And it is not just me saying so. SAP advises use of the *_SINGLE_READ functions whenever possible.

Note that if you are sure you will never request the same record twice, it is not worth using them and you are better off doing SELECT SINGLE as you will not benefit from the cache.

For many of the tables, aside from *_SINGLE_READ there are also similar functions that allow several records to be read in one go. For example, MARA_ARRAY_READ. Just go and explore.

As I already said, not all the tables have functions like this, but I am not going to tell you how to work with each SAP table because, as there are thousands and thousands, the post would get rather long. So it will have to be up to you to find them. But finding these functions is very easy and is almost always done in the same way: in SE37 search for the table name followed by *. If you’re still not following, here is an example:
for table T001W search for T001W*, and you will be sure to find something.

Greetings from Abapinho.
