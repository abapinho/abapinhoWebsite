---
title: "The transaction who wanted to call another and couldn't"
slug: a-transaccao-que-queria-chamar-outra-e-nao-podia
date: 2017-02-06 09:00:24
tags: [segredo, seguranca, sysadmin]
categories: [artigos]
wordpressId: 3726
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['transacção faz call transaction']
description: 'Ensina-se aqui uma forma airosa, ainda que bizarra, para conseguir que uma transacção A chame uma transacção B mesmo quando não se tem acesso a ela.'
---
John created transaction ZFB01 and associated it with program ZFB01 which, after doing some stuff, does a CALL TRANSACTION on FB01. Then came his friend Mike and ran transaction ZFB01.

He managed to start running it because he had permissions to do it. But half way through he got an error because he doesn't have permissions to run transaction FB01.

Both John and Mike knew that the system administrators would never ever give Mike permission to run FB01.

<!--more-->

And that's when they remembered about SE97,

Transaction SE97 allows you to say that, when you're running a given transaction, the authorization checks for a list of other transactions can be skipped when you submit them using CALL TRANSACTION.

So first they chose transaction ZFB01:

[![][1]][1]

Then they added transaction FB01 and said they didn't want any authorization checks on it:

[![][2]][2]

As you can infer by the columns you can even configure it to show a warning instead of halting with an error:

[![][3]][3]

John and Mike never told this to anyone and lived happily ever after.

Greetings from Abapinho.

   [1]: images/fe97a.jpg
   [2]: images/fe97b.jpg
   [3]: images/fe97c.jpg
