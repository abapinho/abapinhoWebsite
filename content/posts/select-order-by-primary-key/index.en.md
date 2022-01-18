---
title: 'SELECT... ...ORDER BY PRIMARY KEY'
slug: select-order-by-primary-key
date: 2013-11-18 09:00:43
tags: [sql]
categories: [dicas]
wordpressId: 2481
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Although I have been using ABAP since 1998, I learn new features or options every week, and sometimes even new commands. It’s hard to believe.

Today, I’ll share a little SQL option that I recently discovered.


{{< highlight ABAP >}}
SELECT * FROM T001
INTO TABLE T_T001
ORDER BY PRIMARY KEY.
{{< /highlight >}}

I have known SELECT, FROM, INTO, TABLE and even ORDER BY for a long time. I just didn’t know of PRIMARY KEY.

It orders the internal table by its key. Convenient.

Greetings from Abapinho.
