---
title: 'Hold on… but not yet'
slug: para-la-mas-nao-ja
date: 2014-02-03 09:00:56
tags: [debug]
categories: [dicas]
wordpressId: 2516
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
You are doing a LOOP AT in a 1000-line table, and you know that you want line 853. Until recently, you had two options: either hit F8 852 times, running the risk of hitting it 853 times and having to start all over again, or create a _watchpoint_ with the condition SY-TABIX = 852 or something close, and pray that it worked.

Now you have a third option.

<!--more-->

This alternative is much easier, and infallible. Now, you can configure a normal break-point to stop only after “x” number of occurrences. In the debugger, under the tab "Ptos.par./watchpts", there is a column called "Ignore (number)" which defines the number of times that the _break-point_ is skipped before stopping.

[![break-point-skip][1]][1]

And if you look right next to it, there is a column to create conditions. If you use these, you no longer have to use _watchpoints_. I never really liked them.

Another big advantage o fusing this new technique instead of the old watchpoints is that the old ones didn't allow for field-symbols in the conditions. And the new ones do. Great!

Thanks to Sérgio Fraga for the tip.

And thanks to Dirk Knight for the [photo][2].

Greetings from Abapinho.

   [1]: images/break-point-skip.jpg
   [2]: “http://www.flickr.com/photos/dkshots/5331436372”
