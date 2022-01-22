---
title: 'GROUP BY in LOOPs on internal tables'
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
We've all sorted internal tables to use AT NEW on a LOOP.
But starting from 7.40, we can use GROUP BY on LOOPs.

The ability to group by values based on expressions or even methods is great.

The grouping is done on the first LOOP and can be processed afterwards. Try running the code below and I bet you'll be as impressed as I was.

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

Or


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

To learn more about this subject:
<https://help.sap.com/abapdocu_740/en/index.htm?file=abaploop_at_itab_group_by.htm>
<https://help.sap.com/abapdocu_740/en/index.htm?file=abenfor_groups_of.htm>

References:

  1. https://scn.sap.com/community/abap/blog/2014/10/02/abap-news-for-740-sp08--grouping-internal-tables

  2. https://scn.sap.com/community/abap/blog/2014/09/29/abap-news-for-740-sp08--start-value-for-constructor-expressions (here we can see what VALUE allows you to do)

Thank you Artur Moreira for this article.

Photo: [clickykbd][1] via [Visualhunt.com][2] / [CC BY-NC-SA][3]

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/clickykbd/64464238/
   [2]: https://visualhunt.com
   [3]: https://creativecommons.org/licenses/by-nc-sa/2.0/
