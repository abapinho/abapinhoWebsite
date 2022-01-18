---
title: 'Not even David Copperfield would do better'
slug: call-transaction
date: 2011-04-21 11:26:14
tags: [segredo]
categories: [dicas]
wordpressId: 722
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Sometimes we want to access a transaction and we don’t have permission. That’s annoying. Luckily there’s the function module **ALINK_CALL_TRANSACTION** which makes things better. But use it with care or someone will get angry. Welcome to the dark side of Abapinho. If they say it was me that said it, I deny everything.

Update: this function module will also do the trick: CALL_TRANSACTION_FROM_TABLE.

New update: if all the above fail try this other function module: RS_HDSYS_CALL_TC_VARIANT (clearing flag AUTHORITY_CHECK).

Greetings from Abapinho

_(thank you[Bohman][1] for the photo)_

   [1]: http://www.flickr.com/photos/bohman/210977249/
