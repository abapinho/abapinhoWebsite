---
title: 'Dot and comma or comma and dot?'
slug: ponto-e-virgula-ou-virgula-e-ponto
date: 2012-06-11 09:00:34
tags: [ddic]
categories: [dicas]
wordpressId: 1756
draft: false
resources:
- name: featuredImage
  src: 'images/thumbnail.jpg'
---
Some numbers have dots, some numbers have commas and some numbers have dots and commas. The problem is that there are also numbers that have commas and dots. The thing is, there are commas that are dots and dots that are commas, depending on where you are from, in other words, depending on user’s configurations. When importing a file with decimal numbers, these numbers’ alpha-numeric fields must be converted into numeric fields. It is not uncommon for this conversion to be carried out manually or even with the feet but there is a function module that makes life easier and converts it clearly and automatically:

MOVE_CHAR_TO_NUM.

Note: When tested in SE37, this function module appears not to be able to handle decimal places but when used programmatically it works properly.

Thank you to Bruno Esperança for the tip.
And thanks to [ImipolexG][1] for the photo.

Greetings from Abapinho.

   [1]: https://www.flickr.com/photos/imipolexg/3228161164/
