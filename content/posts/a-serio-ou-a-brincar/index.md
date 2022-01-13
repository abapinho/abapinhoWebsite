---
title: 'É a sério ou a brincar?'
slug: a-serio-ou-a-brincar
date: 2012-10-08 09:00:16
tags: []
categories: [dicas]
wordpressId: 1994
draft: false
resources:
- name: featuredImage
  src: "images/thumbnail.jpg"
---
Há coisas que só podem mesmo acontecer em produtivo.
Outras há que muito pelo contrário

<!--more-->

Por exemplo, não é incomum um programa enviar emails para clientes ou para utilizadores. No entanto, durante os testes, é indesejável que estes emails lhes sejam enviados.

Há uma forma simples de verificar se estamos em produtivo: usar a função PRGN_CHECK_SYSTEM_PRODUCTIVE.

Se olharem para o código vão ver que ela se limita a verificar se a flag T000-CCCATEGORY = 'P'.

Nota: Convém confirmarem que no vosso sistema as coisas estão bem definidas, ou seja, que em DEV e em QAS a flag não é igual a P. Por exemplo, no projecto onde estou isto não funciona porque QAS é copiado directamente de PRD e fica lá com P também.

Obrigado [NASA's Marshall Space Flight Center][1] pela foto.

O Abapinho saúda-vos.

   [1]: http://www.flickr.com/photos/nasamarshall/6956818526
