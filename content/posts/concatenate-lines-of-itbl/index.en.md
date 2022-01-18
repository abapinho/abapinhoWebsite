---
title: 'CONCATENATE LINES OF itbl'
slug: concatenate-lines-of-itbl
date: 2015-10-05 09:00:50
tags: [estilo]
categories: [dicas]
wordpressId: 3222
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
If you want to serialize a set of strings stored in an internal table there are two ways to do it. One is dull, the other one is full of style.

<!--more-->

Let's start by defining our data:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_output,
         field1 TYPE char10,
         field2 TYPE char10,
         field3 TYPE char10,
       END OF ty_output.

DATA: t_output TYPE TABLE OF ty_output.

APPEND INITIAL LINE TO t_output ASSIGNING <output> .
<output>- field1 = 'a1' .
<output>- field2 = 'a2' .
<output>- field3 = 'a3' .
APPEND INITIAL LINE TO t_output ASSIGNING <output> .
<output>- field1 = 'b1' .
<output>- field2 = 'b2' .
<output>- field3 = 'b3' .
{{< /highlight >}}

We now have an internal table with a 3 field structure filled with 2 records.

Our goal: to serialize everything into a single line: a1 a2 a3 b1 b2 b3.

If you're an old-fashioned dude who listens to crappy music, has no taste in dressing and likes to have dinner at Macdonalds you'll do this:

{{< highlight ABAP >}}
LOOP AT t_output ASSIGNING <output>.
  CONCATENATE opcao1
              <output>-field1
              <output>-field2
              <output>-field3
    INTO opcao1 SEPARATED BY space .
ENDLOOP.
CONDENSE opcao1.
{{< /highlight >}}

If, instead, you're a sophisticated person who only listens to really good music, likes fashionable clothes and refuses to eat any food without molecular in its name, then this is what you'll do:

{{< highlight ABAP >}}
CONCATENATE LINES OF t_output INTO opcao2 SEPARATED BY space.
CONDENSE opcao2.
{{< /highlight >}}

Thank you Leandro Gambim for this tip.

Thank you Nick Thompson for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/pelegrino/8111801072
