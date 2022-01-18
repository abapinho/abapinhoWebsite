---
title: 'QUICKINFO: tip on how to give tips. '
slug: quickinfo
date: 2013-06-03 09:00:46
tags: [ui]
categories: [dicas]
wordpressId: 2298
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
In my opinion, this tip has arrived a few years too late, as it is now rare to use the WRITE command to directly write things to the screen. Therefore, we can say it's a retro tip. A _vintage_ tip. But let's assume we are still in the twentieth century grappling with ABAP’s most Baroque command, WRITE.

Then, imagine yourself sitting in front of SAP, listening to Pearl Jam, wearing black headphones and writing WRITEs of a series of values on the screen, which you would like the user to have more information on. But you don’t have room on the screen to give that information. SAP thought of this:


{{< highlight ABAP >}}
WRITE: sy-datum QUICKINFO 'Today’s date'.
{{< /highlight >}}

When you run the program it doesn’t seem to make any difference, but when you stop the mouse on the value a small square appears with the additional text. Very much like _tooltips_ in HTML:

![quickinfo][1]

You can also use it to leave secret messages for users. Or to do treasure hunts.

It would have been good to know this in those days when it could have been useful.

Thanks to See-ming Lee for the [photo][2].

Greetings from Abapinho.

   [1]: images/quickinfo.jpg
   [2]: http://www.flickr.com/photos/seeminglee/3929959851/
