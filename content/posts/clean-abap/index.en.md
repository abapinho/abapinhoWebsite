---
title: 'Clean ABAP'
slug: clean-abap
date: 2020-05-13 12:54:21
tags: [estilo, oo]
categories: [dicas]
wordpressId: 4473
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['Clean ABAP']
description: 'A SAP criou um guia de boas prácticas inspirado no Clean Code do Robert Martin onde explica exaustivamente qual a melhor forma de programar em ABAP OO. '
---
For many years, when confronted with ABAP OO, most ABAPers I talked to, acknowledged that OO is great for most languages but never saw any real advantage in adopting it for ABAP. So they carry on using FORMs, INCLUDEs and CALL FUNCTIONs. The standard SAP code sets the example by trying to make something work while breaking every possible programming best practice.

<!--more-->

ABAP OO has many advantages. But, against all evidences, most people still use classic ABAP. Or create a single class with dozens of static methods, which is somewhat better (allowing for a more decent encapsulation and proper OO exceptions) but not OO at all.

And yet, it is very very easy to screw up with OO. Moving from classic ABAP to ABAP OO requires a radical paradigm shift. Besides, most of the OO programming techniques I learned in College 20 years ago are now obsolete (ex.: composition over inheritance). OO best practices have evolved greatly. My favorite reference is [Robert Martin's Clear Code][1].

But suddenly SAP does this: <https://github.com/SAP/styleguides>.

SAP is not what it used to be. This repository is a very complete ABAP styling guide. They call it Clean ABAP to make it explicit that it follows the _Clean Code_ principles. It is an exemplary guide which is constantly evolving and to which anyone can contribute. Every ABAPer should take the time to read through this guide. I learn something new every time I visit it.

And if you still don't use ABAP OO, reading it should probably be enough to convince you to give it a try.

Greetings from Abapinho.

   [1]: https://www.goodreads.com/book/show/3735293-clean-code
