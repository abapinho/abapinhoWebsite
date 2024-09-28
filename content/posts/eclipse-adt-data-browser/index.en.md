---
slug: eclipse-adt-data-browser
title: Eclipse ADT Data browser is much better than SE16N
description: Eclipse ADT Data browser is much better than SE16N
date: 2024-09-30T09:00:00+01:00
tags: [eclipse]
categories: [dicas]
keywords: [Eclipse ADT data browser]
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---

The tools that SAP provides for viewing the contents of database tables have always been very sketchy.

<!--more-->

## In SAPGUI

The best way to view the contents of a database table is to use the `SE16N` transaction, which was probably last updated in the same century that the Wright brothers invented the aeroplane. It allows you to choose the output fields, filter the fields by content and little else. You can't even sort. If you want something more sophisticated, you have to export the result to a file and then import it into Excel.

## In Eclipse ADT

When you do `F8` on a table, a new tab opens with the _Data browser_. This allows you to filter by fields and choose the output fields, offering a much more sophisticated interface.  However, you haven't seen anything yet. One of the buttons in the _Data browser_ is the _SQL Console_ which opens a console in a new tab with the SQL command used to show you that data. From here you can edit the SQL at will and immediately see the result. In other words, you can easily do `INNER JOIN`s and everything else that the database and SQL allow.

## Conclusion

So, if you're still using SAPGUI and you could be using Eclipse ADT, you're not the sharpest tool in the shed, are you?

Greetings from Abapinho
