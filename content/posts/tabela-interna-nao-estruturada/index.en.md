---
title: 'When an internal table is not structured'
slug: tabela-interna-nao-estruturada
date: 2012-02-27 10:00:06
tags: [segredo]
categories: [dicas]
wordpressId: 1477
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When you want to select some lines in an internal table you normally do something like this:


{{< highlight ABAP >}}
DATA: BEGIN OF itbl,
            campo1 TYPE c,
            campo2 TYPE c,
          END OF itbl.

READ TABLE itbl WITH KEY campo1 = 'X' campo2 = 'Y'.

LOOP AT itbl WHERE campo1 = 'X' and campo2 = 'Y'.
  COISO.
ENDLOOP.
{{< /highlight >}}

But what if the table is not structured and you want to search on the line as a whole? Well in this case here's a tip. Use the special word _TABLE_LINE_ :


{{< highlight ABAP >}}
DATA: itbl TYPE STANDARD TABLE OF string,
            wa LIKE LINE OF itbl.

READ TABLE itbl WITH KEY table_line = 'X'.

LOOP AT itbl INTO wa WHERE table_line = 'X'.
  COISO.
ENDLOOP.
{{< /highlight >}}

(Thanks to [Aaron Escobar][1] for the photo.)

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/aaronescobar/2179228774/
