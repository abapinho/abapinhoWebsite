---
title: 'Automatic model just using CTRL-SPACE '
slug: modelo-automatico-so-com-ctrl-space
date: 2014-09-22 09:00:04
tags: [sapgui]
categories: [dicas]
wordpressId: 2891
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Of course you already know the "Model" button in the ABAP editor that allows you to automatically add models for function modules, calls for methods and others.

The new editor has now grown a bit (it’s now only 10 years behind Eclipse instead of 20) and it allows you to automatically complete some commands through the CTRL-SPACE shortcut.

<!--more-->

You probably already use this feature to avoid having to write the full name of commands or variables in a programme. Here I will show you that the little thing is even smarter than it looks. Check this out.

First declare an instance of any class and write the variable’s name with a pointer to a method:

[![pattern1][1]][1]

The cursor’s now at the end of the line after the pointer, right? Now do CTRL-SPACE:

[![pattern2][2]][2]

A list of class methods appears. Cool. But not ground-breaking. Choose one and press ENTER. Then do CTRL-SPACE for the second time:

[![pattern3][3]][3]

The method you already have then appears. At first glance it seems pointless. But now try ENTER again:

[![pattern4][4]][4]

And the method’s interface appears. The work is all done for you. It’s a great help, isn’t it?

Thanks to Micael Reis for the tip.

Thanks to Ben Sutherland for the [photo][5].

Greetings from Abapinho.

   [1]: images/pattern1.png
   [2]: images/pattern2.png
   [3]: images/pattern3.png
   [4]: images/pattern4.png
   [5]: https://www.flickr.com/photos/bensutherland/5587949321/in/photolist-9vMGDP-eDCTs-4FzBKd-2dpra-aViSN8-7jR3G8-2dTZyY-dpTvFq-q9ort-5e914x-8D678y-9xhJFn-5e8Zw6-8udEMa-8udEQa-9xhJZk-9xkJ23-9xhJLp-6RsN15-bUzaG-2UMLve-dB6Bv1-7zjGac-eCYtv6-eCYrfH-eD5xLU-e6cYWu-4A6dyX-7osvBs-7orBcT-eabkR9-cZVtBE-8D678N-8D678J-9vQJxJ-8ugL4d-8ugKZ1-bUzfV-df6gvt-df6haj-df6gJK-44LjvV-oxYQA7-eD5yuS-eD5wCm-eD5vVG-eD5vpS-7ooAQ4-7ooBov-a7p824
