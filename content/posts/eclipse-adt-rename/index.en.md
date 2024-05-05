---
slug: eclipse-adt-rename
title: Rename a lot of things automatically in Eclipse ADT
description: Rename a lot of things automatically in Eclipse ADT
date: 2024-05-06T09:00:00+01:00
tags: []
categories: []
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

Those who still programme monolithically probably don't feel the need for this. But anyone who uses multiple classes with multiple methods knows that it's normal (and even desirable) to change your mind about the name of these things. Ideas aren't born ready-made in our heads.  Ideally, code is mouldable and can be shaped until we find the desired form.

<!--more-->

## In SAPGUI

SAPGUI doesn't allow you to rename almost anything. You can make a copy with the new name, then manually change all the places that refer to it and finally delete the old one. Not only is this labour-intensive, it's also dangerous. It's not something I'll want to do often.

In SAPGUI, code is like plaster. It dries quickly and once it's dry, it breaks if you try to mess with it.

## In Eclipse ADT

Classes, methods, parameters and variables can be renamed completely automatically. Eclipse automatically finds and renames all references to them. You have the option of reviewing the changes that will be made, but typically you don't need to because it just works. Once the name has been renamed, all the objects involved are activated. It could be better because unfortunately it's not yet possible to rename DDIC objects such as data elements, tables and so on. But even without this, it's still great.

In Eclipse ADT, code is like plasticine. You can change your mind at any time and give it a new shape.

This functionality is, for me, reason enough to opt for Eclipse ADT instead of SAPGUI. I use it daily, several times a day. Thank you Eclipse ADT for it.

## Conclusion

So, if you're still using SAPGUI and you could be using Eclipse ADT, you're not the sharpest tool in the shed, are you?

Thank you for the [photo][1].

Greetings from Abapinho.

[1]: <https://pngimg.com/image/48754>
