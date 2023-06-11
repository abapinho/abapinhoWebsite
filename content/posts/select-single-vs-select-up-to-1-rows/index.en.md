---
slug: select-single-vs-select-up-to-1-rows
title: SELECT SINGLE vs SELECT UP TO 1 ROWS
description: Vamos lá ver se nos decidimos sobre qual dos dois é melhor
date: 2023-06-12T09:00:00+01:00
tags: [sql]
categories: [dicas]
keywords: [SELECT SINGLE]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

Man, this is one of those endless discussions that will never get anywhere. Ditto trying to decide if you deserve to go on living if you put pineapple on your pizza or Philadelphia cheese on your sushi.

<!--more-->

When you want to retrieve a single record from a database table using the complete primary key there is no question: `SELECT SINGLE`. But what about when you have the incomplete primary key? Some time ago [there was a discussion][1] in the Clean ABAP repository about this. Most people said that they still preferred using `SELECT SINGLE`. Except when you need to reorder it since `SELECT SINGLE` doesn't support `ORDER BY`. But some people still said that if the primary key is incomplete, they use `SELECT UP TO 1 ROWS` to warn other programmers of that fact.

I, as [said there][2], always use `SELECT SINGLE`.

If you thought I was going to give you a definitive answer, I'm sorry. Just know that I do my best to avoid sushi with Philadelphia cheese.

Thank you [wuestenigel][3] for the [photo][4].

Greetings from Abapinho.

[1]: <https://github.com/SAP/styleguides/issues/179>
[2]: <https://github.com/SAP/styleguides/issues/179#issuecomment-775590910>
[3]: <https://visualhunt.co/a7/adf7703a>
[4]: <https://visualhunt.com/re10/5b377d5c>
