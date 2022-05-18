---
slug: select-for-update
title: SELECT FOR UPDATE
description: Se vais actualizar a seguir usa SELECT FOR UPDATE
date: 2022-05-23T09:09:09+01:00
tags: [sql, database]
categories: [dicas]
keywords: [SELECT FOR UPDATE]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
When you're going to modify existing records of a database table it is common to first `SELECT` them to see how they are and only then `UPDATE` them with what they will be.

<!--more-->
But ABAP is like a Fabergé egg. The more you look at it the more details you'll find. And now I found this one.

When you `SELECT` when you already know you're going to `UPDATE`, then at the end of the `SELECT` command you can add `FOR UPDATE` and ABAP will go ahead and lock those records for writing immediately.

Here's an example:

```ABAP
SELECT calories FROM cakes WHERE id = 'cupcake' FOR UPDATE.
```

It does have some [rules and constraints][2]. But still quick nice, hum?

Thank you Jason Pier for the [photo][1].

Greetings from Abapinho.

[1]: https://www.flickr.com/photos/jasonpier/5519425731/
[2]: https://help.sap.com/saphelp_nwce72/helpdata/en/4b/03fb92ea162593e10000000a42189b/content.htm
