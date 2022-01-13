---
title: 'More RANGEs, less SELECTs'
slug: mais-ranges-menos-selects
date: 2012-06-04 09:00:33
tags: [estilo, sql]
categories: [dicas]
wordpressId: 1721
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
The dictionary has the following entry for "style": "set of formal aspects and expressive resources that characterise a text."

It is preferable to read a text with style than one without. If ABAP were a language, a program in ABAP would be a text. When it comes to style, there are programs that seem to have been written by the feet, while there are others that one would swear the quill that wrote them was guided by the pure hand of an eighteenth century lady plagued by the troubles of love. Fortunately, I think it’s not possible to write programs in ABAP as tacky as the last sentence.

The "style" label is used here in Abapinho to identify articles that talk about just that: style. These articles try to find ways to improve the style of ABAP programs. This is one of Abapinho’s favourite labels, as you can see [here][1]. And what you are reading is another of those articles.

Moving on.

<!--more-->

It is very common to see code something like this:


{{< highlight ABAP >}}
IF i_kunnr IS INITIAL.
  IF i_name1 IS INITIAL.
    SELECT SINGLE * INTO w_kna1 FROM kna1.
  ELSE.
    SELECT SINGLE * INTO w_kna1 FROM kna1
      WHERE name1 = i_name1.
  ENDIF.
ELSE.
  IF i_name1 IS INITIAL.
    SELECT SINGLE * INTO w_kna1 FROM kna1
      WHERE kunnr = i_kunnr.
  ELSE.
    SELECT SINGLE * INTO w_kna1 FROM kna1
      WHERE kunnr = i_kunnr AND name1 = i_name1.
  ENDIF.
ENDIF.
{{< /highlight >}}

In other words, we have two optional parameters that we can use to select a KNA1 register, and we perform the appropriate SELECT depending on whether they are filled in. Does it have style? No. I will show you another way to do the same:


{{< highlight ABAP >}}
DATA: r_kunnr TYPE RANGE OF kunnr,
          s_kunnr LIKE LINE OF r_kunnr,
          r_name1 TYPE RANGE OF name1,
          s_name1 LIKE LINE OF r_name1.

IF i_kunnr IS NOT INITIAL.
  s_kunnr-option = 'EQ'.
  s_kunnr-sign = 'I'.
  s_kunnr-low = i_kunnr.
  APPEND s_kunnr TO r_kunnr.
ENDIF.

IF i_name1 IS NOT INITIAL.
  s_name1-option = 'EQ'.
  s_name1-sign = 'I'.
  s_name1-low = i_name1.
  APPEND s_name1 TO r_name1.
ENDIF.

SELECT SINGLE * INTO w_kna1 FROM kna1
  WHERE kunnr IN r_kunnr AND name1 IN r_name1.
{{< /highlight >}}

How about this? It does the same thing but with much more style.

Another way would be to use a dynamic SELECT, but that would be unnecessarily complicated for this scenario.

Greetings from Abapinho.

   [1]: https://abapinho.com/tag/estilo/
