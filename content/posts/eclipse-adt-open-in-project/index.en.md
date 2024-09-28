---
slug: eclipse-adt-open-in-project
title: In Eclipse ADT you can open an object in another client
description: eclipse-adt-open-in-project
date: 2024-10-07T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse Open in project]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Historically, it has always been impossible to jump from one SAP system to another without losing context. Now it's possible.

<!--more-->

## In SAPGUI

You've happily developed a beautiful little program in the development client, which is 100. Now you want to test it with a _break-point_ on the line you're on in the editor, but the client that has test data is 200. What do you do? Yo go to SAPLogon, open a new session in client 200 on the same server, open SE24, navigate to the class you were in, navigate to the line you want and activate a _break-point_ on it.

## In Eclipse ADT

You're happily editing the class, just right-click and choose _Open in project..._ and select 200. A new tab appears for the class but now in client 200 and already with the _break-point_ on the desired line because you had already done the same yesterday and it's still there.

## Conclusion

So, if you're still using SAPGUI and you could be using Eclipse ADT, you're not the sharpest tool in the shed, are you?

Greetings from Abapinho.
