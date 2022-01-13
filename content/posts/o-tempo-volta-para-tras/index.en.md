---
title: 'Oh time turn back'
slug: o-tempo-volta-para-tras
date: 2012-04-02 10:00:08
tags: [debug, segredo]
categories: [dicas]
wordpressId: 1583
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
“Oh time turn back
Give me everything I have lost
Take pity and give me the life
The life I have already lived
Oh time turn backward
Kill off my futile hopes
Look how even the sun itself
Returns every morning” – António Mourão

Hey [Tony][1], right away. I will show you how you can turn back time.

<!--more-->

There you are quite happily carrying out your debug session and you accidentally go too far. You wanted to change a parameter before calling a function, for instance. But you got distracted. Without the power to travel back in time, the only solution would be to start the debug from the beginning, which can be painful.

Here is the tragic scenario. You skipped the function without altering the variable:

[![][2]][3]

To save the situation, right-click on the line above the one you wish to return to and select “Go to instruction” from the menu:

[![][4]][5]

Once that is done the debugger goes back in time without causing a fuss:

[![][6]][7]

And you can get back to work without having to sing that fado song all the way through.

Thanks to Sérgio Fraga for the tip.

Greetings from Abapinho.

   [1]: https://www.youtube.com/watch?v=LOtAfLvhSZo
   [2]: images/otempovoltaparatras11.png (Debug demasiado à frente)
   [3]: images/otempovoltaparatras11.png
   [4]: images/otempovoltaparatras2.png (Pedir para viajar no tempo)
   [5]: images/otempovoltaparatras2.png
   [6]: images/otempovoltaparatras3.png (Voltámos atrás no tempo)
   [7]: images/otempovoltaparatras3.png
