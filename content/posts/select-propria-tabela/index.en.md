---
title: 'SELECT comparing 2 fields of the same table '
slug: select-propria-tabela
date: 2013-11-04 09:00:00
tags: [ddic, segredo, sql]
categories: [dicas]
wordpressId: 2473
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
This tip is simple and quick, but I bet 200.482 Portuguese escudos that few know it.

<!--more-->

How to use fields of the table being selected to filter the selection results:


{{< highlight ABAP >}}
DATA: cnt TYPE i.

SELECT COUNT( * )
       FROM kna1
       INTO cnt
       WHERE telf1 = kna1~telfx.

WRITE cnt.
{{< /highlight >}}

In this SELECT we obtain all the customers whose fax number is the same as their phone number.

Did you know this? Had you already done this?

Thanks to Rui Pina for the tip.

And thanks to Kendra for the [photo][1] .

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/63614902@N00/1389081153
