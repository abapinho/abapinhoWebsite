---
slug: cdss-viram-esparguete
title: CDSs tend to become spaghetti
description: CDSs tend to become spaghetti
date: 2026-10-19T09:00:00+01:00
tags: [CDS]
categories: [artigos]
keywords: []
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---
I know everyone loves CDSs and that it’s a sin to speak ill of them, but please let me get this off my chest.
<!--more-->

I understand the appeal and I like the idea. They’re far more powerful than SQL and allow you to work magic. But they have some very serious problems that undermine them:

## They aren’t _agile_

These days, it’s essential that code and the tools surrounding it are flexible and capable of handling the need for change. One of the biggest (r)evolutions of Eclipse ADT compared to SE24 is that it allows you to rename classes, methods, parameters and variables with great ease and very little risk. It’s rare to get the names of things right first time, so I can easily change my mind halfway through the process. It also makes it easy to **adapt names** to new circumstances that may arise in the meantime. As for a CDS, though… forget it: you can’t rename it. You have to create a new one, then manually modify every place where it’s called, and finally delete the old one. In practice, what happens is that it ends up keeping the first name it was given forever, even when that might not be the best one.

## No proper encapsulation

There’s no way to properly encapsulate code. There’s no concept of public and private as there is with methods. Everything is public and accessible. Consequently, code that should be specific to a particular situation – and which shouldn’t be reused – ends up being available and becomes noise amidst everything else. It is true that we could use the [ABAP Package Concept][1] and _Package Interfaces_ to make some CDSs private to a package, but I think we all agree that the _ABAP Package Concept_, whilst conceptually excellent, is in practice so rigid and difficult to use that it ends up hindering more than it helps.

## No constants

In a CDS, you cannot reference ABAP constants. To make matters worse, there is also no way to create constants specifically for CDSs. The closest thing to constants that CDSs offer are _CDS Enumerated Types_. Not only do they not replace normal constants, but they are also not compatible with ABAP’s _Enumerations_. Apart from that, the recommended solution is to refer to domain values such as `zmessage_type.‘40’`. Consequently, there is no way to avoid CDSs becoming cluttered with potentially obscure magic literals.

## This will always result in spaghetti code

The problems I’ve described above aren’t just theoretical. They make it almost impossible to prevent CDS code from turning into spaghetti code.

If you can’t rename things easily, everything will keep its original name and tend to become obscure. As you can’t encapsulate, it becomes difficult to structure and everything ends up in a jumble. And to add to the confusion, the inability to use constants will leave the code riddled with magic numbers. Put all this together and, in a few years of evolutionary maintenance, you’ll always end up with spaghetti code.

It’s very sad that such a recent technology has all these problems. On the one hand, SAP is always talking about Clean Code, but on the other, it gives us this "new" technology that’s almost impossible to use without ending up in a messe. What a wasted opportunity!

It reminds me of Web Dynpros, that awful monolithic technology that was flawed from the start, and yet for a few years some people thought it was the best thing ever.

Dear SAP, please don’t take my rant the wrong way. I like you and I hope that in a future version you’ll manage to find a solution to all these problems.

Greetings from Abapinho.
