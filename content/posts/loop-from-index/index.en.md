---
title: 'LOOP FROM INDEX'
slug: loop-from-index
date: 2011-03-10 12:15:12
tags: [performance]
categories: [dicas]
wordpressId: 553
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
It’s very easy to get tied up in knots where performance is concerned when you’re working with internal tables – especially when they’re getting really big. In fact these problems often only arise after a few months, when the tables tend to grow as time goes by.

For example, when you’re looping two tables, one of headers and another of entries, do you do this?


{{< highlight ABAP >}}
LOOP AT itab1 ASSIGNING <fs1>.
   LOOP AT itab2 ASSGNING <fs2> WHERE field1 = <fs1>-field1.
   ENDLOOP.
ENDLOOP.
{{< /highlight >}}

Did you know that for big tables this can take ages because _LOOP WHERE_ makes a sequential reading of _itab2_ for each entry in _itab1_?

Why don’t you do this instead?


{{< highlight ABAP >}}
SORT itab2 BY field1.

LOOP AT itab1 ASSIGNING <fs1>.

   READ TABLE itab2 WITH KEY field1 = <fs1>-field1
      BINARY SEARCH TRANSPORTING NO FIELDS.
   CHECK SY-SUBRC = 0.
   lv_tabix = sy-tabix.

   LOOP AT itab2 FROM lv_tabix ASSIGNING <fs2>.
      IF <fs2>-field1 <> <fs1>-field1.
         EXIT.
      ENDIF.
   ENDLOOP.

ENDLOOP.
{{< /highlight >}}

It makes all the difference in the world in terms of performance. The more data points there are in _itab2_ , the greater the difference.

This advantage of _LOOP FROM INDEX_ also works if you use a _SORTED TABLE_ instead of normal internal tables. But we’ll keep this for another article.

Thanks to Bruno Filipa for this tip.

Greetings from Abapinho.
