---
title: 'SE16H - Aggregate data without using Excel '
slug: se16h-agrega-dados-sem-precisares-do-excel
date: 2015-10-12 09:00:57
tags: [database, segredo]
categories: [dicas]
wordpressId: 3258
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
A long time ago transaction SE17 was used to look at database tables content.
They quickly felt ashamed and decided to improve it, creating SE16.
When ALV was invented, SE16N was released (although until today many people still use SE16, go figure!).

Today I present you SE16H.

<!--more-->

SE16H will not replace SE16N but it can do some things which SE16N can't. One of them is data aggregation. Do you remember all those times you had to export data from SE16N to an Excel to build a pivot table? Then learn this:

Run SE16H, choose table BKPF and then, in the line of field GJAHR set the column "Group":

[![SE16H-1][1]][1]

Press F8 and you'll get something like this:

[![SE16H-2][2]][2]

Soon I'll try to publish an article showing how to use SE16H to build an _inner join_ as requested by Fabio Pagoti.

Thank you Sérgio Fraga for the tip.

Thank you Michael Kötter for the [photo][3]

Greetings from Abapinho.

   [1]: images/SE16H-1.png
   [2]: images/SE16H-2.png
   [3]: https://www.flickr.com/photos/cmdrcord/6973087271
