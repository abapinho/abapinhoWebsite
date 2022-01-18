---
title: 'Source-code based class development'
slug: programar-classes-baseado-texto-fonte
date: 2016-05-23 11:08:44
tags: [sapgui]
categories: [dicas]
wordpressId: 3550
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Being used to develop in Java and C++, the way transaction SE24 forces you to navigate between each of its parts and the fact that every method has its own include was very confusing to me when I first started using it. Why does SAP always have to make things so complicated? I eventually got used to it.

At some point in time SE24 introduced the option "source-code based" which shows the class and all its methods in a single text. But for some reason I never felt comfortable using it.

[![baseado_em_texto_fonte][1]][1]

Today I think I know why. Because I didn't know of any form of navigation which would allow me to directly jump to a method's definition or implementation.

But it is there. Just press CTRL-F5 (or the equivalent toolbar button) and you'll get this popup:

[![navegador_de_classe][2]][2]

Now we're talking. I finally can starting to do source-code based development in ABAP.

And so that it becomes a habit, you can change the ABAP Workbench settings to make this the default mode.

Greetings from Abapinho.

   [1]: images/baseado_em_texto_fonte.jpg
   [2]: images/navegador_de_classe.jpg
