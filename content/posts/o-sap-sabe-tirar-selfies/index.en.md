---
title: 'SAP can take selfies!'
slug: o-sap-sabe-tirar-selfies
date: 2015-12-28 09:00:35
tags: [sapgui, segredo]
categories: [dicas]
wordpressId: 3352
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
I just found out that SAP can take selfies. I still don't see why one would need it. But that's understandable because I never really understood the need for selfies anyway.

Here's how SAP can take a selfie:

<!--more-->


{{< highlight ABAP >}}

CL_GUI_FRONTEND_SERVICES=>GET_SCREENSHOT().

{{< /highlight >}}

Smile!

Greetings from Abapinho.
