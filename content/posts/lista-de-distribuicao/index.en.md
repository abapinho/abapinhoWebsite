---
title: 'Send emails to a distribution list'
slug: lista-de-distribuicao
date: 2021-05-31 09:00:56
tags: []
categories: [dicas]
wordpressId: 4663
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['listas de distribuição']
---
When you need to send an email to multiple email addresses, the usual approach is to store that list of email addresses in a custom table and then add each one as recipient to the BCS request.

But I recently learned a much nicer way to achieve the same result.

<!--more-->

SAP has a standard functionality that allows you to create distribution lists. Through transaction SO23 you can create a list of distribution, give it a name, pick a folder and then add as many recipients are you wish (email addresses, usernames, other distribution lists, etc.).

Then, to use that distribution list in BCS, the only difference is in the way the recipient is created and added to the request:


{{< highlight ABAP >}}
recipient = cl_distributionlist_bcs=>getu_persistent(
  i_dliname = lv_mlrec
  i_private = space ).
request->add_recipient( recipient ).
{{< /highlight >}}

The rest remains the same.

Photo credit by [doug turetsky][1].

Greetings from Abapinho.

   [1]: https://visualhunt.co/a6/904f753c
