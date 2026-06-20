---
slug: quem-lancou-a-excepcao
title: Who triggered the exception?
description: You know who caught it, but do you know who raised it?
date: 2026-06-22T09:00:00+01:00
tags: [segredos]
categories: [dicas]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Exceptions can be passed back, method by method, bubbling up, and caught by a method that has nothing to do with the one that raised it. And how will you find it?

<!--more-->
Both SAPGUI and Eclipse have a little button for this exact purpose. The function is called "Display trigger exception". You click it, and it shows you exactly where in the code the exception was raised.

![Display trigger exception][1]

That's it! But it’s no small thing. Before I knew about this feature, it could take me ages to find the right spot.

Greetings from Abapinho.

[1]: images/display-trigger-exception.png
