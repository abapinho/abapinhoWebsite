---
title: 'Close the frozen window'
slug: fecha-a-janela-encalhada
date: 2014-03-03 17:30:56
tags: [debug, sapgui]
categories: [dicas]
wordpressId: 2610
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
How many times have you been left with a “hanging” window when you end a debug?

<!--more-->

In other words, you have launched your program in debugging mode, you have analysed what you had to analyse and, when the program ends, the original (session 1) window displays the results; but the debug (session 2) window is still hanging there, and the only way you can get rid of it is to exit the session 1 transaction you’re in.

Annoying.

But there’s a solution: to get rid of the debugging session, simply type "/hx" in the startup window. And that’s it… just close the frozen window and avoid a nuisance!

You can be even more astute and preconfigure this option in the debugger settings: When you are in debugging mode, activate the following option in the menu:

Settings > Change Debugger Profile/Settings > Close Debugger After 'Continue'(F8) and Roll Area End

Now, this occurs due to the two-process architecture of the new ABAP debugger. You can find out more about this and other details of the new debugger [here][1].

Greetings from Sérgio Fraga.

Abapinho thanks Sérgio Fraga.

   [1]: https://archive.sap.com/kmuuid2/cd12d590-0201-0010-80a6-c3cafeb636ed/The%20New%20ABAP%20Debugger%20-%20An%20Introduction.pdf
