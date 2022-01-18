---
title: 'Limitar execução em background ou foreground'
slug: limitar-execucao-em-background-ou-foreground
date: 2015-11-30 09:00:36
tags: [segredo]
categories: [dicas]
wordpressId: 3325
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
You've developed a report which you know will take over 12 hours to run. So you don't want anyone to try to run it in foreground. I'll show you a way to make sure it doesn't happen.

<!--more-->


{{< highlight ABAP >}}
REPORT zbackground.

* This is the magical include
INCLUDE rsdbc1xx.

* Selection screen
PARAMETERS: p_voto TYPE c.

* Magical event
AT SELECTION-SCREEN OUTPUT.
  APPEND 'ONLI' TO current_scr-excl. " Execute
  APPEND 'PRIN' TO current_scr-excl. " Execute + print
  APPEND 'SJOB' TO current_scr-excl. " Execute in background
{{< /highlight >}}

You have 3 options: ONLI, PRIN and SJOB. Each one corresponds to one of the 3 possible execution modes available in the "Program" menu. When you add one of them to table CURRENT_SCR-EXCL that option will become disabled in the menu and removed from the toolbar.

It's that simple.

There is another way of achieving this which is quite similar but uses FM RS_SET_SELSCREEN_STATUS instead of declaring the include and adding the values to that internal table. If the approach shown above doesn't work please try te function.

Thank you Víctor Villamarín for the [photo][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/amobetv/16587305159
