---
title: 'SELECT-OPTIONS default behavior'
slug: pre-definir-select-options
date: 2015-02-09 09:00:23
tags: [estilo]
categories: [dicas]
wordpressId: 2993
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Abapinho received a letter.

Mr. Abapinho,

Everybody knows how to set default values in select options using the DEFAULT keyword. What some people may not know is that one can also set the default option, sign and even if allows for intervals or just fixed values.

<!--more-->

Like this:


{{< highlight ABAP >}}
DATA: s_record TYPE ZDATA.

SELECT-OPTIONS so_code1 FOR s_record-code
                        DEFAULT '20140805'
                        OPTION GE SIGN I.

SELECT-OPTIONS so_code2 FOR s_record-code
                       NO INTERVALS.
{{< /highlight >}}

A big hug Mr. Abapinho.

Thank you Mr. Sérgio Fraga.

Thank you David Sjunnesson for the [photo][1].
Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/sjunnesson/4968803264
