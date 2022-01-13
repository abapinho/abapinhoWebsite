---
title: 'Is the GUI available?'
slug: o-gui-esta-disponivel
date: 2015-11-09 09:00:41
tags: [sapgui]
categories: [dicas]
wordpressId: 3232
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
To check if a program is running in background usually one takes a peek at SY-BATCH. SY-BINPT can also be used to check if the background program is a BDC session. You usually check one of these.

There is a similar but not exactly equal question, though. How do you ask if the GUI is available? Most times both questions will have the same answer. But not always.

It's like saying the Sun can be seen during the day while the Moon can be seen during the night. If the sky is cloudy you won't be seeing them.

<!--more-->

Moving forward.

The answer to this peculiar question can be given by this function module:


{{< highlight ABAP >}}
  CALL FUNCTION 'GUI_IS_AVAILABLE' 
   IMPORTING
     RETURN        = is_gui_available.
{{< /highlight >}}

You can also use this method (which makes use of GUI_IS_AVAILABLE (and does some more stuff (but I will not waste your time explaining nor mine trying to understand it))):


{{< highlight ABAP >}}
is_offline = CL_GUI_ALV_GRID=>OFFLINE().
{{< /highlight >}}

Since this post is about the GUI, I picked the photo of a random celebrity called Guilherme. I felt like a good choice.

Greetings from Abapinho.
