---
title: 'Undo in debugger layout'
slug: debugger-layout-undo
date: 2016-05-02 09:00:56
tags: [debug]
categories: [dicas]
wordpressId: 3525
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Although a substantial part of an ABAP programmer time is spent debugging code, most programmers I know don't invest much in getting to know the ABAP debugger. Maybe because they spent too many years working with its previous version which was truly archaic and worthless. But the new one can do much more than you usually ask of it. And Abapinho intends to teach you how.

Today I'll teach you just a simple key.

<!--more-->

When you change the debugger's screen layout, by adding a view, switching the view position, etc., you can easily undo that change just by pressing F3. No, it does't take you out of the debugger back to where you were before. Instead it works pretty much like a layout undo.

For example, let's say you have two side-by-side views:
[![debug1][1]][1]

And you decide to close the ABAP stack on the right so that you can have a clearer view of your code:
Decides fechar a janela direita com a Pilha ABAP para veres melhor o código:
[![debug2][2]][2]

But now you need the stack again. Just press F3 and it will show up again (I won't show an image because it's just like the first one, you'll have to trust me).

Thank you Sérgio Fraga for the tip.

Greetings from Abapinho.

   [1]: images/debug1.png
   [2]: images/debug2.png
