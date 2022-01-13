---
title: 'Com muitos campos evita INTO CORRESPONDING FIELDS'
slug: into-corresponding-fields
date: 2013-06-10 09:00:27
tags: [performance]
categories: [artigos]
wordpressId: 2308
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Já avisei aqui que, em tabelas com muitos campos, é sempre de evitar fazer SELECT *, devendo-se sempre seleccionar explicitamente apenas os campos necessários.

Mas não avisei ainda que há ainda outra optimização que merece ser feita: evitar o INTO CORRESPONDING FIELDS OF TABLE.

<!--more-->

Fiz as seguintes experiências com a tabela BSAD:

  1. Seleccionar a tabela inteirinha para uma tabela interna com a mesma estrutura;

  2. Seleccionar apenas 4 campos para uma tabela interna com a estrutura da BSAD usando INTO CORRESPONDING FIELDS;

  3. Seleccionar apenas 4 campos da tabela BSAD para uma tabela interna com apenas esses 4 campos ainda assim usando INTO CORRESPONDING FIELDS;

  4. Seleccionar apenas 4 campos da tabela BSAD

Eis os resultados:

 | Duração| %| x
---|---|---|---

1| 54.12s| 100%|

2| 3.40s| 6.3%| 16x

3| 0.74s| 1.4%| 71x

4| 0.70s| 1.3%| 77x

Traduzindo a coisa para miúdos:

  1. Tragédia. Evita a todo o custo. Mas isto já nós sabíamos;

  2. Seleccionando os campos demora apenas 6.3%, ou seja, é quase 16x mais rápido do que a abordagem javarda e preguiçosa;

  3. Enviando os campos para uma estrutura pequena em vez de para a estrutura grande demora apenas 1.4%. É 71x mais rápido do que a abordagem trágica e 4.5x mais rápido do que a que já tínhamos aconselhado;

  4. Evitando o uso do INTO CORRESPONDING quando a estrutura já é pequena ainda se ganha ligeiramente, mas nada de muito significativo.

Foste avisado.

Nota que a vantagem do uso do INTO CORRESPONDING FIELDS é introduzir alguma segurança pois mapeia os campos automaticamente. Caso este comando não seja usado é necessário garantir que os campos da estrutura destino estão todos lá e pela mesma ordem em que aparecem no SELECT.

Fica aqui o programa usado para obter estes resultados:


{{< highlight ABAP >}}
REPORT zzt_into_corresponding.

TYPES: BEGIN OF ty_campos,
         bukrs TYPE bukrs,
         belnr TYPE belnr_d,
         gjahr TYPE gjahr,
         buzei TYPE buzei,
       END OF ty_campos.

DATA: t_bsad_todos  TYPE STANDARD TABLE OF bsad,
      t_bsad_poucos type STANDARD TABLE OF bsad,
      t_campos      TYPE STANDARD TABLE OF ty_campos,
      rtime0        TYPE i,
      rtime1        TYPE i,
      rtime2        TYPE i,
      rtime3        type i,
      rtime4        type i.

GET RUN TIME FIELD rtime0.

SELECT * FROM bsad 
  INTO CORRESPONDING FIELDS OF TABLE t_bsad_todos.
GET RUN TIME FIELD rtime1.

SELECT bukrs belnr gjahr buzei FROM bsad 
  INTO CORRESPONDING FIELDS OF TABLE t_bsad_poucos.
GET RUN TIME FIELD rtime2.

SELECT bukrs belnr gjahr buzei FROM bsad 
  INTO CORRESPONDING FIELDS OF TABLE t_campos.
GET RUN TIME FIELD rtime3.

SELECT bukrs belnr gjahr buzei FROM bsad 
  INTO TABLE t_campos.
GET RUN TIME FIELD rtime4.

rtime0 = rtime1 - rtime0.
rtime1 = rtime2 - rtime1.
rtime2 = rtime3 - rtime2.
rtime3 = rtime4 - rtime3.

WRITE: / 'SELECT *', 50 rtime0,
       / 'SELECT campos INTO CORRESPONDING', 50 rtime1,
       / 'SELECT campos INTO CORRESPONDING estrutura', 50 rtime2,
       / 'SELECT campos INTO estrutura', 50 rtime3.
{{< /highlight >}}

Para os mais picuinhas, é certo que para obter valores mais precisos seria necessário correr isto várias vezes e variar a ordem para obter médias e contornar caches. Mas as diferenças são tão gritantes que não restasm grandes dúvidas. Além disso experimentei inverter a ordem dos SELECTs e as proporções mantiveram-se.

Obrigado Sérgio Fraga pela dica.

Obrigado a metalkpirate1day pela [foto][1].

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/metalkpirate1day/3859785368
