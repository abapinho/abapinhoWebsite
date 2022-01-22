---
title: 'If a stranger offers you values, this is Input'
slug: call-selection-screen
date: 2012-01-23 10:00:08
tags: [ui]
categories: [dicas]
wordpressId: 1356
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
In a report, the values are normally requested from the user at the first selection screen before the program is run. But what if you want to interactively ask for more values in the middle of running the program?

<!--more-->

One way to do this is to create a screen with the desired fields and then call it with CALL SCREEN. But designing the screen and setting the PAI and PBO is a real drudge.

Another solution is to use the POPUP_GET_VALUES or POPUP_GET_VALUES_DB_CHECKED functions. They are quite versatile yet still quite annoying to use and they have some limitations.

But there is an easier way to do it. It can be done using CALL SELECTION-SCREEN. Let me explain:

First of all we must set the selection screen. Its definition is almost identical to the start selection screen of a report:


{{< highlight ABAP >}}
TABLES: t001.

SELECTION-SCREEN BEGIN OF <b>SCREEN 3000</b>.
PARAMETERS: p_uname TYPE syuname.
SELECT-OPTIONS: p_bukrs FOR t001-bukrs.
SELECTION-SCREEN END OF <b>SCREEN 3000</b>.
{{< /highlight >}}

Then, wherever you want to call the screen you just have to ... call the screen:


{{< highlight ABAP >}}
START-OF-SELECTION.

* whatever goes before

  <b>CALL SELECTION-SCREEN 3000 STARTING AT 5 5.</b>

* whatever goes after
{{< /highlight >}}

And it results in this:

![CALL SELECTION-SCREEN][1]

If you insert STARTING AT it will create a modal dialogue box. If you don’t add anything the screen will occupy the full window. The selection screen can be as complicated as you like, and it may have tabs and what not. Moreover, because SAP views it as just a selection screen like any other, you can save variants and the like.

Note that this approach can also be used with transactions. The only downside is that it requires F8 instead of ENTER to submit the values.

_Thanks to[cristinacosta][2] for the photo._

Greetings from Abapinho.

   [1]: images/call-selection-screen.png (CALL SELECTION-SCREEN)
   [2]: https://www.flickr.com/photos/cristinacosta/4304968451/
