---
title: 'Program the program programming'
slug: programa-a-programacao-dos-programas
date: 2016-01-18 09:00:47
tags: [segredo]
categories: [dicas]
wordpressId: 3369
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
One of the few things that separates us humans from all the other animals is our ability to think about thoughts.

A sparrow may think "I'm scared, I'll say chirp chirp chirp" and, as a direct consequence, whoever stands close to it will hear "chirp chirp chirp".

<!--more-->

But, as far as I know, no sparrow ever thought "why did I think about saying chirp chirp chirp?". And this is a terrible limitation. A limitation which, for better or worse, humans don't have. Humans think about their thoughts. Too much probably (but that's for another blog). A human being thinks "look, a sparrow" and then immediately thinks "look at me thinking about looking at a sparrow" and then "look at me thinking about thinking about looking at a sparrow". Some are known to get stuck in this loop forever (but that's also for another blog).

SAP isn't human, I know, but it can do some introspection tricks as well.

One of them uses function module `RS_TOOL_ACCESS` which allows a program to access all the tools available in the ABAP Development Workbench. For example, this code will show a class in display mode:


{{< highlight ABAP >}}
CALL FUNCTION 'RS_TOOL_ACCESS'
  EXPORTING
    operation           = 'SHOW' 
    object_name         = 'CL_GUI_FRONTEND_SERVICES' 
    object_type         = 'CLAS' 
    position            = 0
  EXCEPTIONS
    not_executed        = 01
    invalid_object_type = 02.
{{< /highlight >}}

Isn't this thinking about thoughts?

And you have a lot of other available operations which I'll not explain here because many of them are not obvious at all. But you can explore the function's code, particularly the CASE starting at line 384.

We may therefore assume that, at least theoretically, putting some genetic algorithms and some neuronal networks together with a pinch of magical dust you'd probably be able to create program called ZABAPER which, receiving a functional specification as an input parameter, a deadline could generate all the code by itself.

Thank you Nuno Morais for the tip.

Photo: [brewbooks][1] via [Visualhunt.com][2] / [CC BY-SA][3]

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/brewbooks/7780990192/
   [2]: http://visualhunt.com/
   [3]: http://creativecommons.org/licenses/by-sa/2.0/
