---
title: 'Debugging with baby steps'
slug: debugging-with-baby-steps
date: 2016-04-25 09:00:50
tags: [debug]
categories: [dicas]
wordpressId: 3511
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When you debug you use F5 key to move to the next statement (or go inside a sub-routine). But imagine an IF with multiple conditions:


{{< highlight ABAP >}}
IF A = 1 AND B = 2 AND C = 3.
  WRITE 'I like the word glauc'.
ENDIF.
{{< /highlight >}}

When you debug through that IF using F5 and one of the expressions is false you'll step out of the IF without knowing which of the three was false.

But the new debugger has a new very neat functionality which can help you to better understand what happened there.

<!--more-->

It's called "step size" and allows you to change the way the debug moves forward. You can switch between moving one statement at a time as you've always done or moving horizontally one expression at a time. This allows you to easily find out which of the three expressions failed.

![stepsize][1]

Thank you Sérgio Fraga for the tip.

Photo: [Denise P.S.][2] via [VisualHunt][3] / [CC BY-ND][4]

Greetings from Abapinho.

   [1]: images/stepsize.png
   [2]: https://www.flickr.com/photos/runnever/5542838628/
   [3]: https://visualhunt.com
   [4]: https://creativecommons.org/licenses/by-nd/2.0/
