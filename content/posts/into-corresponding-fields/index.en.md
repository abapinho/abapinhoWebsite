---
title: 'With many fields avoid INTO CORRESPONDING FIELDS'
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
I have already advised here that, in tables with many fields, it’s always recommended to avoid using SELECT *, you must always select, explicitly, only the necessary fields.

But I didn’t warn you that there’s yet another optimisation worth making: avoid INTO CORRESPONDING FIELDS OF TABLE.

<!--more-->

I have made the following experiments with the BSAD table:

  1. Select the whole table to an internal table with the same structure;

  2. Select only 4 fields to an internal table with the BSAD’s structure using INTO CORRESPONDING FIELDS;

  3. Select only 4 fields of the BSAD table to an internal table containing only those 4 fields and still using INTO CORRESPONDING FIELDS;

  4. Select only 4 fields of the BSAD table.

These are the results:

 | Duration| %| x
---|---|---|---

1| 54.12s| 100%|

2| 3.40s| 6.3%| 16x

3| 0.74s| 1.4%| 71x

4| 0.70s| 1.3%| 77x

Which translates into:

  1. Tragedy. Avoid at all cost. But we already knew this;

  2. It takes only 6.3% to select the fields, that is to say, almost 16x faster than the lazy and dirty approach;

  3. Sending the fields to a small structure instead of sending them to a big one takes only 1.4%. That’s 71x faster than the tragic approach and 4.5x faster than the previously recommended approach;

  4. Avoiding the use of INTO CORRESPONDING when the structure is already small, you still profit slightly, but it's not all that relevant.

You’ve been warned.

Note that the advantage in using INTO CORRESPONDING FIELDS is to add some measure of safety since it maps the fields automatically. In case this command isn’t used, you must ensure the destination structure’s fields are all there, and in the same order by which they are shown in SELECT.

Here’s the program used to obtain the results:


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

For the petty ones, it’s true that to obtain more precise values you would have to run this several times and change the order to obtain averages and to go around caches. But the differences are so blunt, there’s not much doubt left. Besides, I’ve tried to reverse the SELECTs order and the proportions remained unchanged.

Thank you Sérgio Fraga for the tip.

Thank you metalkpirate1day for the [photo][1].

Greetings from Abapinho

   [1]: http://www.flickr.com/photos/metalkpirate1day/3859785368
