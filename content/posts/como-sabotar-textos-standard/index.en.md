---
title: 'How to sabotage standard texts'
slug: como-sabotar-textos-standard
date: 2015-11-23 09:00:43
tags: [segredo]
categories: [artigos]
wordpressId: 3281
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Some times I don't like the names SAP gave to things. So I change them.

For example, one day I was very angry and thought all customers were parasites.

So I did the following:

<!--more-->

  1. Ran transaction SE63;

  2. Opened menu Translation > ABAP Objects > Short texts;

  3. Opened folder "A5 User interface texts";

  4. Double-clicked on line "DTEL Data elements";

  5. A selection screen showed up. In field "Object name" I wrote KUNNR;

  6. And in field "Target language I wrote "enUS", the code for american English;

  7. Pressed the "Edit" button;

  8. I got a translation screen. Wherever I saw "Customer" I wrote "Parasite";

  9. Clicked on the yellow icons to turn them into green and saved.

This was the translation screen (with the Portuguese example):

[![se63_clientes_parasitas][1]][1]

And this is what I got when I use SE16N to browse table KNA1 (again, the Portuguese example, sorry):

[![se16n_clientes_parasitas][2]][2]

Notice how the description for the customer was now much better. My soul was finally at peace again: I got my revenge!

Thank you Carla Luz for the tip.

Greetings from Abapinho.

   [1]: images/se63_clientes_parasitas.png
   [2]: images/se16n_clientes_parasitas.png
