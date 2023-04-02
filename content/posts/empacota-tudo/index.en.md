---
slug: empacota-tudo
title: I package everything that moves
description: Each development should be in its own package
date: 2023-04-03T09:00:00+01:00
tags: []
categories: [artigos]
keywords: [pacotes]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

I obsessively package everything that moves.

<!--more-->

If I'm doing a development from scratch it's obvious that the first thing to do is create an encapsulated package dedicated to it.

But whenever I make a change to an existing development, however small, I also try to package it.

## What I do

1. I create a package named after the development (respecting naming conventions)
2. I put it as a sub-package of the package where the development currently is
3. I move to the new package all the objects that belong to that development (programs, includes, classes, function groups, transactions, DDIC objects, etc)
4. If _ABAP Package Concept_ is enabled on the system, I use the _Package Check_ tool to help me find other less obvious objects and check if some are shared with other developments.
5. Only now, with the development packaged, do I implement the necessary change.

## ZERO risk

- Moving objects from one package to another has no risk;
- If I forget to move any object to the new package, there are no consequences;
- If any of the moved objects are used by another development, there is no problem either.

By doing this I know I'm leaving the system slightly more organised than I found it.

Greetings from Abapinho
