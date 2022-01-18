---
title: 'Formating variables when concatenating strings using <i>pipes</i>'
slug: formata-as-variaveis-ao-concatenar-strings-com-pipes
date: 2015-11-16 09:00:22
tags: []
categories: [dicas]
wordpressId: 3272
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Pipes are the new trend when it comes to manipulating strings:


{{< highlight ABAP >}}
str = |Hi { sy-uname }, | &
      |today's date is { sy-datum }.|.
{{< /highlight >}}

Besides looking cool, it's way more practical than using the dreaded CONCATENATE.

But I only recently found out that you can directly apply formatting to the variables:

<!--more-->


{{< highlight ABAP >}}
str = |Olá { sy-uname CASE = LOWER }, | &
      |a data de hoje é { sy-datum DATE = USER }.|.
{{< /highlight >}}

Press F1 over CASE or DATE to learn all the possibilities:

[![embeded_expressions_format_options][1]][1]

Thank you Sérgio Fraga for the tip.

Thank you Pierre Andrews for the [photo][2].

Greetings from Abapinho.

   [1]: images/embeded_expressions_format_options.png
   [2]: https://www.flickr.com/photos/mortimer/299646160
