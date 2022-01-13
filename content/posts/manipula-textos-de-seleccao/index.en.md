---
title: 'Change selection screen texts without hard coding them'
slug: manipula-textos-de-seleccao
date: 2021-05-24 09:00:11
tags: [ddic, i18n, segredo]
categories: [dicas]
wordpressId: 4653
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Even though many ABAP programmers tend to forget this, the less texts you hard code in your program the simpler it will be to translate it.

Here's a simple but rather obscure way to manipulate selection screen texts while still being able to translate then. This way you can, for example, prefix them with icons.

<!--more-->

The magic happens in INITIALIZATION.


{{< highlight ABAP >}}
PARAMETERS: p_erdat TYPE erdat.

INITIALIZATION.
  %_P_ERDAT_%_APP_%-TEXT = icon_date && %_P_ERDAT_%_APP_%-TEXT.
{{< /highlight >}}

And here's the result (notice the calendar icon prefixing the text):
[![][1]][2]

ABAP is full of weird stuff like this.

Greetings from Abapinho.

   [1]: images/texto-seleccao-com-icon-300x87.png
   [2]: https://abapinho.com/wp-content/uploads/2021/05/texto-seleccao-com-icon.png
