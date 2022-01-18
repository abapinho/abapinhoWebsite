---
title: 'SORTED instead of STANDARD in the cache tables '
slug: sorted-em-vez-de-standard
date: 2013-04-01 16:11:22
tags: [performance]
categories: [dicas]
wordpressId: 2214
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Some time ago [ I wrote a post here][1] showing the advantages of using internal tables with defined indexes instead of simple STANDARD tables.

Confession: that habit is so ingrained that since then, almost all the internal tables I have created have continued to be STANDARD TABLE.

It’s very common to create internal tables to cache data that I know I'll often use inside LOOPS to avoid having to SELECT SINGLES inside them.

Here is a hint: whenever you create an internal table filled with cache data, that you only write once but read many times, instead of STANDARD, consider creating it as SORTED and set it up properly with a key. It is worth it.

Now that I have confessed, I hope to be absolved and offer to change myself.

Greetings from Abapinho.

   [1]: https://abapinho.com/en/2011/05/corrida-de-tabelas/ (Partida… lagarta… fugida!)
