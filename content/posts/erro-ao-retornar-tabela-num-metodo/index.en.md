---
title: 'Syntax error when returning tables of a method'
slug: erro-ao-retornar-tabela-num-metodo
date: 2013-10-21 09:00:37
tags: []
categories: [dicas]
wordpressId: 2451
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
When you create a return parameter in a method of a class that is a TABLE TYPE based on a type declared in the class proper, an error sometimes pops up that says:

"Type of RETURNING parameters must be fully specified."

<!--more-->

The strange thing is that this only happens in the return parameter. It works if you use EXPORTING instead of RETURNING.

The definition of the type used in the parameter can be as follows, for example:


{{< highlight ABAP >}}
 TYPES: BEGIN OF ty_s_info,
           kunnr TYPE kunnr,
           name1 TYPE name1,
         END OF ty_s_info,
         ty_t_info TYPE STANDARD TABLE OF ty_s_info.
{{< /highlight >}}

I did not understand what this meant for a long time and my solution was to use EXPORTING or define the necessary TABLE TYPE in SE11. I no longer had problems when I did this. But I got tired of doing this the other day, it upset me, I started to see red, punched the screen and decided to look further into this issue.

In actual fact, I didn’t have to go very deep because the solution is simple.

From SAP’s perspective, the TY_T_INFO table is not completely defined. The key still has to be defined. The solution is doing something like this:


{{< highlight ABAP >}}
TYPES: ty_t_info TYPE SORDED TABLE OF ty_s_info WITH UNIQUE KEY kunnr.
{{< /highlight >}}

And there you have it, the error is cleared up.

Thank you C.G. Megee for the [photo][1].

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/88441986@N06/8075257531/in/photostream/
