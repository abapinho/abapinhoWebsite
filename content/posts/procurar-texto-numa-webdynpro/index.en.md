---
title: 'Text search in a WebDynpro'
slug: procurar-texto-numa-webdynpro
date: 2015-03-23 09:00:31
tags: [segredo, webdynpros]
categories: [artigos]
wordpressId: 3025
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
SAP doesn't know how to do things right the first time. The WebDynpros are a good example of this. It doesn’t even let you do a text search. It's sad.

Fortunately Sérgio Fraga has found a way, though it’s rather laboured:

<!--more-->

  1. Go to transaction SE24 and execute the following method:
CL_WDY_WB_NAMING_SERVICE=>GET_CLASSNAME_FOR_COMPONENT();

  2. Enter the name of the WebDynpro you want to search for in the input parameter. The result is the name of a generated class. It is an ugly name.

  3. Copy that ugly name and paste it in SE24, then press F7 to enter the class. The class is apparently simple. But it must be filled with invisible strings because...

  4. Once in SE24 press CTRL-F or the search button and enter the text you want to search for;

  5. A list of results pops up and, magically, you can navigate to the exact spot in WebDynpro where it is found.

The bizarre and mysterious fact is that the generated class does not appear to have any code at all. But it is able to find things. And that's good enough for me.

Thanks to Sérgio Fraga for the tip.

Greetings from Abapinho.
