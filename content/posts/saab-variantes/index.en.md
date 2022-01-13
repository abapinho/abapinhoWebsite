---
title: 'SAAB activation variants'
slug: saab-variantes
date: 2019-07-25 09:00:00
tags: [debug]
categories: [dicas]
wordpressId: 4228
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Some time ago we spoke about SAAB and its advantages as a tool to analyse, debug and find problems in our code. In that article we didn't explore an important aspect of it: Activation variants.

<!--more-->

A given project may be crowded with BREAK-POINTs, LOG-POINTs and ASSERTs, making it overwhelming to analyse if we are to activate them all. But, if we already have an idea of where our problem may be, we can create an activation variant listing only the objects we intend to analyse. Just like in transaction SAT, these activation varants can be local (only visible to the current user) or global (visible to everyone in that system). Global variants must start with Z or Y like any other custom object.

Once we have created and populated or variant, it can be activated at any moment and in any system using SAAB itself. It will be active for a given period of time or a specific date.

[![SAAB activation variant][1]][1]

Thank you [Diane Duane][2] for the [photo][3].

Greetings from Abapinho.

   [1]: images/saab_variant.png
   [2]: https://visualhunt.co/a2/e383ba
   [3]: https://visualhunt.com/re4/768a8c03
