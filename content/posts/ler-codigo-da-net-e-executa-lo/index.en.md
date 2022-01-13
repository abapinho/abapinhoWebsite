---
title: 'Read code from the web and execute it'
slug: ler-codigo-da-net-e-executa-lo
date: 2013-07-01 09:00:42
tags: [dinamico]
categories: [artigos]
wordpressId: 2358
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
This is a 2-in-1 article. That is to say, you’ll learn two subjects at once.

But get ready, what you’ll learn is dynamite, and, in the wrong hands, it can implode your universe.

First, you'll learn how to read content on the web. And right after that, assuming that this content is ABAP code, you’ll learn how to execute it in the blink of an eye.

<!--more-->

Imagine you have an ascii text accessible from a url. To obtain it you do as follows: first you read the url’s content, you join it all in one line and separate it with "enter" and populate a strings table:


{{< highlight ABAP >}}
DATA: t_data TYPE TABLE OF char255,
          line TYPE c LENGTH 2048,
          code TYPE TABLE OF string.

FIELD-SYMBOLS: <data> LIKE LINE OF t_data.

CALL FUNCTION 'DP_GET_STREAM_FROM_URL'
  EXPORTING
    url  = 'https://abapinho.com/qualquercoisa.txt'
  TABLES
    data = t_data.
IF sy-subrc <> 0.
*   Ops
ENDIF.

LOOP AT t_data ASSIGNING <data>.
  CONCATENATE line <data> INTO line.
ENDLOOP.
SPLIT line AT cl_abap_char_utilities=>cr_lf INTO TABLE code.
{{< /highlight >}}

Then, you create a report in the system with this code and run it:


{{< highlight ABAP >}}
INSERT REPORT 'ZCODIGO_DA_NET' FROM code.
SUBMIT zcodigo_da_net.
{{< /highlight >}}

And here’s yet another extremely dangerous article.

If the file happens to read DELETE FROM KNA1 WHERE KUNNR <> 'ANARCHIST' and you’ll loose your job.

Thank you Paweł Grześkowiak for (both) hints and for the source code.

Thank you Gustavo Vargas for the [photo][1]

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/mdverde/8146635628
