---
title: "So much new stuff in 7.4, I don't know where to begin"
slug: tanta-coisa-nova-no-7-4-que-nao-sei-por-onde-comecar
date: 2015-08-19 09:00:19
tags: [7.4]
categories: [dicas]
wordpressId: 3192
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Abapinho will slowly start posting tips specific to AS ABAP 7.4. Slowly because there are still only a few people with access to this version. But there are so many new things to tell that I feel tempted to start posting all of them.

ABAP was a flabby middle aged guy with a beer belly. It underwent major plastic surgery and now looks like a lean 20 year old kid who can party until 9am, drink 7 gin tonics and then, before going to bed, do 100 burpees just to sleep better.

Before 7.4:

{{< highlight ABAP >}}
SELECT z1~campo1 z1~campo2 z1~campo3 z1~campo4 z1~campo5
       z2~campo6
 FROM z1
 INNER JOIN z2
 ON z1~campo1 = z2~campo1
 INTO CORRESPONDING FIELDS OF TABLE lt_data
 WHERE z1~campo2 = 'MALAQUIAS'.
{{< /highlight >}}

Since 7.4:

{{< highlight ABAP >}}
SELECT <strong>z1~*</strong>
       z2~campo6
 FROM z1
 INNER JOIN z2
 ON z1~campo1 = z2~campo1
 INTO CORRESPONDING FIELDS OF TABLE lt_data
 WHERE z1~campo2 = 'MALAQUIAS'.
{{< /highlight >}}

Greetings from Abapinho.
