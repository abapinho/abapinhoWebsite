---
title: "Edit transport requests even if they don't let you"
slug: altera-ordens-de-transporte
date: 2018-01-22 09:00:15
tags: [segredo, seguranca]
categories: [dicas]
wordpressId: 3923
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['liberar ordens sem autorização']
description: 'Aprende como alterar e liberar ordens de transporte num sistema de desenvolvimento mesmo que não tenhas permissõse para o fazer.'
---
As we all know, system adminstrators are very bad, cold blooded and cruel people. To prove it you just need to read the [Bastard Operator from Hell][1].

We, ABAP programmers, are hopeless victims in the hands of these evil creatures.

But not always do we have to be smashed under their hairy fingers.

<!--more-->

As when dealing with transport requests.

Sometimes those bad system administrators decide that us, poor programmers, should not have access to liberating or changing transport requests.

Here's what you should do to hack it:

To do everything except releasing the main transport request:

  1. Go to FM TR_AUTHORITY_CHECK_TRFUNCTION

  2. Do what you have to do

  3. (the debugger will stop in th FM)

  4. Press F7 to exit the FM, change SY-SUBRC to 0, press F8 to continue

  5. repeat the previous point for as many times as needed

To release the main transport request:

  1. Place a break-point in line 47 of FM TR_READ_PROJECT_SWITCH

  2. Release the transport request

  3. The first time it stops in line 47 clear variable EV_PRJ_STATE

  4. Laugh!

Thank you Gianni for the tip.

Greetings from Abapinho

   [1]: https://users.bestweb.net/~bofh/
