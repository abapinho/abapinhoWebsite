---
title: 'Unlocking objects in a transport request'
slug: desbloquear-objectos-numa-ordem-de-transporte
date: 2014-08-25 09:00:26
tags: [sysadmin]
categories: [dicas]
wordpressId: 2877
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
When you touch an object and add it to a transport request, it becomes locked there by default. In a transport request you can also lock objects which are not yet locked in another order. But, once locked, how to unlock them?

<!--more-->

Through transaction SE03.

Choose option “Unlock objects” and then entre the transport request or task which contains the objects to be unlocked. And bang, F8!

Note that if you enter the transport request, this tool will not unlock the objects on its tasks, only the ones found at the transport request level.

When you then go to SE01, you’ll find that the objects of the request/task are unlocked and can now, for example, be locked in another request.

Thank you Nuno Morais for the well-timed tip.

Greetings from Abapinho.
