---
title: 'GROUP BY em LOOPs a tabelas internas'
slug: group-by-loops-tabelas-internas
date: 2016-03-21 09:00:57
tags: [7.4, database, estilo]
categories: [artigos]
wordpressId: 3497
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['group by']
---
Todos já ordenamos tabelas internas e utilizamos a instrução AT NEW.
Mas a partir da 7.40, podemos utilizar GROUP BY no LOOP.

É fantástico a capacidade de agrupamento em que os valores do registo processado no loop podem ser comparados, recorrendo a expressões e até métodos.

O agrupamento é realizado num primeiro LOOP e pode ser processado a seguir. Experimentem o seguinte código e, tal como eu, ficarão impressionados com o caminho que o ABAP está a seguir.

<!--more-->


{{< highlight ABAP >}}
DATA flights TYPE TABLE OF spfli WITH EMPTY KEY.
SELECT * FROM  spfli
         WHERE carrid = '...'
         INTO TABLE @flights.
 
DATA members LIKE flights.
LOOP AT flights INTO DATA(flight)
     GROUP BY ( carrier = flight-carrid cityfr = flight-cityfrom )
              ASCENDING
              ASSIGNING FIELD-SYMBOL().
  CLEAR members.
  LOOP AT GROUP  ASSIGNING FIELD-SYMBOL().
    members = VALUE #( BASE members (  ) ).
  ENDLOOP.
  cl_demo_output=>write( members ).
ENDLOOP.
cl_demo_output=>display( ).
{{< /highlight >}}

Ou


{{< highlight ABAP >}}
SELECT  a~so_id,
        b~company_name,
        c~currency_code,
        c~gross_amount,
          CASE a~lifecycle_status
            WHEN 'N' THEN 'NEW'
            WHEN 'C' THEN 'CLOSED'
          ELSE a~lifecycle_status
          END AS lifecycle_status
        FROM snwd_so AS a INNER JOIN snwd_bpa AS b
        ON a~buyer_guid = b~node_key
        LEFT OUTER JOIN snwd_so_inv_head AS c
        ON a~node_key = c~so_guid
        INTO TABLE @DATA(it_result).

DATA records LIKE it_result.

LOOP AT it_result INTO DATA(result)
     GROUP BY ( company_name = result-company_name )
              ASCENDING
              ASSIGNING FIELD-SYMBOL().
  CLEAR records.
  LOOP AT GROUP  ASSIGNING FIELD-SYMBOL().
    records = VALUE #( BASE records (  ) ).
  ENDLOOP.
  cl_demo_output=>write( records ).
ENDLOOP.
cl_demo_output=>display( ).
{{< /highlight >}}

Para quem queira saber mais sobre o assunto:
<https://help.sap.com/abapdocu_740/en/index.htm?file=abaploop_at_itab_group_by.htm>
<https://help.sap.com/abapdocu_740/en/index.htm?file=abenfor_groups_of.htm>

Referências:

  1. https://scn.sap.com/community/abap/blog/2014/10/02/abap-news-for-740-sp08--grouping-internal-tables

  2. https://scn.sap.com/community/abap/blog/2014/09/29/abap-news-for-740-sp08--start-value-for-constructor-expressions (aqui podemos ver o que o VALUE permite fazer)

Obrigado Artur Moreira por este artigo.

Foto: [clickykbd][1] via [Visualhunt.com][2] / [CC BY-NC-SA][3]

O Abapinho saúda-vos.

   [1]: https://www.flickr.com/photos/clickykbd/64464238/
   [2]: https://visualhunt.com
   [3]: https://creativecommons.org/licenses/by-nc-sa/2.0/
