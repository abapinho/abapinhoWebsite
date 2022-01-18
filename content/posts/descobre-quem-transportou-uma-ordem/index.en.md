---
title: 'Find out who transported a request'
slug: descobre-quem-transportou-uma-ordem
date: 2014-07-07 08:30:15
tags: [sysadmin]
categories: [dicas]
wordpressId: 2825
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
The other day, a series of things crashed in our test machine. All of a sudden, no one could work on it. We found a series of transport requests improperly transported to STMS. The user who appears to be associated with each of these requests is its owner. But is it the owner’s fault? Didn’t someone else do the transport?

How can we find out?

<!--more-->

You are in STMS.
You choose the queue of the desired target system
Menu > Go to > Import History
Menu > Process > Display more

A few more columns appear on the list. The “User” column tells you who imported the request.

This is how I figured out who did it, and where to point the finger.

Thanks to Nuno Morais for the tip.
And thanks to Jiuck for the [photo][1].

Greetings from Abapinho.

   [1]: “https://www.flickr.com/photos/jiuck/7758480164”
