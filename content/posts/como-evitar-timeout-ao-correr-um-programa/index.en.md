---
title: 'How to avoid timeout when running a program'
slug: como-evitar-timeout-ao-correr-um-programa
date: 2015-11-02 09:00:52
tags: [sapgui, segredo]
categories: [dicas]
wordpressId: 3252
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Usually SAP systems have a predefined time limit for running a program interactively. If the program takes longer to run than that you'll get a runtime execution error. A dump.

<!--more-->

If you know that your program may risk taking longer than what's allowed you can use the function module TH_REDISPATCH to reset the timeout timer. You just have to make sure your program will execute this function module every once in a while.

An old trick involved using the progress indicator (FM SAPGUI_PROGRESS_INDICATOR) but I've heard it stopped having this side effect.

Thank you André Silva for the tip.

Greetings from Abapinho.
