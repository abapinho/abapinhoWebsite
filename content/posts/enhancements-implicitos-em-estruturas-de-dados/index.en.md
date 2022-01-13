---
title: 'Implicit enhancements in data structures'
slug: enhancements-implicitos-em-estruturas-de-dados
date: 2019-05-13 09:00:00
tags: [enhancements, segredo]
categories: [dicas]
wordpressId: 4199
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
We have all used implicit enhancements to add code to the beginning or end of a standard function, form or method. But you may not know that it can also be used to add fields to data structures, whether they're declared as TYPES or directly as DATA.

<!--more-->

It works exactly in the same way. Here's an example:

[![Enhancement implícito em estrutura de dados][1]][1]

I know you'll probably never need an enhancement in a Z program but, well, this is just an example for you to see how it looks.

But there is a trick. If you look carefully you'll find that there is something peculiar about the code in the enhancement. The code in the enhancement is actually a separate file which is compiled by itself. So, in order for this to compile, you need to explicitly start with TYPES or DATA, as you can see in the example above.

The words in red make it obvious that the editor doesn't really know how to handle this. But it works and that's what matters.

Greetings from Abapinho.

   [1]: images/implicit_enhancement_type.jpg
