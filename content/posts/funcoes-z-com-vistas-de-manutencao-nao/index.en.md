---
title: "Don't mix Z functions with maintenance views!"
slug: funcoes-z-com-vistas-de-manutencao-nao
date: 2013-06-24 09:00:02
tags: [estilo]
categories: [dicas]
wordpressId: 2351
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Today’s hint is not a hint - it’s an advice.

After creating a table, you create its maintenance views. The maintenance views dwell within a group of functions. This group of functions is requested from you at the time of their creation. Since, after all, that’s no more than a set of generated code, and most of it is, nonetheless, standard includes. Loads.

I give you the problem: there are those who create their own Z functions and put them in groups of functions with maintenance views. It's true. Some do this.

<!--more-->

And now for the advice: don’t do it.

Why? Because nothing good can come from there. Only evil. It’s a matter of hygiene. That’s a good enough reason, right?

I suggest you always clearly identify the groups of functions destined for maintenance views by giving them names that end with _MAINT, or similar. Imagine you have a project that you call PROJ. In this case, the group of functions for tables’ maintenance can be named ZPROJ_MAINT. If you need to create your own functions for that project, create another group of functions called ZPROJ. Or, if you prefer, find a group of existing functions that’s adequate, but make sure it’s not already used for tables’ maintenance.

And since we are at it, another advice, which is like the cherry on top of the previous cake: group tables maintenance views that are related to each other in the same functions group, don’t just bag all maintenance views you create together in the same group of functions, and especially, don’t mix tables that are totally unrelated to each other in the same group of functions. In this case, I can give you a concrete reason not to do this: if there are events set for table A and, due to changes made to table B, you recreate the group of functions, bye-bye event settings!

So, I meant to give an advice, but I actually gave two.

Thank you AmsterSam The Wicked Reflectah for the [photo][1].

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/amstersam/4608512202
