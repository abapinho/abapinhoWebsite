---
title: 'Disable value history for a single field'
slug: inibe-o-historico-de-valores-para-um-so-campo
date: 2016-02-08 09:00:08
tags: [sapgui, secret]
categories: [dicas]
wordpressId: 3415
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['value history']
---
SapGUI usually keeps a history of the last values entered on each field. This is usually a good thing. But you may very well not want it to happen (in case you're entering pornographic values in a specific field for example). You could always turn it off globally in the SapGUI settings.

But what if you just want to disable it in one particular field? Abapinho tells you how to do it.

<!--more-->

Do a CTRL-click on that field. You'll get a context menu. But since you pressed CTRL, besides the options normally associated with that field you'll get some extra ones. Among those there are three related to the value history:

![disable_history][1]

Pick "Disable history" and from now on this field stops showing the value history. You can now safely enter those porn values.

Greetings from Abapinho.

   [1]: images/disable_history.png
