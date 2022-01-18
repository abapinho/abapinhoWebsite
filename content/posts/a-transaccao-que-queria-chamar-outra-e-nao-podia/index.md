---
title: 'A transacção que queria chamar outra e não podia'
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
O Manelinho criou a transacção ZFB01 associada ao programa ZFB01 que faz lá umas coisas e depois faz CALL TRANSACTION à FB01. A seguir veio o Joãozinho e correu a transacção ZFB01.

Conseguiu começar a corrê-la porque tem permissões para a transacção ZFB01. Mas a meio teve um erro porque não tem permissões para a transacção FB01.

Tanto o Manelinho como o Joãozinho sabiam que os administradores de sistema nunca na vida deles darão ao Joãozinho autorizações para correr a FB01.

<!--more-->

Então lembraram-se da transacção SE97.

A transacção SE97 permite definir que, quando estás a correr uma dada transacção, não serão feitas verificações de permissões para fazer CALL TRANSACTION a determinadas outras transacções.

Primeiro escolheram a transacção ZFB01:

[![][1]][1]

Depois acrescentaram a transacção FB01 e disseram que não queriam que fossem verificadas permissões:

[![][2]][2]

Como podes ver pelas colunas até dá para configurares a coisa de forma a que dê um aviso em vez de um erro:

[![][3]][3]

O Manelinho e o Joãozinho nunca contaram isto a ninguém e viveram felizes para sempre.

O Abapinho saúda-vos.

   [1]: images/fe97a.jpg
   [2]: images/fe97b.jpg
   [3]: images/fe97c.jpg
