---
title: 'Go into a transaction skipping its selection screen'
slug: transaccao-sem-ecra-de-seleccao
date: 2017-07-12 09:00:53
tags: [sapgui]
categories: [dicas]
wordpressId: 3815
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['transacção sem ecrã de selecção']
description: 'Descobre o atalho secreto para entrar numa transacção se ter de passar pelo ecrã de selecção, usando os últimos dados guardados.'
---
Once again SAPGui surprises me with yet another obscure shortcut I didn't know about.

Let's use the customer display transaction XD03 as an example:

  1. Go into the transaction's selection screen with /NXD03

  2. Fill in the customer number an press ENTER to display its details

  3. Do whatever it is you want to do there and get out of it

  4. Suddenly... you remember that you needed to do something else there

  5. Instead of /NXD03 type /*XD03

  6. You're now automagically inside the transaction, already looking at the details of the last displayed customer

It's surprising that no one ever told me about this before.

I also tried it with FB03 and it works so it probably works with most of the normal transactions. Unfortunately, it doesn't work with the ones I use the most: SE24, SE38 e SE11. What a pity.

Now go and tell everyone about this!

Thank you Sérgio Fraga for the tip.

Photo credit: [Leonard J Matthews][1].

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/mythoto/9720925815/
