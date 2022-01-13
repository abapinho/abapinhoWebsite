---
title: 'The curious case of the partially protected structure'
slug: o-estranho-caso-da-estrutura-parcialmente-protegida
date: 2016-12-26 09:00:10
tags: [ddic]
categories: [dicas]
wordpressId: 3691
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
The other day I was trying (and failing) to modify a line of a SORTED TABLE.

<!--more-->

All seemed to be alright because I was not trying to modify a key field.
Still... something was wrong.

But what?

This is what I was trying to do:


{{< highlight ABAP >}}
DATA: t_t001 TYPE SORTED TABLE OF t001 WITH UNIQUE KEY bukrs.
FIELD-SYMBOLS: <s_t001> LIKE LINE OF t_t001.

SELECT * FROM T001 INTO TABLE t_t001.

READ TABLE t_t001 ASSIGNING <s_t001> INDEX 1.

do_something( CHANGING cs_t001 =  <s_t001> ).
{{< /highlight >}}

The result? A huge DUMP!

First I was confused but then I decided to read more carefully the detailed explanation given by the dump and realized that it explicitly talked about partially protected structures. And I understood that that was the case of my field-symbol pointing to the SORTED TABLE with a UNIQUE KEY.

Interesting, no?

Then I had this idea:


{{< highlight ABAP >}}
READ TABLE t_data ASSIGNING <s_data> INDEX 1.

s_data = <s_data>.        " <<-------- Make a copy of the data

faz_algo( CHANGING cs_data = s_data ). <--- send the copy

DELETE TABLE t_data FROM <s_data> USING KEY primary_key.  <- delete the original

INSERT s_data INTO TABLE t_data. <- insert the modified copy
{{< /highlight >}}

I agree that this is not the prettiest nor the most efficient thing in the world. But it gets the job done.

Fortunately, I ended up not needing this ugly and farfetched solution because I refactored the code around it in a way that the data became encapsulated and no longer needed to be sent like this.

Still, the good thing about it is that I became familiarized with this concept of partially protected structures. And now you, dear reader, know about it too.

Greetings from Abapinho.
