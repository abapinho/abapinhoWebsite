---
title: 'APPEND STRUCTURES do more stuff than I thought'
slug: append-structures-do-more-stuff-than-i-thought
date: 2016-10-17 09:00:06
tags: [ddic, segredo]
categories: [dicas]
wordpressId: 3634
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
keywords: ['append structure foreign key']
---
During all my ABAPian life I was convinced that APPEND STRUCTURES had one single purpose: to add new extra fields to an existing standard table.

But I recently learned that they let you do two more things after all:

<!--more-->

  * Add a foreign key to an existing field

  * Add a search-help to an existing field

SAP mentions it [here][1]

There is a small trick, though. When you’re changing your append structure, even when it doesn’t have any field defined, you’ll find that there’s a button called “show appending Obj” which shows all the fields from the original table. Once you see them you just have to pick the field you want and configure its foreign key and search-help.

We’re always learning.

Photo credit: [Sugar Daze][2] via [VisualHunt.com][3] / [CC BY-NC-ND][4]

Greetings from Abapinho.

   [1]: https://help.sap.com/saphelp_nw73/helpdata/en/cf/21ebc9446011d189700000e8322d00/content.htm
   [2]: https://www.flickr.com/photos/catbeurnier/3114941639/
   [3]: https://visualhunt.com
   [4]: https://creativecommons.org/licenses/by-nc-nd/2.0/
