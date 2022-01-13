---
title: 'Debugging an infinite loop already in execution'
slug: fazer-debug-a-um-ciclo-infinito-ja-em-execucao
date: 2015-03-02 09:00:22
tags: [debug]
categories: [dicas]
wordpressId: 3008
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Imagine you have a program executing an infinite cycle or, at least, a cycle with 70x7 iterations. It is neverending, and you want to know what’s going on there.

In the past you had to go to SM50, select the process and choose from the menu "Administration | Program | Debug".

But now there is a much easier way.

<!--more-->

First you have to configure debugging so that the _break-points_ are immediately active:

![depuracao_configuracao][1]

Then, simply go to SE38/SE24, to the program code that is running, and put a _break-point_ in the middle of the cycle. The program that’s running will immediately stop in debug mode the next time it gets there.

So simple, it almost seems like Java.

Thanks to Vítor Pinheiro for the tip.

Greetings from Abapinho.

   [1]: images/depuracao_configuracao.png
