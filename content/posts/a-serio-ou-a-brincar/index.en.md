---
title: 'Are you serious or just joking?'
slug: a-serio-ou-a-brincar
date: 2012-10-08 09:00:16
tags: []
categories: [dicas]
wordpressId: 1994
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Some things can only happen in production.
While with some others it's quite the opposite.

<!--more-->

For instance, it’s not unusual for a program to send emails to customers or users. However, during tests, it’s not desirable to have these emails sent to them.

There's a simple way to check if we are in a productive system: using function module PRGN_CHECK_SYSTEM_PRODUCTIVE.

If you look at the code you'll see that this function is just checking if flag T000-CCCATEGORY = 'P'.

Note: it's important to confirm if everything in your system is well defined: in DEV and QAS the flag should not be equal to P. For example, in the project I’m working right now this doesn't works because QAS is directly copied from PRD the P stays there.

Thank you [NASA Goddard][1] for the photo.

Greetings from Abapinho.

   [1]: http://www.flickr.com/photos/nasamarshall/6956818526
