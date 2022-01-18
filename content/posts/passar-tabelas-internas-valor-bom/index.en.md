---
title: 'Pass internal tables by value is good'
slug: passar-tabelas-internas-valor-bom
date: 2016-07-11 09:00:21
tags: [performance]
categories: [dicas]
wordpressId: 3578
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keyword: 'tabelas internas por valor'
---
When a method returns a value as a RETURNING parameter this is always done by value and not by reference. Several of my methods return internal tables, some of them quite large. It always worried me the idea that, since it’s being passed by value, ABAP would be returning a copy of the internal table, impacting both performance and the program’s used memory.

Fortunately, I recently learned that this is not​ a problem.

<!--more-->

[In this SCN thread][1] a user starts by asking about this but ends up testing it himself using the debugger and finds out that, when an internal table is returned by value, SAP doesn’t make a copy (as if it is returned by reference) until the table’s content is changed. In that moment SAP automatically makes a copy and changes de new copy leaving the original intact. It’s the best of both worlds.

Later in the thread, another user who seems to belong to SAP explains that this mechanism has a name. It’s called _table sharing_.

So, it’s efficient and safe to pass internal tables by value. Good to know. If you worried about this in the past you can now relax. If this idea had never crossed your mind then you now know that you don’t even have to worry about it.

Greetings from Abapinho.

   [1]: https://scn.sap.com/thread/280115
