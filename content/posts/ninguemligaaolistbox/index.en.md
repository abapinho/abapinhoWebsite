---
title: 'No one cares for LISTBOX'
slug: ninguemligaaolistbox
date: 2012-10-29 09:00:07
tags: [sapgui, ui]
categories: [dicas]
wordpressId: 2027
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
For some strange reason, LISTBOX is rarely used in report selection screens. Even though it's widely used throughout the web. Who knows why.

Dear reader, I suggest you pay attention to its advantages:

<!--more-->

  * Whenever the value list is not too long, using LISTBOX avoids having to use F4 look up because its values are already available on the screen

  * Besides its code, the selected option description is also shown, resulting in increased readability

It's so simple:


{{< highlight ABAP >}}
TABLES: kna1.
PARAMETERS: p_land1 LIKE kna1-land1 AS LISTBOX
                    VISIBLE LENGTH 25 DEFAULT 'PT' OBLIGATORY.
{{< /highlight >}}

It then looks like this:
![][1]

And you, did you use it already?

Greetings from Abapinho.

   [1]: images/listbox.png (listbox)
