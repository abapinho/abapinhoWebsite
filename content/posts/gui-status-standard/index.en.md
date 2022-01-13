---
title: 'Use a Standadrd GUI status without copying it'
slug: gui-status-standard
date: 2016-11-28 09:00:02
tags: [alv]
categories: [dicas]
wordpressId: 3667
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
When you want to use CL_GUI_ALV_GRID in a CONTAINER you must copy a standard Status GUI from another program. For example, the GUI Status "STANDARD" of the function group SALV. And then, in the screen's PAI you do:

SET PF-STATUS 'STANDARD'.

And thus the little standard buttons show up on your screen.

<!--more-->

But if you do not need to change anything in the GUI Status, which turns out to be quite common, there is a more practical way of doing this without having to copy the GUI Status STANDARD to your function group or program:

SET PF-STATUS 'STANDARD' OF PROGRAM 'SAPLSALV'.

Where SAPLSALV is the name of the program in the function group SALV.

It's a simple tip, but it comes from the heart.

Thank you, Nuno Morais, for the tip.

Abapinho greets you.
