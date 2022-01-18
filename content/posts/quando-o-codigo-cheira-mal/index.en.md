---
title: 'When code smells'
slug: quando-o-codigo-cheira-mal
date: 2019-02-25 09:00:12
tags: [estilo]
categories: [artigos]
wordpressId: 4171
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['código mal cheiroso']
description: 'É frequente ao programar sentir um cheiro desagradável. Inicialmente não consigo identificá-lo. À medida que vou cheirando vou percebendo de onde vem.'
---
It happens very often that, while programming, I smell something strange. It's usually hard to identify it right away. It usually starts like a faint fragrance. But, as I become more aware of it, eventually it starts stinking and I understand where it comes from. Even then it is not immediately clear why that particular thing smells bad.

<!--more-->

My experience tells me this works in 5 steps:

  1. I can smell something but I don't know here it comes from;

  2. I identify where it comes from but I don't know why;

  3. I understand the reason that thing stinks but I don't know how to stop it. And I don't want to make it go away by just pouring perfume all over it;

  4. I figure out what I need to change in order for the bad smell to go away;

  5. I change the code and everything is pleasant again. And I have a blissful feeling of relief all over my body.

Most times bad smells are a consequence of something incorrect at design level. Due to this, the solution will often require code refactoring in order to correct its design. It is also not uncommon that the solution for a code smell to suddenly appear out of the blue as a consequence of an unrelated refactoring which finally reveals the reason for that smell.

A good programmer must have a sharp nose. But he must also have the will to make whatever is possible for the code he's working on to always smell good. A bad programmer will just get used to living in a smelly environment.

The term "[code smell][1]" was coined by Kent Beck, one of the original participants in the Agile manifesto, the creator of _Extreme Programming_ and one of the fathers of _Test Driven Development_. All these methodologies are his attempts at minimizing potential code smells.

Particularly popular in the _Agile_ world, this metaphor is so good that it should be adopted by all programming environments. Particularly in the ones that smell worse.

Greetings from Abapinho.

   [1]: https://en.wikipedia.org/wiki/Code_smell
