---
title: 'Local dummy functions named after remote RFC functions'
slug: funcoes-manequins
date: 2021-05-10 09:00:54
tags: [estilo]
categories: [dicas]
wordpressId: 4640
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['dummy function module']
description: 'Cria funções manequins locais com o mesmo nome de funções chamadas por RFC noutros sistemas SAP.'
---
I recently started working in a new customer and noticed something they do here which I really liked. Whenever they need to call a remote function module by RFC in another SAP system, they create a local function module with the same name and leave it empty, except for a comment explaining that it is a dummy function for that remote function call.

Thanks to this simple trick, one can use the where-used tool to find out where it is being called. It's great.

Greetings from Abapinho.
