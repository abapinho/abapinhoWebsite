---
title: 'Thou shalt avoid global variables'
slug: evitaras-variaveis-globais
date: 2015-04-13 09:00:36
tags: [estilo]
categories: [boaspracticas]
wordpressId: 2719
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
The more global variables a program has, the most obscure it becomes. Please avoid them. This is a basic rule of good programming and should always be followed. Even if several variables have to be passed by parameter, it takes slightly more effort but yields a much more readable and safer code.
Exceptions can be made for simple reports which run around a single internal table, which can be declared globally without compromising clarity.
