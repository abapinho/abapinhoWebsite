---
title: 'LOOP AT tbl ASSIGNING &lt;line&gt; CASTING'
slug: loop-at-tbl-into-linha-casting
date: 2014-12-01 09:50:19
tags: [estilo]
categories: [dicas]
wordpressId: 2928
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Did you know that you can do a LOOP on an internal table of one type into a structure of a different type?

<!--more-->

Consider the following types:


{{< highlight ABAP >}}
TYPES: BEGIN OF ty_s_linha1,
               kunnr TYPE kunnr,
               name1 TYPE name1,
          END OF ty_s_linha1,

          BEGIN of ty_s_linha2,
               kunnr TYPE kunnr,
          END OF ty_s_linha2.
 {{< /highlight >}}

You have an internal table of type LINHA1 and want to loop it into a structure of type LINHA2.

The old way of doing it required you to manually convert LINHA1 into LINHA2:


{{< highlight ABAP >}}
    DATA: t_linha1 TYPE STANDARD TABLE OF ty_s_linha1,
              s_linha2 TYPE ty_s_linha2.

    FIELD-SYMBOLS: <s_linha1> TYPE ty_s_linha2.
    
   LOOP AT t_linha1 ASSIGNING <s_linha1>.
     MOVE-CORRESPONDING <s_linha1> TO s_linha2.
     do_something( s_linha2 ).
  ENDLOOP.
{{< /highlight >}}

But a simple word, CASTING, makes everything so much simpler:


{{< highlight ABAP >}}
    DATA: t_linha1 TYPE STANDARD TABLE OF ty_s_linha1.
    FIELD-SYMBOLS: <s_linha2> TYPE ty_s_linha2.
    
   LOOP AT t_linha1 ASSIGNING <s_linha2> CASTING.
    faz_algo( s_linha2 ).
  ENDLOOP.
{{< /highlight >}}

Note that this doesn't work with INTO, only with ASSIGNING.

Thank you Nuno Morais for the tip.

Thank you Eelco for the [photo][1].

   [1]: “https://www.flickr.com/photos/smiling_da_vinci/12781401”
