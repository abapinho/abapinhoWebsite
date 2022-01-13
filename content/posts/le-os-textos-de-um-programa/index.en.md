---
title: 'Read the texts of a program'
slug: le-os-textos-de-um-programa
date: 2014-06-09 08:30:00
tags: [i18n]
categories: [dicas]
wordpressId: 2700
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
An easy way of programmatically accessing the texts of any program:


{{< highlight ABAP >}} 
DATA: t_textos TYPE TABLE OF textpool. 
READ TEXTPOOL sy-repid INTO t_textos 
  LANGUAGE sy-langu STATE 'A’. 
{{< /highlight >}}

Now, you have all of the texts available in the internal table T_TEXTOS.

As if this were not enough, you can also change the texts programmatically with the following commands:


{{< highlight ABAP >}} 
INSERT TEXTPOOL sy-repid FROM t_textos LANGUAGE sy-langu. 
DELETE TEXTPOOL PROGRAM LANGUAGE 'E’. 
{{< /highlight >}}

According to SAP, these last two commands are for internal use only. You can use them, but at your own risk. I’ll have nothing to do with it. Unless they force me otherwise, I’ll stick to “READ” only.

Thanks to Miguel Durão for the tip.

Greetings from Abapinho.
