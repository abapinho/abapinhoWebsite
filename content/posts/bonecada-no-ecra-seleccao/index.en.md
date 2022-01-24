---
title: 'Fill up the selection screen with cartoons'
slug: bonecada-no-ecra-seleccao
date: 2012-04-09 10:00:58
tags: [ui]
categories: [dicas]
wordpressId: 1596
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Was SAP born miserable or are SAP-users simply unable to cheer it up?

The truth is that SAP GUI is no rainbow and neither does looking at it bring happiness. Even so, it puts at our disposal a bunch of cartoons that we may use to make it just a little more uplifting.

And take a look at just how easy it is.

<!--more-->

Let’s say you write the following program:


{{< highlight ABAP >}}
REPORT  Z_ICONES_NO_ECRA_DE_SELECCAO

PARAMETERS: p_coiso TYPE char20.

START-OF-SELECTION.
  WRITE p_coiso.
{{< /highlight >}}

The next step is to go to the selection texts and define the P_COISO parameter text. Before you do that, try to run the SHOWICON report and have a look at all the cartoons. When you are tired of looking at them you choose one and keep its name. I chose ICON_COLOR. Keep the two-character alpha-numeric code that appears in the last but two column called “internal.” For instance, the code for the icon called ICON_COLOR is G3:

[![image][1]][2]

Now you can go to the selection texts and write the code with @ either side of it wherever you want the icon to appear:

[![image][3]][4]

And the result is, as expected, uplifting:

[![image][5]][6]

And you might as well know now that the cartoons have to be placed at the start of the line and you can only use one (because this is not msn, man!).

Thank you to Luís Rocha for the tip.

Greetings from Abapinho.

   [1]: images/icones1.png (icones1)
   [2]: images/icones1.png
   [3]: images/icones2.png (icones2)
   [4]: images/icones2.png
   [5]: images/icones3.png (icones3)
   [6]: images/icones3.png
