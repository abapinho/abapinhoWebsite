---
slug: up-to-1-rows
title: SELECT single record using an incomplete key
description: What is the proper way to select one record using an incomplete key?
date: 2022-11-28T09:00:00Z
tags: [sql]
categories: [dicas]
keywords: [up to 1 rows]
resources:
- name: featuredImage
  src: 'images/thumbnail.png'
---

I was always told that, when selecting a single record, I should use `UP TO 1 ROWS` whenever the key was not fully provided. My elementary school teacher told me that I should always aks why: why? Nobody ever told me why.

<!--more-->

Some days ago I went looking for answers and found [this post][1] by Horst Keller. According to Horst, `SELECT SINGLE` doesn't allow for `ORDER BY` which is important since, without a full key, the resulting record is undetermined. So, `ORDER BY` is "highly recommende`".

Ok. It makes sense and I've always done that.

But what about when you know that the order is totally indifferent? We should probably still use `UP TO 1 ROWS` instead of `SELECT SINGLE` so that someone else doesn't come along and badmouth us.

Greetings from Abapinho

[1]: <https://blogs.sap.com/2016/06/11/select-single-vs-select-up-to-1-rows/>
