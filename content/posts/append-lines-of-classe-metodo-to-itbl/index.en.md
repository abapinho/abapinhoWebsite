---
title: 'APPEND LINES OF class->method() TO itbl'
slug: append-lines-of-classe-metodo-to-itbl
date: 2014-01-27 22:33:25
tags: [estilo]
categories: [dicas]
wordpressId: 2559
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
ABAP is getting smarter all the time. Back in my day, no one did anything with it. And now, slowly, more than a fifth of a century late, it’s trying to imitate C and Java, and becoming more flexible.

I was going to do something like this:

<!--more-->


{{< highlight ABAP >}}
DATA: t_t001 TYPE STANDARD TABLE OF t001,
            t_t001_aux LIKE t_t001.

t_t001_aux = ZCL_T001=>GET_LINES( 'A' ).
APPEND LINES OF t_t001_aux TO t_t001.

REFRESH t_t001_aux[].

t_t001_aux = zcl_t001=>get_lines( 'A' ).
APPEND LINES OF t_t001_aux TO t_t001.
{{< /highlight >}}

But then I thought… maybe… this might work:


{{< highlight ABAP >}}
DATA: t_t001 TYPE STANDARD TABLE OF t001.

APPEND LINES OF zcl_t001=>get_lines( 'A' ) TO t_t001.
APPEND LINES OF zcl_t001=>get_lines( 'B' ) TO t_t001.
{{< /highlight >}}

And it did!

Did you understand? The GET_LINES method returns an internal T001-type table. Instead of saving the result in an internal auxiliary table and then adding the table’s lines to the final table, the method’s result is input directly to the final table. This is simpler and more elegant, and saves an internal auxiliary table.

Thanks to pollovf for the [photo][1].

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/30356381@N02/2847638199/
