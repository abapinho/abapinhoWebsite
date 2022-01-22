---
title: 'Maintaining table maintenance authorisation groups'
slug: se54
date: 2012-11-19 09:00:24
tags: [ddic, sysadmin]
categories: [dicas]
wordpressId: 2071
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
There are some projects in which the authorisations group associated with table maintenance is always &NC;&, that is, Not Classified. It signals that everything there is friendly and nobody is hurting anyone else. But there are other projects where authorisation groups are taken seriously. But this is not synonymous with saying that they are organised. Serious or not, usually it all ends in a big mess, with nobody knowing who is authorised to do what.

This tip may help.

<!--more-->

When you create maintenance screens of a Z table, you have to assign a group of authorisations. This is normally done in the update dialog generation screen (transaction SE55 normally accessed from SE11).

![][1]

You now know that there is a transaction where you can see all the authorisation groups associated to tables: SE54. Therefore it is very easy for instance to undertake joint maintenance of all authorisation groups associated with our tables.

![][2]

In SE54 choose the option "Assign authorisation group" and you will come to this useful list of tables:

![][3]

The screens shown only have one table, but if you choose Z to ZZZZZZZ from the selection all the Z tables will appear.

This is, I think, the dream of any system administrator.

Thanks to Sérgio Fraga for the tip.

Thanks to [Beijing Patrol][4] for the photo.

Greetings from Abapinho.

   [1]: images/se54-1.png (se54-1)
   [2]: images/se54-2.png (se54-2)
   [3]: images/se54-3.png (se54-3)
   [4]: https://www.flickr.com/photos/securityguard/3575140798/
