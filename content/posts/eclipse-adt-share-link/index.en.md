---
slug: eclipse-adt-share-link
title: In Eclipse ADT you can share links to your code
description: In Eclipse ADT you can share links to your code
date: 2024-05-20T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [eclipse link]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Until recently, ABAP has never been one for big collaborations.

<!--more-->

## In SAPGUI

There are no external links in SAPGUI. If you want to tell someone to look at a method you've made, you give them the name of the class, the name of the method and eventually the line number, and they have to navigate there manually. It's sad.

## In Eclipse ADT

At any point in the code, press the right button and choose the option _Share link for selection_. A pop-up appears with two options: ADT link or web link. The ADT link is an Eclipse ADT-specific link and can be opened with `CTRL-ALT-O`. The web link is an HTTP url. Anyone who clicks on it immediately sees your code in their browser (as long as they have permissions, of course) and can then click on a button there to open it in Eclipse ADT. Very practical.

## Conclusion

In our project we're always sharing links with each other. It's very handy.

So, if you're still using SAPGUI and you could be using Eclipse ADT, you're not the sharpest tool in the shed, are you?

Greetings from Abapinho.
