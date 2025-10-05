---
slug: porque-modify
title: Why always MODIFY?
description: You have INSERT and UPDATE, why not use them instead of MODIFY?
date: 2025-10-06T09:00:00+01:00
tags: [estilo]
categories: [artigos]
keywords: [MODIFY]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

It is a common practice in ABAP to use MODIFY instead of INSERT and UPDATE. Do you do it too? Tell me why. Is it laziness? Is it fear? Is it just a matter of "whatever"? Or is it more like "screw it"?

<!--more-->

INSERT and UPDATE are two radically different operations and should be treated as such.

Stop it! Stop using `MODIFY` for no good reason. I'll give you two reasons why:

The first is that, while `UPDATE` requires locking objects to avoid concurrency, `INSERT` is a safe operation that doesn't need them at all. Now, I've seen both situations: some use `MODIFY` without locking objects, which is a "let's hope it doesn't mess up" situation, and those that `MODIFY` with locking objects that aren't really needed, which is a "whatever" situation. Both are examples of bad programming.

And the second is that you should strive to make your code easy to understand for those who come after you. When someone finds a `MODIFY` in code they don't know, it better have a decent comment nearby to make it clear whether it's inserting new or changing existing records, because otherwise you've just caused them a complicated problem: now they're going to have a hard time trying to figure out what the hell you're doing there. Hard work that you could have been avoided. I've been through this several times.

`MODIFY` is like `CATCH cx_root`. Both are pests that need to be eradicated.

I won't go so far as to say that `MODIFY` should never be used. Perhaps in cases where performance is important and you have to process lots of rows that may be new or already exist. But otherwise, I don't see the need for it. Do you?

Even if there are scenarios where `MODIFY` might make sense, they are exceptional and very specific. Surely not the case of most of the `MODIFY` I have come across and continue to come across.

And there are many. I've been on a project where there were so many and so problematic that they were considering doing a project just to replace them with `INSERT` or `UPDATE`, _comme il faut_.

Greetings from Abapinho.
