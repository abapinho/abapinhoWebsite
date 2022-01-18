---
title: 'DELETE vs CLEAR vs REFRESH vs FREE'
slug: delete-vs-clear-vs-refresh-vs-free
date: 2015-07-27 09:00:01
tags: [estilo, performance]
categories: [artigos]
wordpressId: 3169
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
DELETE
CLEAR
REFRESH
FREE

These are different ways of deleting all data from an internal table. They look the same. But they aren't.

<!--more-->

The following image shows the memory analysis of 4 internal tables with the exact same data. Their names are suggestive of what will happen to them. If you don't get it call a friend who doesn't know ABAP and ask for help:

[![delete_refresh_clear_free_antes][1]][1]

Now look at the result after each of the above commands were applied:

[![delete_refresh_clear_free_depois][2]][2]

As you can see, only FREE got rid of the whole allocated memory. CLEAR and REFRESH still managed to release a good part of it. But DELETE didn't even try.

Judging by this, it looks like FREE is the one to choose when you want to get rid of an internal table's data, at least in the cases where you won't be needing it again.

Thank you Fábio Branquinho for the tip.

Thank you Aaron Webb for the [photo][3].

Greetings from Abapinho.

   [1]: images/delete_refresh_clear_free_antes.png
   [2]: images/delete_refresh_clear_free_depois.png
   [3]: https://www.flickr.com/photos/aaronw79/7811953832
