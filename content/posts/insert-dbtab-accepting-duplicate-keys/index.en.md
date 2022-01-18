---
title: 'INSERT dbtab ACCEPTING DUPLICATE KEYS'
slug: insert-dbtab-accepting-duplicate-keys
date: 2016-07-07 09:00:10
tags: [database]
categories: [dicas]
wordpressId: 3574
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['duplicate']
---
When you try to insert a record with a key which already exists in the table the program dumps. This, in some cases, is not desirable because, even if you don't care, it forces you to check if the keys already exist before trying to insert then.

But ABAP has a solution for these situations:


{{< highlight ABAP >}}

INSERT dbtab FROM TABLE itab [ACCEPTING DUPLICATE KEYS].
{{< /highlight >}}

Don't worry because this will not violate the first law of thermodynamics: the duplicate records are not inserted. The only difference is that the program will not dump.

Greetings from Abapinho.
